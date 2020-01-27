import { NativeModules, NativeEventEmitter } from "react-native";

export default class NativePlaneDetector {
    constructor() {
        this.arPlaneDetector = NativeModules.ARPlaneDetector;
        this.arPlaneDetectorEventManager = new NativeEventEmitter(NativeModules.ARPlaneDetectorEvents);
        console.log("NativePlaneDetector - constructor");
        this.subscriptionEnabled = {};
        this.subscriptionsByObservers = {};
    }

    startDetecting(configuration) {
        // configuration sample: { planeType: ["horizontal", "vertical"] }
        this.arPlaneDetector.startDetecting(configuration);
    }

    stopDetecting(observer) {
        if (observer in this.subscriptionsByObservers) {
            const subscriptions = this.subscriptionsByObservers[observer];
            for (var key in subscriptions) {
                subscriptions[key].remove();
                delete subscriptions[key];
                if (this.subscriptionEnabled[key]) {
                    delete this.subscriptionEnabled[key]
                }
            }
        }

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
    addOnPlaneDetectedObserver(observer, observerCallback) {
        // console.log("addOnPlaneDetectedObserver - observer: ", observer);
        const subscription = this.arPlaneDetectorEventManager.addListener("onPlaneDetected", observerCallback);

        // update subscription tracking
       this._registerSubscriptionForObserver("onPlaneDetected", subscription, observer);

        if (!("onPlaneDetected" in this.subscriptionEnabled)) { 
            this.arPlaneDetector.addOnPlaneDetectedEventHandler(); 
            this.subscriptionEnabled["onPlaneDetected"] = true; 
        }
    }

    addOnPlaneUpdatedObserver(observer, observerCallback) {
        // console.log("addOnPlaneUpdatedObserver - observer: ", observer);
        const subscription = this.arPlaneDetectorEventManager.addListener("onPlaneUpdated", observerCallback);

        // update subscription tracking
       this._registerSubscriptionForObserver("onPlaneUpdated", subscription, observer);

       if (!("onPlaneUpdated" in this.subscriptionEnabled)) { 
        this.arPlaneDetector.addOnPlaneUpdatedEventHandler();
           this.subscriptionEnabled["onPlaneUpdated"] = true; 
       }
    }

    addOnPlaneRemovedObserver(observer, observerCallback) {
        // console.log("addOnPlaneRemovedObserver - observer: ", observer);
        const subscription = this.arPlaneDetectorEventManager.addListener("onPlaneRemoved", observerCallback);

        // update subscription tracking
        this._registerSubscriptionForObserver("onPlaneRemoved", subscription, observer);

        if (!("onPlaneRemoved" in this.subscriptionEnabled)) { 
            this.arPlaneDetector.addOnPlaneRemovedEventHandler();
            this.subscriptionEnabled["onPlaneRemoved"] = true; 
        }
    }

    addOnPlaneTappedObserver(observer, observerCallback) {
        // console.log("addOnPlaneTappedObserver - observer: ", observer);
        const subscription = this.arPlaneDetectorEventManager.addListener("onPlaneTapped", observerCallback);

        // update subscription tracking
        this._registerSubscriptionForObserver("onPlaneTapped", subscription, observer);

        if (!("onPlaneTapped" in this.subscriptionEnabled)) { 
            this.arPlaneDetector.addOnPlaneTappedEventHandler();
            this.subscriptionEnabled["onPlaneTapped"] = true; 
        }
    }

    _registerSubscriptionForObserver(name, subscription, observer) {
        if (!(observer in this.subscriptionsByObservers)) {
            this.subscriptionsByObservers[observer] = { name: subscription };
            return;
        }
        this.subscriptionsByObservers[observer][name] = subscription;
    }
}
