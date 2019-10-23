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
import android.view.View
import androidx.test.core.app.ApplicationProvider
import com.facebook.react.bridge.JavaOnlyMap
import com.nhaarman.mockitokotlin2.mock
import com.nhaarman.mockitokotlin2.spy
import com.nhaarman.mockitokotlin2.verify
import com.reactlibrary.scene.nodes.views.CustomScrollBar
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner

/**
 * To represent node's properties map in tests we use [JavaOnlyMap] which
 * does not require native React's resources.
 */
@RunWith(RobolectricTestRunner::class)
class UiScrollBarNodeTest {

    private lateinit var context: Context
    private lateinit var viewSpy: CustomScrollBar
    private lateinit var node: UiScrollBarNode

    @Before
    fun setUp() {
        this.context = ApplicationProvider.getApplicationContext()
        this.viewSpy = spy(CustomScrollBar(context))
        this.node = object : UiScrollBarNode(JavaOnlyMap(), context, mock()) {
            override fun provideView(context: Context): View {
                return viewSpy
            }
        }
        node.build()
    }

    @Test
    fun shouldApplyThumbPositionWhenThumbPositionPropertyUpdated() {
        val thumbPosition = 0.43
        val props = JavaOnlyMap.of(UiScrollBarNode.PROP_THUMB_POSITION, thumbPosition)

        node.update(props)

        verify(viewSpy).thumbPosition = thumbPosition.toFloat()
    }

    @Test
    fun shouldApplyThumbSizeWhenThumbSizePropertyUpdated() {
        val thumbSize = 0.77
        val props = JavaOnlyMap.of(UiScrollBarNode.PROP_THUMB_SIZE, thumbSize)

        node.update(props)

        verify(viewSpy).thumbSize = thumbSize.toFloat()
    }

    @Test
    fun shouldApplyHorizontalOrientationWhenUpdated() {
        val props = JavaOnlyMap.of(UiScrollBarNode.PROP_ORIENTATION, UiScrollBarNode.ORIENTATION_HORIZONTAL)

        node.update(props)

        verify(viewSpy).isVertical = false
    }

}