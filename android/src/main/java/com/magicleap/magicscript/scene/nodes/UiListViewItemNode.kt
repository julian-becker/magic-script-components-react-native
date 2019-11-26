package com.magicleap.magicscript.scene.nodes

import android.content.Context
import android.os.Bundle
import android.view.View
import com.facebook.react.bridge.ReadableMap
import com.google.ar.sceneform.Node
import com.google.ar.sceneform.math.Vector3
import com.magicleap.magicscript.ar.ViewRenderableLoader
import com.magicleap.magicscript.scene.nodes.base.Layoutable
import com.magicleap.magicscript.scene.nodes.base.TransformNode
import com.magicleap.magicscript.scene.nodes.base.UiNode
import com.magicleap.magicscript.scene.nodes.props.Bounding
import com.magicleap.magicscript.utils.PropertiesReader
import com.magicleap.magicscript.utils.Vector2
import com.magicleap.magicscript.utils.putDefault

open class UiListViewItemNode(initProps: ReadableMap,
                              context: Context,
                              viewRenderableLoader: ViewRenderableLoader)
    : UiNode(initProps, context, viewRenderableLoader), Layoutable {

    companion object {
        const val PROP_BACKGROUND_COLOR = "backgroundColor"
        const val CONTENT_Z_OFFSET = 1e-5f
        const val RENDER_PRIORITY = 3 // 4 is default, 3 means we draw background firstly

        val DEFAULT_BACKGROUND_COLOR = arrayListOf(0.0, 0.0, 0.0, 0.0)
    }

    private var lastContentBounds = Bounding()

    init {
        properties.putDefault(PROP_BACKGROUND_COLOR, DEFAULT_BACKGROUND_COLOR)

        onViewLoadedListener = { renderable ->
            renderable.renderPriority = RENDER_PRIORITY
        }
    }

    override fun provideView(context: Context): View {
        return View(context) // basic view as a background
    }

    override fun provideDesiredSize(): Vector2 {
        return lastContentBounds.size()
    }

    override fun applyProperties(props: Bundle) {
        super.applyProperties(props)
        setBackgroundColor(props)
    }

    override fun addContent(child: Node) {
        if (child !is TransformNode) {
            return
        }

        // only one child can be added
        if (contentNode.children.isEmpty()) {
            super.addContent(child)
        }
    }

    override fun setClipBounds(clipBounds: Bounding) {
        super.setClipBounds(clipBounds)
        // clip child item
        val localBounds = clipBounds.translate(-getContentPosition())
        contentNode.children
                .filterIsInstance<TransformNode>()
                .forEach { it.setClipBounds(localBounds) }
    }

    override fun onUpdate(deltaSeconds: Float) {
        super.onUpdate(deltaSeconds)

        // align the content node
        val content = contentNode.children.firstOrNull() as? TransformNode
        if (content != null) {
            val contentBounds = content.getBounding()
            if (!Bounding.equalInexact(contentBounds, lastContentBounds)) {
                val offsetX = content.localPosition.x - contentBounds.center().x
                val offsetY = content.localPosition.y - contentBounds.center().y
                content.localPosition = Vector3(offsetX, offsetY, CONTENT_Z_OFFSET)
                lastContentBounds = contentBounds
                setNeedsRebuild(true) // need to create a new background
            }
        }
    }

    private fun setBackgroundColor(props: Bundle) {
        val androidColor = PropertiesReader.readColor(props, PROP_BACKGROUND_COLOR)
        if (androidColor != null) {
            view.setBackgroundColor(androidColor)
        }
    }
}