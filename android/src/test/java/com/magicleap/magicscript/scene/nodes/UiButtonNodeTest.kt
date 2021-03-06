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
import android.graphics.Typeface
import android.view.View
import androidx.test.core.app.ApplicationProvider
import com.facebook.react.bridge.JavaOnlyMap
import com.facebook.react.bridge.ReadableMap
import com.google.ar.sceneform.math.Vector3
import com.magicleap.magicscript.R
import com.magicleap.magicscript.font.FontProvider
import com.magicleap.magicscript.font.FontStyle
import com.magicleap.magicscript.font.FontWeight
import com.magicleap.magicscript.icons.IconsRepository
import com.magicleap.magicscript.reactArrayOf
import com.magicleap.magicscript.reactMapOf
import com.magicleap.magicscript.scene.nodes.base.TransformNode
import com.magicleap.magicscript.scene.nodes.button.UiButtonNode
import com.magicleap.magicscript.scene.nodes.props.Alignment
import com.magicleap.magicscript.scene.nodes.views.CustomButton
import com.magicleap.magicscript.shouldEqualInexact
import com.magicleap.magicscript.utils.Utils
import com.magicleap.magicscript.utils.Vector2
import com.nhaarman.mockitokotlin2.*
import org.junit.Assert.assertEquals
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.mockito.ArgumentMatchers.anyBoolean
import org.mockito.ArgumentMatchers.anyString
import org.robolectric.RobolectricTestRunner

/**
 * To represent node's properties map in tests we use [JavaOnlyMap] which
 * does not require native React's resources.
 */
@RunWith(RobolectricTestRunner::class)
class UiButtonNodeTest {

    private lateinit var context: Context
    private lateinit var viewSpy: CustomButton
    private lateinit var providerTypeface: Typeface
    private lateinit var fontProvider: FontProvider
    private lateinit var iconsRepo: IconsRepository

    @Before
    fun setUp() {
        this.context = ApplicationProvider.getApplicationContext()
        this.viewSpy = spy(CustomButton(context))
        this.providerTypeface = Typeface.DEFAULT_BOLD
        this.fontProvider = object : FontProvider {
            override fun provideFont(fontStyle: FontStyle?, fontWeight: FontWeight?): Typeface {
                return providerTypeface
            }
        }
        this.iconsRepo = mock()
        val sampleIcon = context.getDrawable(R.drawable.add)
        whenever(iconsRepo.getIcon(anyString(), anyBoolean())).thenReturn(sampleIcon)
    }

    @Test
    fun `should use typeface from provider`() {
        val node = createTestableNode(JavaOnlyMap())

        node.build()

        verify(viewSpy).setTypeface(providerTypeface)
    }

    @Test
    fun `should have default text size`() {
        val node = createTestableNode(JavaOnlyMap())

        node.build()

        val textSize = node.getProperty(UiButtonNode.PROP_TEXT_SIZE)
        assertEquals(UiButtonNode.DEFAULT_TEXT_SIZE, textSize)
    }

    @Test
    fun `should have letters spacing`() {
        val node = createTestableNode(JavaOnlyMap())

        node.build()

        verify(viewSpy).setCharactersSpacing(0.03F)
    }

    @Test
    fun `should have default roundness`() {
        val node = createTestableNode(JavaOnlyMap())

        val roundness = node.getProperty(UiButtonNode.PROP_ROUNDNESS)

        assertEquals(UiButtonNode.DEFAULT_ROUNDNESS, roundness)
    }

    @Test
    fun `should apply text when text property present`() {
        val text = "ABC"
        val props = reactMapOf(UiButtonNode.PROP_TEXT, text)
        val node = createTestableNode(props)

        node.build()

        verify(viewSpy).text = text
    }

