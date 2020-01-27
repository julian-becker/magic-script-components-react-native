import { NativeModules, NativeEventEmitter } from "react-native";

export default class NativePlaneDetector {
    constructor() {
        this.arPlaneDetector = NativeModules.ARPlaneDetector;
        this.arPlaneDetectorEventManager = new NativeEventEmitter(NativeModules.ARPlaneDetectorEvents);
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
        // configuration sample: { planeType: ["horizontal", "vertical"] }
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
        // configuration sample: { planeType: "vertical", rayCastParameters: {...}] }
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
        const subscriptionName = "onPlaneDetected";
        const subscription = this.arPlaneDetectorEventManager.addListener(subscriptionName, observerCallback);

        // update subscription tracking
       this._registerSubscriptionForObserver(subscriptionName, subscription, observer);

        if (!(subscriptionName in this.subscriptionEnabled)) { 
            this.arPlaneDetector.addOnPlaneDetectedEventHandler(); 
            this.subscriptionEnabled[subscriptionName] = true; 
        }
    }

    addOnPlaneUpdatedObserver(observer, observerCallback) {
        // console.log("addOnPlaneUpdatedObserver - observer: ", observer);
        const subscriptionName = "onPlaneUpdated";
        const subscription = this.arPlaneDetectorEventManager.addListener("onPlaneUpdated", observerCallback);

        // update subscription tracking
       this._registerSubscriptionForObserver(subscriptionName, subscription, observer);

       if (!(subscriptionName in this.subscriptionEnabled)) { 
        this.arPlaneDetector.addOnPlaneUpdatedEventHandler();
           this.subscriptionEnabled[subscriptionName] = true; 
       }
    }

    addOnPlaneRemovedObserver(observer, observerCallback) {
        // console.log("addOnPlaneRemovedObserver - observer: ", observer);
        const subscriptionName = "onPlaneRemoved";
        const subscription = this.arPlaneDetectorEventManager.addListener(subscriptionName, observerCallback);

        // update subscription tracking
        this._registerSubscriptionForObserver(subscriptionName, subscription, observer);

        if (!(subscriptionName in this.subscriptionEnabled)) { 
            this.arPlaneDetector.addOnPlaneRemovedEventHandler();
            this.subscriptionEnabled[subscriptionName] = true; 
        }
    }

    addOnPlaneTappedObserver(observer, observerCallback) {
        // console.log("addOnPlaneTappedObserver - observer: ", observer);
        const subscriptionName = "onPlaneTapped";
        const subscription = this.arPlaneDetectorEventManager.addListener(subscriptionName, observerCallback);

        // update subscription tracking
        this._registerSubscriptionForObserver(subscriptionName, subscription, observer);

        if (!(subscriptionName in this.subscriptionEnabled)) { 
            this.arPlaneDetector.addOnPlaneTappedEventHandler();
            this.subscriptionEnabled[subscriptionName] = true; 
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
