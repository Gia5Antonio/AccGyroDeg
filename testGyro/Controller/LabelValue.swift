//
//  LabelValue.swift
//  testGyro
//
//  Created by Antonio Giaquinto on 10/05/2018.
//  Copyright © 2018 Antonio Giaquinto. All rights reserved.
//
import UIKit

class LabelValue {
    public static var shared = LabelValue()
    
    var accX: Double = 0.0
    var accY: Double = 0.0
    var accZ: Double = 0.0
    var maxAccX: Double = 0.0
    var maxAccY: Double = 0.0
    var maxAccZ: Double = 0.0
    
    var rotX: Double = 0.0
    var rotY: Double = 0.0
    var rotZ: Double = 0.0
    var maxRotX: Double = 0.0
    var maxRotY: Double = 0.0
    var maxRotZ: Double = 0.0
    
    var degX: Double = 0.0
    var degY: Double = 0.0
    var degZ: Double = 0.0
    var maxDegX: Double = 0.0
    var maxDegY: Double = 0.0
    var maxDegZ: Double = 0.0
}