    @Test
    fun `should apply text size when text size property present`() {
        val textSize = 0.05F
        val props = reactMapOf(UiButtonNode.PROP_TEXT_SIZE, textSize)
        val node = createTestableNode(props)
        val textSizeInPixels = Utils.metersToFontPx(textSize, context).toFloat()

        node.build()

        verify(viewSpy).setTextSize(textSizeInPixels)
    }

    @Test
    fun `should apply text color when color property present`() {
        val textColor = reactArrayOf(1.0, 1.0, 1.0, 1.0)
        val props = reactMapOf(UiButtonNode.PROP_TEXT_COLOR, textColor)
        val node = createTestableNode(props)

        node.build()

        verify(viewSpy).setTextColor(0xFFFFFFFF.toInt())
    }

    @Test
    fun `should apply roundness when roundness property present`() {
        val roundness = 0.2
        val props = reactMapOf(UiButtonNode.PROP_ROUNDNESS, roundness)
        val node = createTestableNode(props)

        node.build()

        verify(viewSpy).roundnessFactor = roundness.toFloat()
    }

    @Test
    fun `should set icon when icon property present`() {
        val props = reactMapOf(UiButtonNode.PROP_ICON_TYPE, "magic-icon")
        val node = createTestableNode(props)

        node.build()

        verify(viewSpy).setIcon(any())
    }

    @Test
    fun `should set icon color when icon color property present`() {
        val color = reactArrayOf(0.1, 0.2, 0.3, 0.4)
        val props = reactMapOf(
            UiButtonNode.PROP_ICON_TYPE, "magic-icon",
            UiButtonNode.PROP_ICON_COLOR, color
        )
        val node = createTestableNode(props)

        node.build()

        verify(viewSpy).setIconColor(any())
    }

    @Test
    fun `should set icon size when icon size property present`() {
        val sizeInMeters = 0.1
        val iconSize = reactArrayOf(sizeInMeters, sizeInMeters)
        val props = reactMapOf(
            UiButtonNode.PROP_ICON_TYPE, "magic-icon",
            UiButtonNode.PROP_ICON_SIZE, iconSize
        )
        val node = createTestableNode(props)

        node.build()

        val sizeInPixels = Utils.metersToPx(sizeInMeters.toFloat(), context).toFloat()
        verify(viewSpy).iconSize = Vector2(sizeInPixels, sizeInPixels)
    }

    @Test
    fun `should not change hardcoded alignment`() {
        val props = reactMapOf(TransformNode.PROP_ALIGNMENT, "bottom-right")
        val node = createTestableNode(props)

        node.build()

        assertEquals(Alignment.Horizontal.CENTER, node.horizontalAlignment)
        assertEquals(Alignment.Vertical.CENTER, node.verticalAlignment)
    }

    @Test
    fun `should return correct bounds`() {
        val props = reactMapOf(
            TransformNode.PROP_LOCAL_POSITION, reactArrayOf(-1.0, 1.0, 0.0),
            UiButtonNode.PROP_WIDTH, 2.0, UiButtonNode.PROP_HEIGHT, 1.0
        )
        val node = createTestableNode(props)
        node.build()

        val bounding = node.getBounding()

        bounding.min shouldEqualInexact Vector3(-2f, 0.5f, 0f)
        bounding.max shouldEqualInexact Vector3(0f, 1.5f, 0f)
    }

    @Test
    fun `should return correct bounds when scaled`() {
        val scale = reactArrayOf(0.5, 0.5, 0.5)
        val props = reactMapOf(
            UiButtonNode.PROP_WIDTH, 2.0, UiButtonNode.PROP_HEIGHT, 1.0,
            TransformNode.PROP_LOCAL_SCALE, scale
        )
        val node = createTestableNode(props)
        node.build()

        val bounding = node.getBounding()

        bounding.min shouldEqualInexact Vector3(-0.5f, -0.25f, 0f)
        bounding.max shouldEqualInexact Vector3(0.5f, 0.25f, 0f)
    }

