package com.magicleap.magicscript.plane

import com.facebook.react.bridge.ReactContext
import com.facebook.react.bridge.WritableMap
import com.facebook.react.modules.core.DeviceEventManagerModule

class ARPlaneDetectorEvents(private val reactContext: ReactContext): ARPlaneDetectorEventsManager {

    override fun onPlaneUpdatedEventReceived(planes: WritableMap) {
        reactContext.getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter::class.java)
                .emit("onPlaneUpdated", planes)
    }


}