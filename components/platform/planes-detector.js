import { NativeModules, NativeEventEmitter } from "react-native";

export default class PlaneDetector {
    constructor() {
        this.arPlaneDetector = NativeModules.ARPlaneDetector;
        this.arPlaneDetectorEventManager = new NativeEventEmitter(NativeModules.ARPlaneDetectorEvents);
    }

    addOnPlaneDetectedObserver(observerCallback) {
        this.arPlaneDetector.addOnPlaneDetectedEventHandler();
        this.arPlaneDetectorEventManager.addListener("onPlaneDetected", observerCallback);
    }

    addOnPlaneTappedObserver(observerCallback) {
        this.arPlaneDetector.addOnPlaneTappedEventHandler();
        this.arPlaneDetectorEventManager.addListener("onPlaneTapped", observerCallback);
    }
}