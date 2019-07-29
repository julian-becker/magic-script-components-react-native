package com.reactlibrary.scene.nodes

import android.content.Context
import android.os.Bundle
import android.util.TypedValue
import android.view.LayoutInflater
import android.view.View
import android.widget.Switch
import com.facebook.react.bridge.ReadableMap
import com.reactlibrary.R
import com.reactlibrary.scene.nodes.base.UiNode
import com.reactlibrary.utils.PropertiesReader
import com.reactlibrary.utils.Utils

class UiToggleNode(props: ReadableMap, context: Context) : UiNode(props, context) {

    companion object {
        // properties
        private const val PROP_CHECKED = "on"
        private const val PROP_TEXT = "text"
        private const val PROP_TEXT_SIZE = "textSize"
        private const val PROP_TEXT_COLOR = "textColor"
    }

    var toggleChangedListener: ((on: Boolean) -> Unit)? = null

    override fun provideView(context: Context): View {
        val view = LayoutInflater.from(context).inflate(R.layout.toggle, null) as Switch
        view.setOnCheckedChangeListener { _, isChecked ->
            toggleChangedListener?.invoke(isChecked)
        }
        return view
    }

    override fun applyProperties(props: Bundle) {
        super.applyProperties(props)

        setIsChecked(props)
        setText(props)
        setTextSize(props)
        setTextColor(props)
    }

    private fun setIsChecked(props: Bundle) {
        if (props.containsKey(PROP_CHECKED)) {
            val isOn = props.getBoolean(PROP_CHECKED)
            (view as Switch).isChecked = isOn
        }
    }

    private fun setText(properties: Bundle) {
        val text = properties.getString(PROP_TEXT)
        if (text != null) {
            (view as Switch).text = text
        }
    }

    private fun setTextSize(props: Bundle) {
        if (props.containsKey(PROP_TEXT_SIZE)) {
            val sizeMeters = props.getDouble(PROP_TEXT_SIZE).toFloat()
            val size = Utils.metersToPx(sizeMeters, view.context).toFloat()
            (view as Switch).setTextSize(TypedValue.COMPLEX_UNIT_PX, size)
        }
    }

    private fun setTextColor(props: Bundle) {
        val color = PropertiesReader.readColor(props, PROP_TEXT_COLOR)
        if (color != null) {
            (view as Switch).setTextColor(color)
        }
    }

}