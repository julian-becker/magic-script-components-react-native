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

import com.reactlibrary.scene.nodes.props.Bounding
import android.graphics.PointF
import android.os.Bundle
import android.util.Log
import android.widget.EditText

/**
 * ==========Extension methods============
 */

fun Any.logMessage(message: String, warn: Boolean = false) {
    if (warn) {
        Log.w("AR_LOG_" + this.javaClass.name, message) //this.javaClass.name
    } else {
        Log.d("AR_LOG_" + this.javaClass.name, message) //this.javaClass.name
    }
}

/**
 * android.widget.EditText
 */
fun EditText.setTextAndMoveCursor(text: String) {
    this.setText("")
    this.append(text)
}

/**
 * android.graphics.PointF
 */
operator fun PointF.plus(other: PointF): PointF {
    return PointF(x + other.x, y + other.y)
}

operator fun PointF.minus(other: PointF): PointF {
    return PointF(x - other.x, y - other.y)
}

operator fun PointF.times(other: PointF): PointF {
    return PointF(x * other.x, y * other.y)
}

operator fun PointF.div(other: PointF): PointF {
    return PointF(if (other.x != 0F) {
        x / other.x
    } else {
        0F
    }, if (other.y != 0F) {
        y / other.y
    } else {
        0F
    })
}

operator fun PointF.div(other: Float): PointF {
    return div(PointF(other,other))
}

// operator fun PointF.plusAssign(other: PointF) {
//     x += other.x
//     y += other.y
// }

fun PointF.coerceIn(min: Float, max: Float): PointF {
    return PointF(x.coerceIn(min, max), y.coerceIn(min, max))
}

/**
 * android.os.Bundle
 */
fun Bundle.putDefaultDouble(name: String, value: Double) {
    if (!containsKey(name)) {
        putDouble(name, value)
    }
}

fun Bundle.putDefaultString(name: String, value: String) {
    if (!containsKey(name)) {
        putString(name, value)
    }
}

/**
 * com.reactlibrary.scene.nodes.props.Bounding
 */
 fun Bounding.getSize(): PointF {
     val width = right - left
     val height = top - bottom
     return PointF(width, height)
 }