import { NativeModules, NativeEventEmitter } from "react-native";

export default class PlaneDetector {
    constructor() {
        console.log("PlaneDetector constructor()");
        this.arPlaneDetector = NativeModules.ARPlaneDetector;
        this.arPlaneDetectorEventManager = new NativeEventEmitter(NativeModules.ARPlaneDetectorEvents);
    }

    addOnPlaneDetectedObserver(observerCallback) {
        this.arPlaneDetectorEventManager.addListener("onPlaneDetected", observerCallback);
        this.arPlaneDetector.addOnPlaneDetectedEventHandler();
    }

    addOnPlaneTappedObserver(observerCallback) {
        this.arPlaneDetectorEventManager.addListener("onPlaneTapped", observerCallback);
        this.arPlaneDetector.addOnPlaneTappedEventHandler();
    }
}