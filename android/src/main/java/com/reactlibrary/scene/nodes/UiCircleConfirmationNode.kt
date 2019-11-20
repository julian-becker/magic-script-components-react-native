/*
 *  Copyright (c) 2019 Magic Leap, Inc. All Rights Reserved
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 *   Unless required by applicable law or agreed to in writing, software
 *   distributed under the License is distributed on an "AS IS" BASIS,
 *   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *   See the License for the specific language governing permissions and
 *   limitations under the License.
 */

package com.reactlibrary.scene.nodes

import android.content.Context
import android.os.Bundle
import android.view.MotionEvent.ACTION_DOWN
import android.view.MotionEvent.ACTION_UP
import android.view.View
import com.facebook.react.bridge.ReadableMap
import com.reactlibrary.ar.ViewRenderableLoader
import com.reactlibrary.scene.nodes.base.UiNode
import com.reactlibrary.scene.nodes.views.CircleConfirmationView
import com.reactlibrary.utils.Vector2
import com.reactlibrary.utils.putDefault

open class UiCircleConfirmationNode(initProps: ReadableMap,
                                    context: Context,
                                    viewRenderableLoader: ViewRenderableLoader)
    : UiNode(initProps, context, viewRenderableLoader) {

    var onConfirmationCompletedListener: (() -> Unit)? = null
    var onConfirmationCanceledListener: (() -> Unit)? = null
    var onConfirmationUpdatedListener: ((value: Float) -> Unit)? = null

    companion object {
        // properties
        const val PROP_HEIGHT = "height" // radius of a circle

        const val DEFAULT_HEIGHT = 0.1
        const val TIME_TO_COMPLETE = 2F // in seconds
    }

    private var touching = false
    private var timeProgress = 0F
    private var completed = false

    init {
        properties.putDefault(PROP_HEIGHT, DEFAULT_HEIGHT)
    }

    override fun provideView(context: Context): View {
        return CircleConfirmationView(context)
    }

    override fun provideDesiredSize(): Vector2 {
        val radius = properties.getDouble(PROP_HEIGHT, DEFAULT_HEIGHT)
        val height = (radius * 2).toFloat()
        return Vector2(height, height)
    }

    override fun setupView() {
        super.setupView()

        view.setOnTouchListener { _, event ->
            when (event.actionMasked) {
                ACTION_DOWN -> {
                    touching = true
                    return@setOnTouchListener true
                }
                ACTION_UP -> {
                    touching = false
                    return@setOnTouchListener true
                }
            }
            return@setOnTouchListener false
        }
    }

    override fun applyProperties(props: Bundle) {
        super.applyProperties(props)

        if (props.containsKey(PROP_HEIGHT)) {
            setNeedsRebuild()
        }
    }

    override fun onUpdate(deltaSeconds: Float) {
        super.onUpdate(deltaSeconds)

        if (completed) {
            return
        }

        if (touching) {
            if (timeProgress < TIME_TO_COMPLETE) {
                timeProgress += deltaSeconds
                updateProgress()
                if (timeProgress >= TIME_TO_COMPLETE) {
                    onConfirmationCompletedListener?.invoke()
                    completed = true
                    return
                }
            }
        } else if (timeProgress > 0F) {
            timeProgress -= deltaSeconds
            updateProgress()
        }

    }

    private fun updateProgress() {
        val normalizedTime = timeProgress.coerceIn(0F, TIME_TO_COMPLETE)
        val progressValue = normalizedTime / TIME_TO_COMPLETE
        (view as CircleConfirmationView).value = progressValue
        onConfirmationUpdatedListener?.invoke(progressValue)
    }

}