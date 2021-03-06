/*
 *  Copyright (c) 2019-2020 Magic Leap, Inc. All Rights Reserved
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 *   Unless required by applicable law or agreed to in writing, software
 *   distributed under the License is distributed on an "AS IS" BASIS,
 *   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *   See the License for the specific language governing permissions and
 *   limitations under the License.
 */

package com.magicleap.magicscript.scene.nodes.audio

import com.google.vr.sdk.audio.GvrAudioEngine

class GvrAudioEngineWrapper(private val gvrAudioEngine: GvrAudioEngine) : ExternalAudioEngine {
    override fun stopSound(sourceId: Int) {
        gvrAudioEngine.stopSound(sourceId)
    }

    override fun unloadSoundFile(path: String?) {
        gvrAudioEngine.unloadSoundFile(path)
    }

    override fun setSoundVolume(sourceId: Int, volume: Float) {
        gvrAudioEngine.setSoundVolume(sourceId, volume)
    }

    override fun playSound(sourceId: Int, looping: Boolean) {
        gvrAudioEngine.playSound(sourceId, looping)
    }

    override fun pause() {
        gvrAudioEngine.pause()
    }

    override fun resume() {
        gvrAudioEngine.resume()
    }

    override fun setSoundObjectPosition(sourceId: Int, x: Float, y: Float, z: Float) {
        gvrAudioEngine.setSoundObjectPosition(sourceId, x, y, z)
    }

    override fun setSoundObjectDistanceRolloffModel(
        sourceId: Int,
        rolloffFactor: Int,
        minDistance: Float,
        maxDistance: Float
    ) {
        gvrAudioEngine.setSoundObjectDistanceRolloffModel(
            sourceId,
            rolloffFactor,
            minDistance,
            maxDistance
        )
    }

    override fun preloadSoundFile(path: String?) {
        gvrAudioEngine.preloadSoundFile(path)
    }

    override fun setRoomProperties(
        fl: Float,
        fl1: Float,
        fl2: Float,
        plasterSmooth: Int,
        plasterSmooth1: Int,
        curtainHeavy: Int
    ) {
        gvrAudioEngine.setRoomProperties(fl, fl1, fl2, plasterSmooth, plasterSmooth1, curtainHeavy)
    }

    override fun createSoundObject(path: String?): Int =
        gvrAudioEngine.createSoundObject(path)


    override fun createStereoSound(path: String?): Int =
        gvrAudioEngine.createStereoSound(path)

}