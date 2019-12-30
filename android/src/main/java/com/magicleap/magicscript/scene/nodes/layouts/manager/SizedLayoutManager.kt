/*
 * Copyright (c) 2019 Magic Leap, Inc. All Rights Reserved
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

package com.magicleap.magicscript.scene.nodes.layouts.manager

import com.google.ar.sceneform.math.Vector3
import com.magicleap.magicscript.scene.nodes.base.LayoutParams
import com.magicleap.magicscript.scene.nodes.base.TransformNode
import com.magicleap.magicscript.scene.nodes.base.UiBaseLayout.Companion.WRAP_CONTENT_DIMENSION
import com.magicleap.magicscript.scene.nodes.props.Bounding
import com.magicleap.magicscript.utils.Vector2
import com.magicleap.magicscript.utils.getUserSpecifiedScale
import kotlin.math.min

abstract class SizedLayoutManager<T : LayoutParams> : LayoutManager<T> {

    protected var childrenList = listOf<TransformNode>()
        private set

    override fun layoutChildren(
        layoutParams: T,
        children: List<TransformNode>,
        childrenBounds: Map<Int, Bounding>
    ) {
        this.childrenList = children
        onPreLayout(children, childrenBounds, layoutParams)
        rescaleChildren(children, childrenBounds, layoutParams)

        val contentWidth = getContentWidth(childrenBounds, layoutParams)
        val contentHeight = getContentHeight(childrenBounds, layoutParams)
        val layoutSize = layoutParams.size

        val sizeLimitX = if (layoutSize.x == WRAP_CONTENT_DIMENSION) {
            contentWidth
        } else {
            layoutSize.x
        }

        val sizeLimitY = if (layoutSize.y == WRAP_CONTENT_DIMENSION) {
            contentHeight
        } else {
            layoutSize.y
        }

        val layoutSizeLimit = Vector2(sizeLimitX, sizeLimitY)
        // sum of children size including padding
        val contentSize = Vector2(contentWidth, contentHeight)

        for (i in children.indices) {
            val node = childrenList[i]
            val nodeBounds = childrenBounds.getValue(i)
            val nodeWidth = nodeBounds.right - nodeBounds.left
            val nodeHeight = nodeBounds.top - nodeBounds.bottom
            val boundsCenterX = nodeBounds.left + nodeWidth / 2
            val pivotOffsetX = node.localPosition.x - boundsCenterX // aligning according to center
            val boundsCenterY = nodeBounds.top - nodeHeight / 2
            val pivotOffsetY = node.localPosition.y - boundsCenterY // aligning according to center

            val nodeData = NodeInfo(node, i, nodeWidth, nodeHeight, pivotOffsetX, pivotOffsetY)

            layoutNode(nodeData, childrenBounds, contentSize, layoutSizeLimit, layoutParams)
        }
    }

    // sets the proper position for the child node
    protected abstract fun <T : LayoutParams> layoutNode(
        nodeInfo: NodeInfo,
        childrenBounds: Map<Int, Bounding>,
        contentSize: Vector2,
        layoutSizeLimit: Vector2,
        layoutParams: T
    )

    /**
     * Called before laying out the children
     */
    protected open fun onPreLayout(
        children: List<TransformNode>,
        childrenBounds: Map<Int, Bounding>,
        layoutParams: LayoutParams
    ) {
    }

    /**
     * Returns width of layout's content (including items padding) based on
     * provided [childrenBounds] and [layoutParams]
     */
    abstract fun getContentWidth(childrenBounds: Map<Int, Bounding>, layoutParams: T): Float

    /**
     * Returns height of layout's content (including items padding) based on
     * provided [childrenBounds] and [layoutParams]
     */
    abstract fun getContentHeight(childrenBounds: Map<Int, Bounding>, layoutParams: T): Float

    /**
     * Returns max allowed child width in meters.
     * It may return [Float.MAX_VALUE] if there is no width limit
     */
    abstract fun calculateMaxChildWidth(
        childIdx: Int,
        childrenBounds: Map<Int, Bounding>,
        layoutParams: T
    ): Float

    /**
     * Returns max allowed child height in meters.
     * It may return [Float.MAX_VALUE] if there is no height limit
     */
    abstract fun calculateMaxChildHeight(
        childIdx: Int,
        childrenBounds: Map<Int, Bounding>,
        layoutParams: T
    ): Float

    private fun rescaleChildren(
        children: List<TransformNode>,
        childrenBounds: Map<Int, Bounding>,
        layoutParams: T
    ) {
        for (i in children.indices) {
            val child = children[i]
            val childSize = (childrenBounds[i] ?: Bounding()).size()
            if (child.localScale.x > 0 && child.localScale.y > 0) {
                val childWidth = childSize.x / child.localScale.x
                val childHeight = childSize.y / child.localScale.y
                if (childWidth > 0 && childHeight > 0) {
                    val maxChildWidth = calculateMaxChildWidth(i, childrenBounds, layoutParams)
                    val maxChildHeight = calculateMaxChildHeight(i, childrenBounds, layoutParams)
                    val userSpecifiedScale = child.getUserSpecifiedScale() ?: Vector3.one()
                    val scaleX = min(maxChildWidth / childWidth, userSpecifiedScale.x)
                    val scaleY = min(maxChildHeight / childHeight, userSpecifiedScale.y)
                    val scaleXY = min(scaleX, scaleY) // scale saving width / height ratio
                    child.localScale = Vector3(scaleXY, scaleXY, child.localScale.z)
                }
            }
        }
    }

}