    @Test
    fun `should return correct bounding when rotated 90 degrees around Z`() {
        val rotation = reactArrayOf(0.0, 0.0, 0.7071068, 0.7071068)
        val node = createTestableNode(
            reactMapOf(
                UiButtonNode.PROP_WIDTH, 2.0,
                UiButtonNode.PROP_HEIGHT, 1.0,
                TransformNode.PROP_LOCAL_ROTATION, rotation
            )
        )
        node.build()

        val bounding = node.getBounding()

        bounding.min shouldEqualInexact Vector3(-0.5f, -1f, 0f)
        bounding.max shouldEqualInexact Vector3(0.5f, 1f, 0f)
    }

    @Test
    fun `should show icon text border and hide label when type is text-with-icon`() {
        val node = createTestableNode(
            reactMapOf(
                UiButtonNode.PROP_TYPE, "text-with-icon"
            )
        )

        node.build()

        verify(viewSpy).iconVisible = true
        verify(viewSpy).textVisible = true
        verify(viewSpy).borderEnabled = true
        verify(viewSpy).labelVisible = false
    }

    @Test
    fun `should show icon and hide text border label when type is icon`() {
        val node = createTestableNode(
            reactMapOf(
                UiButtonNode.PROP_TYPE, "icon"
            )
        )

        node.build()

        verify(viewSpy).iconVisible = true
        verify(viewSpy).textVisible = false
        verify(viewSpy).borderEnabled = false
        verify(viewSpy).labelVisible = false
    }

    @Test
    fun `should show icon label and hide text border when type is icon-with-label`() {
        val node = createTestableNode(
            reactMapOf(
                UiButtonNode.PROP_TYPE, "icon-with-label"
            )
        )

        node.build()

        verify(viewSpy).iconVisible = true
        verify(viewSpy).textVisible = false
        verify(viewSpy).borderEnabled = false
        verify(viewSpy).labelVisible = true
    }

    @Test
    fun `should show text border and hide label icon when type is text`() {
        val node = createTestableNode(
            reactMapOf(
                UiButtonNode.PROP_TYPE, "text"
            )
        )

        node.build()

        verify(viewSpy).iconVisible = false
        verify(viewSpy).textVisible = true
        verify(viewSpy).borderEnabled = true
        verify(viewSpy).labelVisible = false
    }

    @Test
    fun `should set top labelSite`() {
        val node = createTestableNode(
            reactMapOf(
                UiButtonNode.PROP_LABEL_SIDE, UiButtonNode.LABEL_SIDE_TOP
            )
        )

        node.build()

        verify(viewSpy).labelPosition = CustomButton.LabelPosition.TOP
    }

    @Test
    fun `should set right labelSite`() {
        val node = createTestableNode(
            reactMapOf(
                UiButtonNode.PROP_LABEL_SIDE, UiButtonNode.LABEL_SIDE_RIGHT
            )
        )

        node.build()

        verify(viewSpy).labelPosition = CustomButton.LabelPosition.RIGHT
    }

    @Test
    fun `should set bottom labelSite`() {
        val node = createTestableNode(
            reactMapOf(
                UiButtonNode.PROP_LABEL_SIDE, UiButtonNode.LABEL_SIDE_BOTTOM
            )
        )

        node.build()

        verify(viewSpy).labelPosition = CustomButton.LabelPosition.BOTTOM
    }

    @Test
    fun `should set left labelSite`() {
        val node = createTestableNode(
            reactMapOf(
                UiButtonNode.PROP_LABEL_SIDE, UiButtonNode.LABEL_SIDE_LEFT
            )
        )

        node.build()

        verify(viewSpy).labelPosition = CustomButton.LabelPosition.LEFT
    }

    private fun createTestableNode(props: ReadableMap): UiButtonNode {
        return object :
            UiButtonNode(props, context, mock(), mock(), fontProvider, iconsRepo) {
            override fun provideView(context: Context): View {
                return viewSpy
            }
        }
    }

}