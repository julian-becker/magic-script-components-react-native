package com.magicleap.magicscript.plane

import com.facebook.react.bridge.WritableMap
import com.facebook.react.bridge.WritableNativeArray
import com.facebook.react.bridge.WritableNativeMap
import com.google.ar.core.Plane
import kotlin.math.abs

class ARPlaneDetectorBridge {
    private val ID = "id"
    private val CENTER = "center"
    private val VERTICES = "vertices"
    private var onUpdateListener: OnPlanesUpdated? = null
    private var onAddedListener: OnPlanesAdded? = null
    private var onRemovedListener: OnPlanesRemoved? = null
    private var lastPlanes: List<Plane>? = null
    private var isDetecting: Boolean = false

    companion object {
        val INSTANCE = ARPlaneDetectorBridge()
    }

    fun onPlaneUpdate(planes: List<Plane>) {
        if (planes.isNotEmpty())
            if (lastPlanes == null) {
                lastPlanes = planes
                planes.forEach {
                    onAddedListener?.invoke(mapPlanesToWritableMap(it))
                }
            } else if (lastPlanes != null && lastPlanes != planes) {
                filterAddedPlanes(planes)
                filterRemovedPlanes(planes)
                filterUpdatedPlanes(planes)
                lastPlanes = planes
            }
    }

    fun setOnPlanesAddedListener(listener: OnPlanesAdded) {
        this.onAddedListener = listener
    }

    fun setOnPlanesRemovedListener(listener: OnPlanesRemoved) {
        this.onRemovedListener = listener
    }

    fun setOnPlanesUpdatedListener(listener: OnPlanesUpdated) {
        this.onUpdateListener = listener
    }

    fun isDetecting() = isDetecting

    fun setIsDetecting(isDetecting: Boolean) {
        this.isDetecting = isDetecting
    }

    fun destroy() {
        this.onUpdateListener = null
        this.onAddedListener = null
        this.onRemovedListener = null
        this.lastPlanes = null
    }

    private fun mapPlanesToWritableMap(plane: Plane): WritableMap {
        val planeMap = WritableNativeMap()
        val vertices = WritableNativeArray()
        val polygonList = plane.polygon.array().toList()
        val centerPose = plane.centerPose
        polygonList.chunked(2).forEach {
            val point = centerPose.transformPoint(floatArrayOf(it[0], 0f, it[1]))
            vertices.pushArray(WritableNativeArray().apply {
                pushDouble(point[0].toDouble())
                pushDouble(point[1].toDouble())
                pushDouble(point[2].toDouble())
            })
        }
        planeMap.putArray(VERTICES, vertices)
        planeMap.putArray(CENTER, WritableNativeArray().apply {
            pushDouble(plane.centerPose.tx().toDouble())
            pushDouble(plane.centerPose.ty().toDouble())
            pushDouble(plane.centerPose.tz().toDouble())
        })
        planeMap.putString(ID, abs(plane.hashCode()).toString())
        return planeMap
    }

    private fun filterAddedPlanes(planes: List<Plane>) {
        if (lastPlanes != null) {
            val added = planes.minus(lastPlanes!!)
            if (added.isNotEmpty()) {
                added.forEach {
                    onAddedListener?.invoke(mapPlanesToWritableMap(it))
                }
            }
        }
    }

    private fun filterRemovedPlanes(planes: List<Plane>) {
        if (lastPlanes != null) {
            val removed = lastPlanes!!.minus(planes)
            if (removed.isNotEmpty()) {
                removed.forEach {
                    onRemovedListener?.invoke(mapPlanesToWritableMap(it))
                }
            }
        }
    }

    private fun filterUpdatedPlanes(planes: List<Plane>) {
        val updated = lastPlanes?.filter { planes.contains(it) }
        if (updated != null && updated.isNotEmpty()) {
            updated.forEach {
                onUpdateListener?.invoke(mapPlanesToWritableMap(it))
            }
        }
    }
}