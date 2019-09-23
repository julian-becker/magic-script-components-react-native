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

package com.reactlibrary.utils

import android.content.Context
import android.net.Uri
import android.os.Bundle
import androidx.test.core.app.ApplicationProvider
import com.google.ar.sceneform.math.Matrix
import com.google.ar.sceneform.math.Vector3
import com.reactlibrary.scene.nodes.props.Padding
import org.junit.Assert.*
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner

@RunWith(RobolectricTestRunner::class)
class PropertiesReaderTest {

    private lateinit var context: Context

    @Before
    fun setUp() {
        context = ApplicationProvider.getApplicationContext<Context>()
    }

    @Test
    fun `should return uri equivalent if provided url string`() {
        val path = "http://sample.com/file.mp4"
        val bundle = Bundle()
        val prop = "PROP_NAME"
        bundle.putString(prop, path)
        val expected = Uri.parse(path)

        val uri = PropertiesReader.readFilePath(bundle, prop, context)

        assertEquals(expected, uri)
    }

    @Test
    fun `should return null if there is no property to read vector from`() {
        val emptyBundle = Bundle()
        val prop = "PROP_NAME"

        val vector = PropertiesReader.readVector3(emptyBundle, prop)

        assertNull(vector)
    }

    @Test
    fun `should return null if property is list and size is not equal to 3`() {
        val bundle = Bundle()
        val prop = "PROP_NAME"
        bundle.putSerializable(prop, arrayListOf(1.0, 2.0))

        val vector = PropertiesReader.readVector3(bundle, prop)

        assertNull(vector)
    }

    @Test
    fun `should return vector if property is list and size is equal to 3`() {
        val bundle = Bundle()
        val prop = "PROP_NAME"
        bundle.putSerializable(prop, arrayListOf(1.0, 2.0, 3.0))

        val vector = PropertiesReader.readVector3(bundle, prop)

        assertNotNull(vector)
        assertTrue(vector is Vector3)
    }

    @Test
    fun `should return vectors list for list of 3 element double lists`() {
        val bundle = Bundle()
        val prop = "PROP_NAME"
        val element1 = arrayListOf(1.5, 1.5, 1.5)
        val element2 = arrayListOf(2.5, 2.5, 2.5)
        val elementsList = arrayListOf(element1, element2)
        bundle.putSerializable(prop, elementsList)

        val result = PropertiesReader.readVectorsList(bundle, prop)

        assertTrue(result.isNotEmpty())
    }

    @Test
    fun `should return empty list for list of 2 element double lists`() {
        val bundle = Bundle()
        val prop = "PROP_NAME"
        val element = arrayListOf(1.5, 1.5)
        val elementsList = arrayListOf(element)
        bundle.putSerializable(prop, elementsList)

        val result = PropertiesReader.readVectorsList(bundle, prop)

        assertTrue(result.isEmpty())
    }

    @Test
    fun `should return matrix for 16 elements double list`() {
        val bundle = Bundle()
        val prop = "PROP_NAME"
        val list = arrayListOf(
                1.0, 2.0, 3.0, 4.0,
                5.0, 6.0, 7.0, 8.0,
                9.0, 10.0, 11.0, 12.0,
                13.0, 14.0, 15.0, 16.0
        )
        bundle.putSerializable(prop, list)

        val result = PropertiesReader.readMatrix(bundle, prop)

        assertTrue(result is Matrix)
    }

    @Test
    fun `should return null for non 16 elements double list`() {
        val bundle = Bundle()
        val prop = "PROP_NAME"
        val list = arrayListOf(1.0, 2.0, 3.0, 4.0, 5.0, 6.0)
        bundle.putSerializable(prop, list)

        val result = PropertiesReader.readMatrix(bundle, prop)

        assertNull(result)
    }

    @Test
    fun `should return color if property is list and size is equal to 4`() {
        val bundle = Bundle()
        val prop = "PROP_NAME"
        val list = arrayListOf(1.0, 2.0, 3.0, 4.0)
        bundle.putSerializable(prop, list)

        val color = PropertiesReader.readColor(bundle, prop)

        assertNotNull(color)
        assertTrue(color is Int)
        assertTrue(color != 0)
    }

    @Test
    fun `should return padding if property is list and size is equal to 4`() {
        val bundle = Bundle()
        val prop = "PROP_NAME"
        val list = arrayListOf(1.0, 2.0, 3.0, 4.0)
        bundle.putSerializable(prop, list)

        val padding = PropertiesReader.readPadding(bundle, prop)

        assertNotNull(padding)
        assertTrue(padding is Padding)
    }

}