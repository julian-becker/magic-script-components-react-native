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

package com.magicleap.magicscript

import android.content.Context
import androidx.test.core.app.ApplicationProvider
import com.facebook.react.bridge.JavaOnlyMap
import com.facebook.react.bridge.ReactApplicationContext
import com.magicleap.magicscript.scene.UiNodesManager
import com.magicleap.magicscript.scene.nodes.*
import com.magicleap.magicscript.scene.nodes.layouts.PageViewNode
import com.magicleap.magicscript.scene.nodes.layouts.UiGridLayout
import com.magicleap.magicscript.scene.nodes.layouts.UiLinearLayout
import com.magicleap.magicscript.scene.nodes.layouts.UiRectLayout
import com.magicleap.magicscript.scene.nodes.toggle.ToggleGroupNode
import com.magicleap.magicscript.scene.nodes.toggle.UiToggleNode
import com.magicleap.magicscript.scene.nodes.video.VideoNode
import com.nhaarman.mockitokotlin2.eq
import com.nhaarman.mockitokotlin2.isA
import com.nhaarman.mockitokotlin2.mock
import com.nhaarman.mockitokotlin2.verify
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner

@RunWith(RobolectricTestRunner::class)
class ARComponentManagerTest {

    private lateinit var context: Context
    private lateinit var manager: ARComponentManager
    private lateinit var nodesManager: UiNodesManager
    private lateinit var eventsManager: EventsManager

    @Before
    fun setUp() {
        context = ApplicationProvider.getApplicationContext()
        nodesManager = mock()
        eventsManager = mock()
        manager = ARComponentManager(ReactApplicationContext(context), nodesManager, eventsManager)
    }

    // region Nodes

    @Test
    fun `should register group node`() {
        manager.createGroupNode(JavaOnlyMap(), "123")

        verify(nodesManager).registerNode(isA<GroupNode>(), eq("123"))
    }

    @Test
    fun `should register button node`() {
        manager.createButtonNode(JavaOnlyMap(), "123")

        verify(nodesManager).registerNode(isA<UiButtonNode>(), eq("123"))
    }

    @Test
    fun `should register image node`() {
        manager.createImageNode(JavaOnlyMap(), "123")

        verify(nodesManager).registerNode(isA<UiImageNode>(), eq("123"))
    }

    @Test
    fun `should register text node`() {
        manager.createTextNode(JavaOnlyMap(), "123")

        verify(nodesManager).registerNode(isA<UiTextNode>(), eq("123"))
    }

    @Test
    fun `should register text edit node`() {
        manager.createTextEditNode(JavaOnlyMap(), "123")

        verify(nodesManager).registerNode(isA<UiTextEditNode>(), eq("123"))
    }

    @Test
    fun `should register model node`() {
        manager.createModelNode(JavaOnlyMap(), "123")

        verify(nodesManager).registerNode(isA<ModelNode>(), eq("123"))
    }

    @Test
    fun `should register video node`() {
        manager.createVideoNode(JavaOnlyMap(), "123")

        verify(nodesManager).registerNode(isA<VideoNode>(), eq("123"))
    }

    @Test
    fun `should register scrollbar node`() {
        manager.createScrollBarNode(JavaOnlyMap(), "123")

        verify(nodesManager).registerNode(isA<UiScrollBarNode>(), eq("123"))
    }

    @Test
    fun `should register scrollview node`() {
        manager.createScrollViewNode(JavaOnlyMap(), "123")

        verify(nodesManager).registerNode(isA<UiScrollViewNode>(), eq("123"))
    }

    @Test
    fun `should register slider node`() {
        manager.createSliderNode(JavaOnlyMap(), "123")

        verify(nodesManager).registerNode(isA<UiSliderNode>(), eq("123"))
    }

    @Test
    fun `should register spinner node`() {
        manager.createSpinnerNode(JavaOnlyMap(), "123")

        verify(nodesManager).registerNode(isA<UiSpinnerNode>(), eq("123"))
    }

    @Test
    fun `should register circle confirmation node`() {
        manager.createCircleConfirmationNode(JavaOnlyMap(), "123")

        verify(nodesManager).registerNode(isA<UiCircleConfirmationNode>(), eq("123"))
    }

    @Test
    fun `should register toggle node`() {
        manager.createToggleNode(JavaOnlyMap(), "123")

        verify(nodesManager).registerNode(isA<UiToggleNode>(), eq("123"))
    }

    @Test
    fun `should register toggle group node`() {
        manager.createToggleGroupNode(JavaOnlyMap(), "123")

        verify(nodesManager).registerNode(isA<ToggleGroupNode>(), eq("123"))
    }

    @Test
    fun `should register progress bar node`() {
        manager.createProgressBarNode(JavaOnlyMap(), "123")

        verify(nodesManager).registerNode(isA<UiProgressBarNode>(), eq("123"))
    }

    @Test
    fun `should register line node`() {
        manager.createLineNode(JavaOnlyMap(), "123")

        verify(nodesManager).registerNode(isA<LineNode>(), eq("123"))
    }

