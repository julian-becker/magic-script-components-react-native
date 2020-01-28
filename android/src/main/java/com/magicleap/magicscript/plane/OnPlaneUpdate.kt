package com.magicleap.magicscript.plane

import com.facebook.react.bridge.WritableMap

interface OnPlaneUpdate {
    fun invoke(payload: WritableMap)
}