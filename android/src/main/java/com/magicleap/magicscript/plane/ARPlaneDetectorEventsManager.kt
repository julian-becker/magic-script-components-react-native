package com.magicleap.magicscript.plane

import com.facebook.react.bridge.WritableMap

interface ARPlaneDetectorEventsManager {
    fun onPlaneUpdatedEventReceived(planes: WritableMap)
}