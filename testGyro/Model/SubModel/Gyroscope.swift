//
//  Gyroscope.swift
//  testGyro
//
//  Created by Antonio Giaquinto on 10/05/2018.
//  Copyright © 2018 Antonio Giaquinto. All rights reserved.
//

import UIKit
import CoreMotion

class Gyroscope {
    var motionManager = CMMotionManager()
    var motion = CMDeviceMotion()
    var attitude = CMAttitude()
}
