package com.magicleap.magicscript.plane;

import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableMap;
import com.facebook.react.bridge.WritableMap;
import com.facebook.react.bridge.WritableNativeMap;
import com.google.ar.core.Plane;
import com.google.ar.sceneform.math.Vector3;
import com.magicleap.magicscript.scene.UiNodesManager;

import org.jetbrains.annotations.NotNull;

import java.util.Collection;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;

public class ARPlaneDetector extends ReactContextBaseJavaModule {

    private final ARPlaneDetectorEventsManager eventsManager;
    private final String POSITION = "position";
    private final String ROTATION = "rotation";
    private final String WIDTH = "width";
    private final String HEIGHT = "height";
    private final String CENTER = "center";
    private final String NORMAL = "normal";
    private final String VERTICES = "vertices";
    private final ARPlaneDetectorBridge bridge;


    public ARPlaneDetector(ReactApplicationContext reactContext, ARPlaneDetectorEventsManager arEventsManager, ARPlaneDetectorBridge bridge) {
        super(reactContext);
        this.eventsManager = arEventsManager;
        this.bridge = bridge;
    }

    @ReactMethod
    public void startDetecting(final ReadableMap configuration) {
        UiNodesManager.Companion.getINSTANCE().setPlaneDetection(true);
    }

    @ReactMethod
    public void stopDetecting() {
        UiNodesManager.Companion.getINSTANCE().setPlaneDetection(false);
    }

    @ReactMethod
    public void onPlaneUpdate() {
        this.bridge.addOnUpdateListener(new OnPlaneUpdate() {
            @Override
            public void invoke(@NotNull WritableMap payload) {
                eventsManager.onPlaneUpdatedEventReceived(payload);
            }
        });
    }

    @Override
    public String getName() {
        return "ARPlaneDetector";
    }
}
