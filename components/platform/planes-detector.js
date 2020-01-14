import React from 'react';
import { NativeModules, NativeEventEmitter } from "react-native";

export default class PlaneDetector extends React.Component {
    constructor(props) {
        super(props);
        console.log("PlaneDetector constructor()");
        this.arPlaneDetector = NativeModules.ARPlaneDetector;
        this.arPlaneDetectorEventManager = new NativeEventEmitter(NativeModules.ARPlaneDetectorEvents);
    }

    foo() {
        console.log("PlaneDetector foo");
    }

    addOnPlaneDetectedObserver(observerCallback) {
        this.arPlaneDetectorEventManager.addListener("onPlaneDetected", observerCallback);
        this.arPlaneDetector.addOnPlaneDetectedEventHandler();
    }

    addOnPlaneTappedObserver(observerCallback) {
        this.arPlaneDetectorEventManager.addListener("onPlaneTapped", observerCallback);
        this.arPlaneDetector.addOnPlaneTappedEventHandler();
    }

    render() {
        return null
    }
}