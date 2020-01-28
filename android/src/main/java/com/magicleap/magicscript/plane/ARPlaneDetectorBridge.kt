package com.magicleap.magicscript.plane

import com.facebook.react.bridge.WritableNativeArray
import com.facebook.react.bridge.WritableNativeMap
import com.google.ar.core.Plane

class ARPlaneDetectorBridge {

    private var onUpdateListener: OnPlaneUpdate? = null

    companion object {
        val INSTANCE = ARPlaneDetectorBridge()
    }

    fun onPlaneUpdate(planes: MutableCollection<Plane>) {
        val map = WritableNativeMap()
        planes.forEachIndexed { index, plane ->
            val planeMap = WritableNativeMap()
            planeMap.putArray("position", WritableNativeArray().apply {
                pushDouble(plane.centerPose.tx().toDouble())
                pushDouble(plane.centerPose.ty().toDouble())
                pushDouble(plane.centerPose.tz().toDouble())
            })
            planeMap.putArray("rotation", WritableNativeArray().apply {
                pushDouble(plane.centerPose.qx().toDouble())
                pushDouble(plane.centerPose.qy().toDouble())
                pushDouble(plane.centerPose.qz().toDouble())
            })
            map.putMap(index.toString(), planeMap)
        }
        onUpdateListener?.invoke(map)
    }

    fun addOnUpdateListener(listener: OnPlaneUpdate) {
        this.onUpdateListener = listener
    }
}