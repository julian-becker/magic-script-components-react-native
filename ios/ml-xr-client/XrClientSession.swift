//
//  MLXrClientSession.swift
//  RNMagicScript
//
//  Created by Pawel Leszkiewicz on 17/07/2019.
//  Copyright © 2019 MagicLeap. All rights reserved.
//

import Foundation
import ARKit
import CoreLocation
import mlxr_ios_client_internal

@objc(XrClientSession)
class XrClientSession: NSObject {

    static fileprivate weak var arSession: ARSession?
    static fileprivate let locationManager = CLLocationManager()
    fileprivate var xrClientSession: MLXRSession?
    fileprivate var updateInterval: TimeInterval = 2.0
    fileprivate var timer: Timer?
    fileprivate var internalLocation: CLLocation!
    fileprivate let internalLocationQueue: DispatchQueue = DispatchQueue(label: "internalLocationQueue")
    fileprivate var lastLocation: CLLocation? {
        get {
            return internalLocationQueue.sync { internalLocation }
        }
        set (newLocation) {
            internalLocationQueue.sync { internalLocation = newLocation }
        }
    }

    public override init() {
        super.init()
        setupLocationManager()
    }

    deinit {
        timer?.invalidate()

        // NOTE: Due to the following warning:
        // "Failure to deallocate CLLocationManager on the same runloop as its creation
        // may result in a crash"
        // locationManager is a static member and we only stop updating location in deinit.
        XrClientSession.locationManager.stopUpdatingLocation()
        XrClientSession.locationManager.delegate = nil
    }

    fileprivate func setupLocationManager() {
        XrClientSession.locationManager.delegate = self
        XrClientSession.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        XrClientSession.locationManager.requestWhenInUseAuthorization()
        XrClientSession.locationManager.startUpdatingLocation()
    }

    @objc
    static public func registerARSession(_ arSession: ARSession) {
        XrClientSession.arSession = arSession
    }

