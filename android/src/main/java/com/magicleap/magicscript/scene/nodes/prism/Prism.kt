/*
 * Copyright (c) 2020 Magic Leap, Inc. All Rights Reserved
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.magicleap.magicscript.scene.nodes.prism

import android.content.Context
import android.net.Uri
import android.os.Bundle
import com.facebook.react.bridge.Arguments
import com.facebook.react.bridge.ReadableMap
import com.google.ar.core.Anchor
import com.google.ar.core.Pose
import com.google.ar.core.TrackingState
import com.google.ar.sceneform.AnchorNode
import com.google.ar.sceneform.Camera
import com.google.ar.sceneform.collision.Ray
import com.google.ar.sceneform.collision.RayHit
import com.google.ar.sceneform.math.Quaternion
import com.google.ar.sceneform.math.Vector3
import com.google.ar.sceneform.ux.TransformationSystem
import com.magicleap.magicscript.ar.AnchorCreator
import com.magicleap.magicscript.ar.ArResourcesProvider
import com.magicleap.magicscript.ar.BoundingBox
import com.magicleap.magicscript.ar.CustomArFragment
import com.magicleap.magicscript.ar.renderable.CubeRenderableBuilder
import com.magicleap.magicscript.ar.renderable.ModelRenderableLoader
import com.magicleap.magicscript.scene.ReactScene
import com.magicleap.magicscript.scene.nodes.base.ReactNode
import com.magicleap.magicscript.scene.nodes.base.TransformNode
import com.magicleap.magicscript.scene.nodes.props.AABB
import com.magicleap.magicscript.utils.*
import kotlin.math.max
import kotlin.math.sqrt

class Prism(
    initProps: ReadableMap,
    context: Context,
    private val modelLoader: ModelRenderableLoader,
    private val cubeBuilder: CubeRenderableBuilder,
    private val anchorCreator: AnchorCreator,
    private val arResourcesProvider: ArResourcesProvider,
    private val appInfoProvider: AppInfoProvider
) : AnchorNode(), ReactNode, ArResourcesProvider.CameraUpdatedListener,
    ArResourcesProvider.TransformationSystemListener, ArResourcesProvider.ArLoadedListener {

    companion object {
        const val PROP_SIZE = "size"
        const val PROP_SCALE = "scale"
        const val PROP_POSITION = "position"
        const val PROP_ROTATION = "orientation"
        const val PROP_POSITION_RELATIVE = "positionRelativeToCamera"
        const val PROP_ROTATION_RELATIVE = "orientationRelativeToCamera"
        const val PROP_MODE = "mode"
        const val PROP_ANCHOR_UUID = "anchorUuid"
        const val PROP_TITLE = "title"
        const val PROP_INTERACTIONS = "interactions"

        const val MODE_NORMAL = "normal"
        const val MODE_EDIT = "edit"

        private const val MENU_MARGIN_BOTTOM = 0.05f
        private const val MOVE_SENSITIVITY = 1f
    }

    val scale: Vector3 get() = container?.localScale ?: Vector3.one()

    var size: Vector3 = Vector3(2f, 2f, 0.3f)
        private set

    var onModeChanged: ((String) -> Unit)? = null
    var onScaleChanged: ((Vector3) -> Unit)? = null
    var onRotationChanged: ((Quaternion) -> Unit)? = null
    var onPositionChanged: ((Vector3) -> Unit)? = null

    private val screenSizePx = appInfoProvider.getScreenSizePx()

    private var properties = Arguments.toBundle(initProps) ?: Bundle()
    private var reactScene: ReactScene? = null
    private var container: PrismContentNode? = null
    private var childNode: TransformNode? = null
    private val menuNode: PrismMenu
    private var latestCameraPose: Pose
    private var manualRotationOffset = Quaternion.identity()
    private var requestedAnchorPose: Pose? = null
    private var requestedAnchorUuid: String? = null
    private var lastCreatedAnchor: Anchor? = null
    private var requestedScale: Vector3? = null
    private var interactions = Interactions()

    private var editMode: Boolean = false
        set(value) {
            if (field != value) {
                field = value
                handleEditModeChange(value)
            }
        }

    init {
        arResourcesProvider.addCameraUpdatedListener(this)
        arResourcesProvider.addTransformationSystemListener(this)
        arResourcesProvider.addArLoadedListener(this)

        latestCameraPose = arResourcesProvider.getCameraInfo().pose
            ?: Utils.createPose(Vector3.zero(), Quaternion.identity())

        val title = appInfoProvider.getAppName()
        menuNode = PrismMenu(context, arResourcesProvider, title)
        menuNode.isVisible = false

        properties.putDefault(PROP_POSITION, arrayListOf(0.0, 0.0, 0.0))
    }

    override val reactParent: ReactNode? get() = reactScene

    override val reactChildren: List<ReactNode>
        get() = container?.children?.filterIsInstance<TransformNode>() ?: listOf()

    fun anchorAtPlane(pose: Pose) {
        tryToAnchorAtPose(pose)
        adjustContainerRotation()
    }

    fun setScene(scene: ReactScene) {
        this.reactScene = scene
    }

    override fun update(props: ReadableMap) {
        val propsToUpdate = Arguments.toBundle(props) ?: Bundle()
        this.properties.putAll(propsToUpdate) // save new props
        applyProperties(propsToUpdate)
    }

    override fun addContent(child: ReactNode) {
        if (child !is TransformNode) {
            return
        }
        if (childNode != null) {
            logMessage("Prism child already added", true)
            return
        }
        childNode = child
        container?.let {
            it.setParent(this)
            it.addChild(child)
        }
        clipContent()
    }

    override fun removeContent(child: ReactNode) {
        if (child is TransformNode) {
            container?.removeChild(child)
        }

        if (child == childNode) {
            childNode = null
        }
    }

    override fun build() {
        applyProperties(properties)

        val size = properties.read(PROP_SIZE) ?: size
        arResourcesProvider.getTransformationSystem()?.let {
            buildContainer(it, size)
        }
        buildMenu()
    }

    private fun applyProperties(props: Bundle) {
        setInteractions(props)
        setMode(props)
        setSize(props)
        setPose(props)
        setScale(props)
        setAnchorUuid(props)
        setTitle(props)
    }

    private fun setInteractions(props: Bundle) {
        if (props.containsKey(PROP_INTERACTIONS)) {
            interactions = props.read(PROP_INTERACTIONS) ?: Interactions()
            if (interactions.isEmpty) {
                menuNode.hardInvisible = true
                menuNode.hide()
            } else {
                menuNode.hardInvisible = false
            }
        }
    }

    private fun buildContainer(transformationSystem: TransformationSystem, size: Vector3) {
        // detach old container if exists
        detachContainer()

        val packageName = appInfoProvider.getPackageName()
        val cornerModelPath = Uri.parse("android.resource://$packageName/raw/prism_corner")

        container = PrismContentNode(
            transformationSystem = transformationSystem,
            modelLoader = modelLoader,
            cubeBuilder = cubeBuilder,
            initialSize = size,
            cornerModelPath = cornerModelPath,
            interactions = interactions
        ).also { container ->
            container.setParent(this)

            requestedScale?.let {
                container.prismScaleController?.setScale(it)
                requestedScale = null
            }

            container.editModeActive = editMode

            if (childNode != null) {
                container.addChild(childNode)
            }

            container.scaleChangedListener = { scale ->
                adjustMenuPosition()
                onScaleChanged?.invoke(scale)
            }

            container.prismDragController?.onDragListener = { deltaPx ->
                scene?.camera?.let { camera ->
                    val worldDelta = getWorldTouchDelta(deltaPx, camera)
                    adjustPrismDistance(worldDelta)
                    onPositionChanged?.invoke(localPosition)
                }
            }

            container.prismRotationController?.onRotatedListener = { deltaRotation ->
                manualRotationOffset = Quaternion.multiply(manualRotationOffset, deltaRotation)
                adjustContainerRotation()
                onRotationChanged?.invoke(deltaRotation)
            }
        }
        adjustMenuPosition()
    }

    override fun onArLoaded(firstTime: Boolean) {
        if (!firstTime && !editMode) {
            // we have to re-create anchor, since session have changed
            // and old anchors are no longer valid
            setPose(properties)
            setAnchorUuid(properties)
        }
    }

    override fun onTransformationSystemChanged(transformationSystem: TransformationSystem) {
        buildContainer(transformationSystem, size)
    }

    override fun onCameraUpdated(cameraPose: Pose, state: TrackingState) {
        if (state != TrackingState.TRACKING) {
            return
        }

        val oldCameraPose = latestCameraPose
        latestCameraPose = cameraPose

        if (editMode && interactions.position) {
            movePrism(cameraPose, oldCameraPose)
        }

        adjustMenuVisibility()
        adjustMenuRotation()

        requestedAnchorPose?.let {
            if (!editMode) {
                tryToAnchorAtPose(it)
            }
        }

        requestedAnchorUuid?.let {
            tryToAnchorAtUuid(it)
        }

    }

    override fun onHostPause() {
        // no-op
    }

    override fun onHostResume() {
        // no-op
    }

    override fun onHostDestroy() {
        // no-op
    }

    override fun onDestroy() {
        container?.onDestroy()
        // Because Prism's container is a Transformable node, we should detach it explicitly.
        // See https://github.com/magic-script/magic-script-components-react-native/issues/494
        detachContainer()
        arResourcesProvider.removeCameraUpdatedListener(this)
        arResourcesProvider.removeTransformationSystemListener(this)
        arResourcesProvider.removeArLoadedListener(this)
    }

    // Prism can also be anchored through this function when initial placement is active
    override fun setAnchor(anchor: Anchor?) {
        super.setAnchor(anchor)

        requestedAnchorPose = null
        requestedAnchorUuid = null

        adjustMenuRotation()
        adjustMenuPosition()
    }

    private fun buildMenu() {
        menuNode.onEditClickListener = {
            editMode = !editMode
        }

        menuNode.build()
        addChild(menuNode)
        adjustMenuPosition()

        if (interactions.isEmpty) {
            menuNode.hardInvisible = true
            menuNode.hide()
        } else {
            menuNode.hardInvisible = false
        }
    }

    private fun adjustMenuPosition() {
        val scaleY = container?.localScale?.y ?: 1f
        val posY = (size.y * scaleY) / 2 + MENU_MARGIN_BOTTOM
        menuNode.localPosition = Vector3(0f, posY, 0f).rotatedBy(worldRotation.inverted())
    }

    private fun adjustMenuRotation() {
        menuNode.worldRotation = getLookAtCameraRotation()
    }

    private fun adjustContainerRotation() {
        val lookRotation = getLookAtCameraRotation()
        container?.worldRotation = Quaternion.multiply(lookRotation, manualRotationOffset)
    }

    private fun getLookAtCameraRotation(): Quaternion {
        val cameraPosition: Vector3 = latestCameraPose.getTranslationVector()
        val prismFlatPosition = Vector3(worldPosition.x, 0f, worldPosition.z)
        val cameraFlatPosition = Vector3(cameraPosition.x, 0f, cameraPosition.z)
        val direction = prismFlatPosition - cameraFlatPosition
        return Quaternion.lookRotation(direction, Vector3.up())
    }

    private fun adjustMenuVisibility() {
        scene?.camera?.let { camera ->
            val scale = container?.localScale ?: Vector3.one()
            val boxSize = Vector3(size.x * scale.x, size.y * scale.y, size.z * scale.z)
            val box = BoundingBox(boxSize, worldPosition)
            box.rotation = container?.worldRotation ?: Quaternion()
            val cameraPosition = latestCameraPose.getTranslationVector()
            val cameraRotation = latestCameraPose.getRotation()
            val rayDirection = Vector3.forward().rotatedBy(cameraRotation)
            val ray = Ray(cameraPosition, rayDirection)
            val collided = box.getRayIntersection(ray, RayHit())

            val onScreenPosition = camera.worldToScreenPoint(worldPosition)
            val prismCenterOnScreen = isInsideScreen(onScreenPosition)

            if (collided || prismCenterOnScreen) {
                if (!menuNode.isVisible) {
                    menuNode.showAnimated()
                }
            } else {
                menuNode.isVisible = false
            }
        }
    }

    // "sphere" movement depending on camera moves
    private fun movePrism(cameraPose: Pose, prevCameraPose: Pose) {
        val cameraPosition = cameraPose.getTranslationVector()
        val prevCameraPosition = prevCameraPose.getTranslationVector()
        val cameraRot = cameraPose.getRotation()

        val cameraToPrismDist = Vector3.subtract(localPosition, prevCameraPosition).length()
        val limitedDistance = getLimitedDistanceFromCamera(cameraToPrismDist)
        val offset = Vector3.forward().rotatedBy(cameraRot).scaled(limitedDistance)

        localPosition = cameraPosition + offset

        // look at camera
        adjustContainerRotation()
    }

    // forward <-> backward movement
    private fun adjustPrismDistance(touchDelta: Vector3) {
        val cameraPosition = latestCameraPose.getTranslationVector()
        val cameraRotation = latestCameraPose.getRotation()
        val distDifference = touchDelta.y * 400 * MOVE_SENSITIVITY
        val zOffset = Vector3.forward().rotatedBy(cameraRotation).scaled(distDifference)

        val desiredPosition = localPosition + zOffset
        val desiredDistanceFromCamera = (desiredPosition - cameraPosition).length()
        val limitedDistanceFromCamera = getLimitedDistanceFromCamera(desiredDistanceFromCamera)

        val direction = (desiredPosition - cameraPosition).normalized()
        localPosition = cameraPosition + direction.scaled(limitedDistanceFromCamera)
    }

    private fun isInsideScreen(point: Vector3): Boolean {
        return point.x in 0f..screenSizePx.x && point.y in 0f..screenSizePx.y
    }

    private fun setSize(props: Bundle) {
        props.read<Vector3>(PROP_SIZE)?.let { size ->
            if (size != this.size) {
                this.size = size
                container?.size = size
                adjustMenuPosition()
                clipContent()
            }
        }
    }

    private fun setPose(props: Bundle) {
        if (props.containsAny(PROP_POSITION, PROP_ROTATION)) {
            var position = properties.read(PROP_POSITION) ?: localPosition
            var rotation = properties.read(PROP_ROTATION) ?: localRotation

            val positionRelative = properties.read(PROP_POSITION_RELATIVE) ?: false
            val rotationRelative = properties.read(PROP_ROTATION_RELATIVE) ?: false

            if (positionRelative) {
                position += latestCameraPose.getTranslationVector()
            }

            if (rotationRelative) {
                rotation = Quaternion.multiply(rotation, latestCameraPose.getRotation())
            }

            if (editMode) {
                localPosition = position
                localRotation = rotation
            } else if (!hasAnchorUUID()) { // XR client anchor has a priority
                val pose = Utils.createPose(position, rotation)
                tryToAnchorAtPose(pose)
            }
        }
    }

    private fun setScale(props: Bundle) {
        props.read<Vector3>(PROP_SCALE)?.let { scale ->
            val scaleController = container?.prismScaleController
            if (scaleController != null) {
                scaleController.setScale(scale)
            } else {
                requestedScale = scale
            }
        }
    }

    private fun setAnchorUuid(props: Bundle) {
        props.read<String>(PROP_ANCHOR_UUID)?.let { anchorUuid ->
            tryToAnchorAtUuid(anchorUuid)
        }
    }

    private fun setMode(props: Bundle) {
        props.read<String>(PROP_MODE)?.let { mode ->
            editMode = (mode == MODE_EDIT)
        }
    }


    private fun setTitle(props: Bundle) {
        props.read<String>(PROP_TITLE)?.let { title ->
            menuNode.updateTitle(title)
        }
    }

    private fun handleEditModeChange(value: Boolean) {
        if (value) {
            // remove anchor, so we can change prism's local position while moving
            anchor = null
            requestedAnchorPose = null
        } else {
            // user has stopped moving the prism, so we anchor it to the final position
            val pose = Utils.createPose(localPosition, Quaternion())
            tryToAnchorAtPose(pose)
            adjustContainerRotation()
        }

        val container = this.container
        if (container != null) {
            container.editModeActive = value
        }
        onModeChanged?.invoke(if (value) MODE_EDIT else MODE_NORMAL)
    }

    private fun tryToAnchorAtPose(pose: Pose) {
        val anchorResult = anchorCreator.createAnchor(pose)
        if (anchorResult is DataResult.Success) {
            // it's important to release unused anchors
            lastCreatedAnchor?.detach()
            anchor = anchorResult.data
            lastCreatedAnchor = anchorResult.data
            requestedAnchorPose = null
        } else {
            // try anchoring later
            requestedAnchorPose = pose
        }
    }

    private fun tryToAnchorAtUuid(anchorUuid: String) {
        requestedAnchorUuid = anchorUuid

        val anchorNode = scene?.findByName(anchorUuid) as AnchorNode?
        anchorNode?.anchor?.let {
            anchor = it
            requestedAnchorUuid = null
        }
    }

    private fun clipContent() {
        val min = Vector3(-size.x / 2, -size.y / 2, -size.z / 2)
        val max = Vector3(size.x / 2, size.y / 2, size.z / 2)

        childNode?.clipBounds = AABB(min, max)
    }

    private fun detachContainer() {
        container?.let {
            if (children.contains(it)) {
                removeChild(it)
            }
        }
    }

    private fun hasAnchorUUID() = properties.getString(PROP_ANCHOR_UUID, "").isNotEmpty()

    // in edit mode prism cannot be too close or too far from camera
    private fun getLimitedDistanceFromCamera(desiredDistance: Float): Float {
        val sphereRadius = getSphereRadius()
        val maxDistance = CustomArFragment.FAR_CLIP_PLANE - sphereRadius
        return desiredDistance.coerceIn(sphereRadius, maxDistance)
    }

    // returns radius of a sphere that includes the prism
    private fun getSphereRadius(): Float {
        val actualSize = Vector3(size.x * scale.x, size.y * scale.y, size.z * scale.z)
        val longestEdge = max(actualSize.x, max(actualSize.y, actualSize.z))
        return sqrt(3f) * longestEdge / 2f
    }

    // converts screen touch delta in pixels to world delta in meters
    private fun getWorldTouchDelta(deltaPx: Vector3, camera: Camera): Vector3 {
        val startRay = camera.screenPointToRay(0f, 0f)
        val endRay = camera.screenPointToRay(deltaPx.x, deltaPx.y)
        return endRay.origin - startRay.origin
    }

}