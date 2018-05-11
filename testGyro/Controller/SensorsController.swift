//
//  SensorsController.swift
//  testGyro
//
//  Created by Antonio Giaquinto on 09/05/2018.
//  Copyright © 2018 Antonio Giaquinto. All rights reserved.
//

import UIKit
import CoreMotion

class SensorsController {
    
    var sensors = SensorsModel()
    
    func radians(fromDegrees degrees: Double) -> Double {
        return 180 * degrees / .pi
    }
    
    func resetGyroAngSpeed() {
        debugPrint("Reset AngSpeed OK")
        LabelValue.shared.maxRotX = 0.0
        LabelValue.shared.maxRotY = 0.0
        LabelValue.shared.maxRotZ = 0.0
    }
    
    func resetGyroDeg() {
        debugPrint("Resest GyroDeg OK")
        LabelValue.shared.maxDegX = 0.0
        LabelValue.shared.maxDegY = 0.0
        LabelValue.shared.maxDegZ = 0.0
    }
    
    func resetAcc() {
        debugPrint("Reset Acc OK")
        LabelValue.shared.maxAccX = 0.0
        LabelValue.shared.maxAccY = 0.0
        LabelValue.shared.maxAccZ = 0.0
    }
    
    func startAccUpdates() {
        debugPrint("Start Accelerometer OK")
        sensors.accelerometer.motionManager.accelerometerUpdateInterval = 0.2
        sensors.accelerometer.motionManager.startAccelerometerUpdates(to: OperationQueue.current!) { (accelerometerData: CMAccelerometerData?, NSError) -> Void in
            self.setAccData(acceleration: accelerometerData!.acceleration)
            if(NSError != nil) {
                print("\(String(describing: NSError))")
            }
        }
    }
    
    func startGyroUpdates() {
        debugPrint("Start Gyroscope OK")
        sensors.gyroscope.motionManager.gyroUpdateInterval = 0.2
        sensors.gyroscope.motionManager.startGyroUpdates()
        sensors.gyroscope.motionManager.startDeviceMotionUpdates(to: OperationQueue.current!, withHandler: { motion, error in
            if let m = motion {
                self.setRotData(rotation: m.rotationRate)
            }
            else if let e = error {
                print(e.localizedDescription)
            }
        })
    }
    
    func startSensorsUpdates() {
        debugPrint("Start All OK")
        startAccUpdates()
        startGyroUpdates()
    }
    
    func setRotData(rotation: CMRotationRate) {
        debugPrint("Rot Data OK")
        let attitude = sensors.gyroscope.motionManager.deviceMotion!.attitude
        
        let currentMaxRotX = LabelValue.shared.maxRotX
        let currentMaxRotY = LabelValue.shared.maxRotY
        let currentMaxRotZ = LabelValue.shared.maxRotZ
        
        let maxRotXd = LabelValue.shared.maxDegX
        let maxRotYd = LabelValue.shared.maxDegY
        let maxRotZd = LabelValue.shared.maxDegZ
        
        LabelValue.shared.rotX = rotation.x
        if fabs(rotation.x) > fabs(currentMaxRotX) {
            LabelValue.shared.maxRotX = rotation.x
        }
        
        LabelValue.shared.rotY = rotation.y
        if fabs(rotation.y) > fabs(currentMaxRotY) {
            LabelValue.shared.maxRotY = rotation.y
        }
        
        LabelValue.shared.rotZ = rotation.z
        if fabs(rotation.z) > fabs(currentMaxRotZ) {
            LabelValue.shared.maxRotZ = rotation.z
        }
        
        LabelValue.shared.degX = radians(fromDegrees: attitude.yaw)
        if fabs(attitude.yaw) > fabs(maxRotYd) {
            LabelValue.shared.maxDegX = radians(fromDegrees: attitude.yaw)
        }
        debugPrint("Yaw: \(attitude.yaw)")
        debugPrint("LabelValue Yaw: \(LabelValue.shared.degX)")
        debugPrint("MaxYaw: \(LabelValue.shared.maxDegX)")
        
        LabelValue.shared.degY = radians(fromDegrees: attitude.pitch)
        if fabs(attitude.pitch) > fabs(maxRotXd) {
            LabelValue.shared.maxDegY = radians(fromDegrees: attitude.pitch)
        }
        
        LabelValue.shared.degZ = radians(fromDegrees: attitude.roll)
        if fabs(attitude.roll) > fabs(maxRotZd) {
            LabelValue.shared.maxDegZ = radians(fromDegrees: attitude.roll)
        }
    }
    
    func setAccData(acceleration: CMAcceleration){
        debugPrint("Acc Data OK")
        let currentMaxAccelX = LabelValue.shared.maxAccX
        let currentMaxAccelY = LabelValue.shared.maxAccY
        let currentMaxAccelZ = LabelValue.shared.maxAccZ
        
        LabelValue.shared.accX = acceleration.x
        if fabs(acceleration.x) > fabs(currentMaxAccelX) {
            LabelValue.shared.maxAccX = acceleration.x
        }
        debugPrint("Acceleration X: \(acceleration.x)")
        debugPrint("LabelValue accX: \(LabelValue.shared.accX)")
        debugPrint("MaxAccX: \(LabelValue.shared.maxAccX)")
        
        LabelValue.shared.accY = acceleration.y
        if fabs(acceleration.y) > fabs(currentMaxAccelY) {
            LabelValue.shared.maxAccY = acceleration.y
        }
        
        LabelValue.shared.accZ = acceleration.z
        if fabs(acceleration.z) > fabs(currentMaxAccelZ) {
            LabelValue.shared.maxAccZ = acceleration.z
        }
    }
}