    @objc
    public func connect(_ address: String, deviceId: String, token: String, resolve: @escaping RCTPromiseResolveBlock, reject: @escaping RCTPromiseRejectBlock) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                reject("code", "ARSession does not exist.", nil)
                return
            }
            
            guard let arSession = XrClientSession.arSession else {
                reject("code", "ARSession does not exist.", nil)
                return
            }

            self.xrClientSession = MLXRSession(0, arSession)
            if let xrSession = self.xrClientSession {
                let result: Bool = xrSession.connect(address, deviceId, token)
                self.resetTimer()
                resolve(result)
            } else {
                reject("code", "XrClientSession has not been initialized!", nil)
            }
        }
    }

    @objc
    public func setUpdateInterval(_ interval: TimeInterval, resolve: RCTPromiseResolveBlock, reject: RCTPromiseRejectBlock) {
        updateInterval = max(0.5, interval)
        resetTimer()
        resolve(true)
    }

    fileprivate func resetTimer() {
        guard Thread.isMainThread else {
            DispatchQueue.main.async { [weak self] in
                self?.resetTimer()
            }
            return
        }
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: updateInterval, repeats: true, block: { [weak self] _ in
            self?.update()
        })
    }

    fileprivate func update() {
        guard let xrSession = xrClientSession else {
            print("no mlxr session avaiable")
            return
        }

        guard let currentLocation = lastLocation else {
            print("current location is not available")
            return
        }

        guard let frame = XrClientSession.arSession?.currentFrame else {
            print("no ar frame available")
            return
        }
        _ = xrSession.update(frame, currentLocation)
    }

    @objc
    public func getAllAnchors(_ resolve: @escaping RCTPromiseResolveBlock, reject: @escaping RCTPromiseRejectBlock) {
        DispatchQueue.main.async { [weak self] in
            guard let xrSession = self?.xrClientSession else {
                reject("code", "XrClientSession has not been initialized!", nil)
                return
            }
            let allAnchors: [MLXRAnchor] = xrSession.getAllAnchors()
            let uniqueAnchors: [XrClientAnchorData] = allAnchors.map { XrClientAnchorData($0) }

            // Remove current local anchors
            if let currentAnchors = XrClientSession.arSession?.currentFrame?.anchors {
                for anchor in currentAnchors {
                    XrClientSession.arSession?.remove(anchor: anchor)
                }
            }

            let bvs = xrSession.getAllBoundedVolumes()
            print("getAllBoundedVolumes:" + String(bvs.count))
//            var myOffset: simd_float4x4 = simd_float4x4()
            var bvMatrix: [String: simd_float4x4] = [:];
            for bv in bvs {
                //if (bv.getId()!.uuidString.starts(with: "2C0D0599")) {
                if (bv.getId()!.uuidString.uppercased() == "FC6F3CDC-AE59-7018-A731-0242C0A8FE0A") {
//                    print(bv.getPose()?.pose)
                    bvMatrix["18705642-9905-0D2C-033F-012590DA579D"] = bv.getPose()?.pose;
                } else if (bv.getId()!.uuidString.lowercased() == "fc6f4682-ae59-7018-8aee-0242c0a8fe0a") {
                    bvMatrix["187061F0-A75A-29A0-DFF2-5BBD9C0B7994"] = bv.getPose()?.pose;
                }
                //fc6f4682-ae59-7018-8aee-0242c0a8fe0a | a0295aa7-f061-7018-9479-0b9cbd5bf2df
            }
            
            // Only add unique anchors to the list, for existing ones just update the pose.
            for anchor in uniqueAnchors {
                print("anchor id:" + anchor.getAnchorId())
                var pose: simd_float4x4 = anchor.getMagicPose()
                if (anchor.getAnchorId().uppercased() == "18705642-9905-0D2C-033F-012590DA579D") {
//                    let offsetMatrix = simd_float4x4(
//                        simd_make_float4(0.941866, 0.13206, -0.308947, 0),
//                        simd_make_float4(-0.0465598, 0.961946, 0.269242, 0),
//                        simd_make_float4(0.332747, -0.239205, 0.912174, 0),
//                        simd_make_float4(-0.729588, -0.0187979, -0.0351334, 1)
//                    );
                    if let offset = bvMatrix["18705642-9905-0D2C-033F-012590DA579D"] {
                        pose = pose * offset
                    }
//                    // hack to position correctly
//                    pose = pose * unsafeBitCast(GLKMatrix4MakeTranslation(0, 0, -0.25), to: float4x4.self)
//                    let testAnchor = ARAnchor(name: anchor.getAnchorId(), transform: pose)
//                    XrClientSession.arSession?.add(anchor: testAnchor)
                    } else if (anchor.getAnchorId().uppercased() == "187061F0-A75A-29A0-DFF2-5BBD9C0B7994") {
                    if let offset = bvMatrix["187061F0-A75A-29A0-DFF2-5BBD9C0B7994"] {
                        pose = pose * offset
                    }
                    //                    pose = pose * unsafeBitCast(GLKMatrix4MakeTranslation(0, 0, -0.25), to: float4x4.self)
//                    let testAnchor = ARAnchor(name: anchor.getAnchorId(), transform: pose)
//                    XrClientSession.arSession?.add(anchor: testAnchor)
//                    matrix:{
//                        w:0, y:-0.16235, x:0.456896, z:0.874579,
//                        w:0, y:0.978622, x:-0.0388529, z:0.201962,
//                        w:0, y:-0.126255, x:-0.888671, z:0.440821,
//                        w:1, y:-0.291069, x:1.44098, z:1.5512
//                    },
//
//
//
////                    pose = pose * offsetMatrix
                }
                let testAnchor = ARAnchor(name: anchor.getAnchorId(), transform: pose)
                XrClientSession.arSession?.add(anchor: testAnchor)
            }

            let results: [[String: Any]] = uniqueAnchors.map { $0.getJsonRepresentation() }
            resolve(results)
        }
    }

    @objc
    public func getAnchorByPcfId(pcfId: String, resolve: @escaping RCTPromiseResolveBlock, reject: @escaping RCTPromiseRejectBlock) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                reject("code", "Bad state", nil)
                return
            }
            guard let uuid = UUID(uuidString: pcfId) else {
                reject("code", "Incorrect PCF id", nil)
                return
            }

            guard let xrSession = self.xrClientSession else {
                reject("code", "XrClientSession has not been initialized!", nil)
                return
            }

            guard let anchorData = xrSession.getAnchorByPcfId(uuid) else {
                // Achor data does not exist for given PCF id
                resolve(nil)
                return
            }

            let result: [String : Any] = XrClientAnchorData(anchorData).getJsonRepresentation()
            resolve(result)
        }
    }

    @objc
    public func getLocalizationStatus(_ resolve: @escaping RCTPromiseResolveBlock, reject: @escaping RCTPromiseRejectBlock) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                reject("code", "Bad state", nil)
                return
            }
            guard let xrSession = self.xrClientSession else {
                reject("code", "XrClientSession has not been initialized!", nil)
                return
            }

            let status: XrClientLocalization = XrClientLocalization(localizationStatus: xrSession.getLocalizationStatus()?.status ?? MLXRLocalizationStatus_LocalizationFailed)
            resolve(status.rawValue)
        }
    }

    @objc
    static func requiresMainQueueSetup() -> Bool {
        return true
    }
    
    @objc
    public func getAllBoundedVolumes(_ resolve: @escaping RCTPromiseResolveBlock, reject: @escaping RCTPromiseRejectBlock) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                reject("code", "Bad state", nil)
                return
            }
            guard let xrSession = self.xrClientSession else {
                reject("code", "XrClientSession has not been initialized!", nil)
                return
            }
            let volumes = xrSession.getAllBoundedVolumes()
            let uniqueVolumes: [[String:Any]] = volumes.map { XrClientBoundedVolume($0).getJsonRepresentation() }
            resolve(uniqueVolumes)
        }
        
    }
}

// CLLocationManagerDelegate
extension XrClientSession: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        lastLocation = locations.last
    }
}
