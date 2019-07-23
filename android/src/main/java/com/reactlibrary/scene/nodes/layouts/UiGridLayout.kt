package com.reactlibrary.scene.nodes.layouts

import android.os.Bundle
import android.os.Handler
import android.os.Looper
import com.facebook.react.bridge.ReadableMap
import com.google.ar.sceneform.Node
import com.reactlibrary.scene.nodes.Alignment
import com.reactlibrary.scene.nodes.base.TransformNode
import com.reactlibrary.scene.nodes.base.UiLayout
import com.reactlibrary.scene.nodes.layouts.manager.FlexGridManager
import com.reactlibrary.utils.Bounding
import com.reactlibrary.utils.Utils
import com.reactlibrary.utils.logMessage

class UiGridLayout(props: ReadableMap) : UiLayout(props) {

    companion object {
        // properties
        const val PROP_COLUMNS = "columns"
        const val PROP_ROWS = "rows"
        const val PROP_ITEM_PADDING = "itemPadding"
        const val PROP_ITEM_ALIGNMENT = "itemAlignment"

        private const val COLUMNS_DEFAULT = 2
        private const val ROWS_DEFAULT = 0 // 0 means unspecified (will grow with content)
    }

    var columns: Int = properties.getDouble(PROP_COLUMNS, COLUMNS_DEFAULT.toDouble()).toInt()
        private set

    var rows: Int = properties.getDouble(PROP_ROWS, ROWS_DEFAULT.toDouble()).toInt()
        private set

    var padding = properties.getDouble(PROP_ITEM_PADDING, 0.0) // in meters
        private set

    var itemHorizontalAlignment = Alignment.Horizontal.CENTER
        private set

    var itemVerticalAlignment = Alignment.Vertical.CENTER
        private set

    private var layoutManager: LayoutManager

    // we should re-draw the grid after adding / removing a child
    private var shouldRedraw = false

    private var handler = Handler(Looper.getMainLooper())

    // child index, bounding
    private val childrenBounds = mutableMapOf<Int, Bounding>()

    init {
        layoutManager = FlexGridManager(this)
        layoutLoop()
    }

    override fun loadRenderable(): Boolean {

        // for tests only
        handler.postDelayed({
            children.forEachIndexed { index, node ->
                val childBounds = if (node is TransformNode) node.getBounding() else Bounding()
                logMessage("child[$index] bounds= $childBounds")
            }

            val bounds = getBounding()
            logMessage("grid bounds= $bounds")
        }, 3000)

        return false
    }

    override fun applyProperties(props: Bundle) {
        super.applyProperties(props)
        setColumns(props)
        setRows(props)
        setItemPadding(props)
        setItemAlignment(props)
    }

    override fun getBounding(): Bounding {
        return Utils.calculateSumBounds(children)
    }

    override fun addChildNode(child: Node) {
        addChild(child)
        shouldRedraw = true
    }

    // re-draws the grid if needed
    private fun layoutLoop() {
        handler.postDelayed({
            measureChildren()
            if (shouldRedraw) {
                layoutManager.layoutChildren(children, childrenBounds)
                shouldRedraw = false
                logMessage("grid redraw")
            }
            layoutLoop()
        }, 100)
    }

    private fun measureChildren() {
        for (i in 0 until children.size) {
            val node = children[i]
            val previousBounds = childrenBounds[i]
            childrenBounds[i] = if (node is TransformNode) {
                node.getBounding()
            } else {
                Utils.calculateBoundsOfNode(node)
            }
            // TODO equals method should not be exact?
            if (childrenBounds[i] != previousBounds) {
                shouldRedraw = true
            }
        }
    }

    private fun setColumns(props: Bundle) {
        if (props.containsKey(PROP_COLUMNS)) {
            columns = props.getDouble(PROP_COLUMNS).toInt()
            if (columns <= 0) {
                columns = 1
            }
            shouldRedraw = true
        }
    }

    private fun setRows(props: Bundle) {
        if (props.containsKey(PROP_ROWS)) {
            this.rows = props.getDouble(PROP_ROWS).toInt()
            shouldRedraw = true
        }
    }

    private fun setItemPadding(props: Bundle) {
        if (props.containsKey(PROP_ITEM_PADDING)) {
            this.padding = props.getDouble(PROP_ITEM_PADDING)
            shouldRedraw = true
        }
    }

    private fun setItemAlignment(props: Bundle) {
        val alignment = props.getString(PROP_ITEM_ALIGNMENT)
        if (alignment != null) {
            val alignmentArray = alignment.split("-")
            if (alignmentArray.size == 2) {
                val horizontalAlign = alignmentArray[0]
                val verticalAlign = alignmentArray[1]
                itemHorizontalAlignment = Alignment.Horizontal.valueOf(horizontalAlign.toUpperCase())
                itemVerticalAlignment = Alignment.Vertical.valueOf(verticalAlign.toUpperCase())
            }
        }
    }

}