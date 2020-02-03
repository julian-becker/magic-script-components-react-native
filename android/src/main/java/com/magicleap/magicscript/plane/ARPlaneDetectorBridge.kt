package com.magicleap.magicscript.plane

import com.facebook.react.bridge.*
import com.google.ar.core.Plane
import kotlin.math.abs

class ARPlaneDetectorBridge {
    private var onUpdateListener: OnPlanesUpdated? = null
    private var onAddedListener: OnPlanesAdded? = null
    private var onRemovedListener: OnPlanesRemoved? = null
    private var lastPlanes: List<Plane>? = null
    private var isDetecting: Boolean = false
    private var onGetAllPlanesListener: ((List<Plane.Type>, Callback) -> Unit)? = null

    companion object {
        private val ID = "id"
        private val CENTER = "center"
        private val VERTICES = "vertices"
        private val TYPE = "type"
        private val ERROR = "error"
        val PLANE_TYPE = "planeType"
        val PLANE_TYPE_VERTICAL = "vertical"
        val PLANE_TYPE_HORIZONTAL = "horizontal"
        val INSTANCE = ARPlaneDetectorBridge()

        fun mapPlanesToWritableMap(plane: Plane): WritableMap {
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
            planeMap.putString(TYPE, plane.type.name)
            planeMap.putArray(VERTICES, vertices)
            planeMap.putArray(CENTER, WritableNativeArray().apply {
                pushDouble(plane.centerPose.tx().toDouble())
                pushDouble(plane.centerPose.ty().toDouble())
                pushDouble(plane.centerPose.tz().toDouble())
            })
            planeMap.putString(ID, abs(plane.hashCode()).toString())
            return planeMap
        }

        fun mapToError(errorMessage: String): WritableMap {
            return WritableNativeMap().apply {
                putString(ERROR, errorMessage)
            }
        }
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

    fun setOnGetAllPlanesListener(listener: ((List<Plane.Type>, Callback) -> Unit)) {
        this.onGetAllPlanesListener = listener
    }

    fun isDetecting() = isDetecting

    fun setIsDetecting(isDetecting: Boolean) {
        this.isDetecting = isDetecting
    }

    fun getAllPlanes(configuration: ReadableMap, callback: Callback) {
        val type = when(configuration.getString(PLANE_TYPE)) {
            PLANE_TYPE_HORIZONTAL -> listOf(Plane.Type.HORIZONTAL_DOWNWARD_FACING, Plane.Type.HORIZONTAL_UPWARD_FACING)
            PLANE_TYPE_VERTICAL -> listOf(Plane.Type.VERTICAL)
            else -> listOf(Plane.Type.VERTICAL, Plane.Type.HORIZONTAL_UPWARD_FACING, Plane.Type.HORIZONTAL_DOWNWARD_FACING)
        }
        this.onGetAllPlanesListener?.invoke(type, callback)
    }

    fun destroy() {
        this.onUpdateListener = null
        this.onAddedListener = null
        this.onRemovedListener = null
        this.lastPlanes = null
        this.onGetAllPlanesListener = null
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