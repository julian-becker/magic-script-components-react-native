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

package com.magicleap.magicscript.scene.nodes.props

import com.magicleap.magicscript.utils.Vector2
import kotlin.math.abs

/**
 * Represents bounds of a node
 */
data class Bounding(
    var left: Float = 0f,
    var bottom: Float = 0f,
    var right: Float = 0f,
    var top: Float = 0f
) {
    companion object {

        private const val eps = 1e-5 // epsilon

        /**
         * Compares 2 bounds and returns true if they are the same
         * with the accuracy of [eps]
         */
        fun equalInexact(a: Bounding, b: Bounding): Boolean {
            return abs(a.left - b.left) < eps
                    && abs(a.right - b.right) < eps
                    && abs(a.bottom - b.bottom) < eps
                    && abs(a.top - b.top) < eps

        }
    }

    fun size(): Vector2 {
        val width = right - left
        val height = top - bottom
        return Vector2(width, height)
    }

    fun center(): Vector2 {
        val x = (right + left) / 2F
        val y = (top + bottom) / 2F
        return Vector2(x, y)
    }

    // Get new Bounding equal to this translated by 2D vector.
    fun translate(translation: Vector2): Bounding {
        return Bounding(
            left + translation.x,
            bottom + translation.y,
            right + translation.x,
            top + translation.y
        )
    }
}