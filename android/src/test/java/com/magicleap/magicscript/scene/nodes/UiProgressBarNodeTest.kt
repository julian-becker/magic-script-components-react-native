/*
 * Copyright (c) 2019-2020 Magic Leap, Inc. All Rights Reserved
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

package com.magicleap.magicscript.scene.nodes

import android.content.Context
import android.view.View
import androidx.test.core.app.ApplicationProvider
import com.facebook.react.bridge.JavaOnlyMap
import com.facebook.react.bridge.ReadableMap
import com.magicleap.magicscript.reactArrayOf
import com.magicleap.magicscript.reactMapOf
import com.nhaarman.mockitokotlin2.mock
import com.nhaarman.mockitokotlin2.spy
import com.nhaarman.mockitokotlin2.verify
import com.magicleap.magicscript.scene.nodes.base.TransformNode
import com.magicleap.magicscript.scene.nodes.props.Alignment
import com.magicleap.magicscript.scene.nodes.views.CustomProgressBar
import org.junit.Assert.assertEquals
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.mockito.ArgumentMatchers.anyInt
import org.robolectric.RobolectricTestRunner

/**
 * To represent node's properties map in tests we use [JavaOnlyMap] which
 * does not require native React's resources.
 */
@RunWith(RobolectricTestRunner::class)
class UiProgressBarNodeTest {

    private lateinit var context: Context
    private lateinit var viewSpy: CustomProgressBar

    @Before
    fun setUp() {
        this.context = ApplicationProvider.getApplicationContext()
        this.viewSpy = spy(CustomProgressBar(context))
    }

    @Test
    fun shouldHaveDefaultWidth() {
        val node = createNodeWithViewSpy(JavaOnlyMap())

        val width = node.getProperty(UiProgressBarNode.PROP_WIDTH)

        assertEquals(UiProgressBarNode.DEFAULT_WIDTH, width)
    }

    @Test
    fun shouldHaveDefaultHeight() {
        val node = createNodeWithViewSpy(JavaOnlyMap())

        val height = node.getProperty(UiProgressBarNode.PROP_HEIGHT)

        assertEquals(UiProgressBarNode.DEFAULT_HEIGHT, height)
    }

    @Test
    fun shouldApplyValueWhenValuePropertyPresent() {
        val value = 0.2
        val props = reactMapOf(UiProgressBarNode.PROP_VALUE, value)
        val node = createNodeWithViewSpy(props)

        node.build()

        verify(viewSpy).value = value.toFloat()
    }

    @Test
    fun shouldApplyMinValueWhenMinPropertyPresent() {
        val minValue = 10.0
        val props = reactMapOf(UiProgressBarNode.PROP_MIN, minValue)
        val node = createNodeWithViewSpy(props)

        node.build()

        verify(viewSpy).min = minValue.toFloat()
    }

    @Test
    fun shouldApplyMaxValueWhenMaxPropertyPresent() {
        val maxValue = 1000.0
        val props = reactMapOf(UiProgressBarNode.PROP_MAX, maxValue)
        val node = createNodeWithViewSpy(props)

        node.build()

        verify(viewSpy).max = maxValue.toFloat()
    }

    @Test
    fun shouldApplyProgressColorWhenColoPropertyPresent() {
        val beginColor = reactArrayOf(0.5, 0.5, 0.5, 0.5)
        val endColor = reactArrayOf(0.8, 0.8, 0.8, 0.8)
        val progressColor = reactMapOf(
            UiProgressBarNode.PROP_PROGRESS_COLOR_BEGIN, beginColor,
            UiProgressBarNode.PROP_PROGRESS_COLOR_END, endColor
        )
        val props = reactMapOf(UiProgressBarNode.PROP_PROGRESS_COLOR, progressColor)
        val node = createNodeWithViewSpy(props)

        node.build()

        verify(viewSpy).beginColor = anyInt()
        verify(viewSpy).endColor = anyInt()
    }

    @Test
    fun shouldNotChangeHardcodedAlignment() {
        val props = reactMapOf(TransformNode.PROP_ALIGNMENT, "top-right")
        val node = createNodeWithViewSpy(props)

        node.build()

        assertEquals(Alignment.Horizontal.CENTER, node.horizontalAlignment)
        assertEquals(Alignment.Vertical.CENTER, node.verticalAlignment)
    }

    private fun createNodeWithViewSpy(props: ReadableMap): UiProgressBarNode {
        return object : UiProgressBarNode(props, context, mock(), mock()) {
            override fun provideView(context: Context): View {
                return viewSpy
            }
        }
    }

}