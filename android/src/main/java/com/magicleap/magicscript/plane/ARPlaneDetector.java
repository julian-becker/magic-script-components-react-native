package com.magicleap.magicscript.plane;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableMap;
import com.magicleap.magicscript.scene.UiNodesManager;

public class ARPlaneDetector extends ReactContextBaseJavaModule {

    public ARPlaneDetector(ReactApplicationContext reactContext) {
        super(reactContext);
    }

    @ReactMethod
    public void startDetecting(final ReadableMap configuration) {
        UiNodesManager.Companion.getINSTANCE().setPlaneDetection(true);
    }

    @ReactMethod
    public void stopDetecting(final ReadableMap configuration) {
        UiNodesManager.Companion.getINSTANCE().setPlaneDetection(false);
    }




    @Override
    public String getName() {
        return "ARPlaneDetector";
    }
}
