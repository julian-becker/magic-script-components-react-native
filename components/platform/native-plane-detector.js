import { NativeModules, NativeEventEmitter } from "react-native";

export default class NativePlaneDetector {
    constructor() {
        this.arPlaneDetector = NativeModules.ARPlaneDetector;
        this.arPlaneDetectorEventManager = new NativeEventEmitter(NativeModules.ARPlaneDetectorEvents);
    }

    startDetecting(configuration) {
        // configuration sample: { planeType: ["horizontal", "vertical"] }
        this.arPlaneDetector.startDetecting(configuration);
    }

    stopDetecting() {
        this.arPlaneDetector.stopDetecting();
    }

    getAllPlanes(configuration, callback) {
        this.arPlaneDetector.getAllPlanes(configuration, (error, planes) => {
            if (error) {
                callback(error, null);
              } else {
                callback(null, planes);
              }
        });
    }

    reset() {
        this.arPlaneDetector.reset();
    }

    requestPlaneCast(configuration, callback) {
        this.arPlaneDetector.requestPlaneCast(configuration, (error, planes) => {
            if (error) {
                callback(error, null);
              } else {
                callback(null, planes);
              }
        });
    }

    // callbacks registration
    addOnPlaneDetectedObserver(observerCallback) {
        this.arPlaneDetectorEventManager.addListener("onPlaneDetected", observerCallback);
        this.arPlaneDetector.addOnPlaneDetectedEventHandler();
    }

    addOnPlaneUpdatedObserver(observerCallback) {
        this.arPlaneDetectorEventManager.addListener("onPlaneUpdated", observerCallback);
        this.arPlaneDetector.addOnPlaneUpdatedEventHandler();
    }

    addOnPlaneRemovedObserver(observerCallback) {
        this.arPlaneDetectorEventManager.addListener("onPlaneRemoved", observerCallback);
        this.arPlaneDetector.addOnPlaneRemovedEventHandler();
    }

    addOnPlaneTappedObserver(observerCallback) {
        this.arPlaneDetectorEventManager.addListener("onPlaneTapped", observerCallback);
        this.arPlaneDetector.addOnPlaneTappedEventHandler();
    }
}