    @Test
    fun `should register grid layout`() {
        manager.createGridLayoutNode(JavaOnlyMap(), "123")

        verify(nodesManager).registerNode(isA<UiGridLayout>(), eq("123"))
    }

    @Test
    fun `should register linear layout`() {
        manager.createLinearLayoutNode(JavaOnlyMap(), "123")

        verify(nodesManager).registerNode(isA<UiLinearLayout>(), eq("123"))
    }

    @Test
    fun `should register dropdown list node`() {
        manager.createDropdownListNode(JavaOnlyMap(), "123")

        verify(nodesManager).registerNode(isA<UiDropdownListNode>(), eq("123"))
    }

    @Test
    fun `should register dropdown list item node`() {
        manager.createDropdownListItemNode(JavaOnlyMap(), "123")

        verify(nodesManager).registerNode(isA<UiDropdownListItemNode>(), eq("123"))
    }

    @Test
    fun `should register webview node`() {
        manager.createWebViewNode(JavaOnlyMap(), "123")

        verify(nodesManager).registerNode(isA<UIWebViewNode>(), eq("123"))
    }

    @Test
    fun `should register rect layout`() {
        manager.createRectLayoutNode(JavaOnlyMap(), "123")

        verify(nodesManager).registerNode(isA<UiRectLayout>(), eq("123"))
    }

    @Test
    fun `should register listview item node`() {
        manager.createListViewItemNode(JavaOnlyMap(), "123")

        verify(nodesManager).registerNode(isA<UiListViewItemNode>(), eq("123"))
    }

    @Test
    fun `should register listview node`() {
        manager.createListViewNode(JavaOnlyMap(), "123")

        verify(nodesManager).registerNode(isA<UiListViewNode>(), eq("123"))
    }

    @Test
    fun `should register date picker node`() {
        manager.createDatePickerNode(JavaOnlyMap(), "123")

        verify(nodesManager).registerNode(isA<UiDatePickerNode>(), eq("123"))
    }

    @Test
    fun `should register time picker node`() {
        manager.createTimePickerNode(JavaOnlyMap(), "123")

        verify(nodesManager).registerNode(isA<UiTimePickerNode>(), eq("123"))
    }

    @Test
    fun `should register tab node`() {
        manager.createTabNode(JavaOnlyMap(), "123")

        verify(nodesManager).registerNode(isA<UiTabNode>(), eq("123"))
    }

    @Test
    fun `should register panel node`() {
        manager.createPanelNode(JavaOnlyMap(), "123")

        verify(nodesManager).registerNode(isA<PanelNode>(), eq("123"))
    }

    @Test
    fun `should register page view node`() {
        manager.createPageViewNode(JavaOnlyMap(), "123")

        verify(nodesManager).registerNode(isA<PageViewNode>(), eq("123"))
    }

    // endregion

    // region Events

    @Test
    fun `should add on activate event handler`() {
        manager.addOnActivateEventHandler("123")

        verify(eventsManager).addOnActivateEventHandler("123")
    }

    @Test
    fun `should add on press event handler`() {
        manager.addOnPressEventHandler("123")

        verify(eventsManager).addOnPressEventHandler("123")
    }

    @Test
    fun `should add on long press event handler`() {
        manager.addOnLongPressEventHandler("123")

        verify(eventsManager).addOnLongPressEventHandler("123")
    }

    @Test
    fun `should add on release event handler`() {
        manager.addOnReleaseEventHandler("123")

        verify(eventsManager).addOnReleaseEventHandler("123")
    }

    @Test
    fun `should add on focus gained event handler`() {
        manager.addOnFocusGainedEventHandler("123")

        verify(eventsManager).addOnFocusGainedEventHandler("123")
    }

    @Test
    fun `should add on focus lost event handler`() {
        manager.addOnFocusLostEventHandler("123")

        verify(eventsManager).addOnFocusLostEventHandler("123")
    }

    @Test
    fun `should add on update event handler`() {
        manager.addOnUpdateEventHandler("123")

        verify(eventsManager).addOnUpdateEventHandler("123")
    }

    @Test
    fun `should add on delete event handler`() {
        manager.addOnDeleteEventHandler("123")

        verify(eventsManager).addOnDeleteEventHandler("123")
    }

    @Test
    fun `should add on enabled event handler`() {
        manager.addOnEnabledEventHandler("123")

        verify(eventsManager).addOnEnabledEventHandler("123")
    }

    @Test
    fun `should add on disabled event handler`() {
        manager.addOnDisabledEventHandler("123")

        verify(eventsManager).addOnDisabledEventHandler("123")
    }

    @Test
    fun `should add on text changed event handler`() {
        manager.addOnTextChangedEventHandler("123")

        verify(eventsManager).addOnTextChangedEventHandler("123")
    }

    @Test
    fun `should add on toggle changed event handler`() {
        manager.addOnToggleChangedEventHandler("123")

        verify(eventsManager).addOnToggleChangedEventHandler("123")
    }

    @Test
    fun `should add on video prepared event handler`() {
        manager.addOnVideoPreparedEventHandler("123")

        verify(eventsManager).addOnVideoPreparedEventHandler("123")
    }


    // endregion

}