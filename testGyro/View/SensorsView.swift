//
//  SensorsView.swift
//  testGyro
//
//  Created by Antonio Giaquinto on 09/05/2018.
//  Copyright © 2018 Antonio Giaquinto. All rights reserved.
//

import UIKit
import CoreMotion

class SensorsView: UIViewController {
    
    var sensorsController = SensorsController()
    
    @IBOutlet var accX: UILabel!
    @IBOutlet var accY: UILabel!
    @IBOutlet var accZ: UILabel!
    @IBOutlet var maxAccX: UILabel!
    @IBOutlet var maxAccY: UILabel!
    @IBOutlet var maxAccZ: UILabel!
    
    @IBOutlet var rotX: UILabel!
    @IBOutlet var rotY: UILabel!
    @IBOutlet var rotZ: UILabel!
    @IBOutlet var maxRotX: UILabel!
    @IBOutlet var maxRotY: UILabel!
    @IBOutlet var maxRotZ: UILabel!
    
    @IBOutlet weak var rotXd: UILabel!
    @IBOutlet weak var rotYd: UILabel!
    @IBOutlet weak var rotZd: UILabel!
    @IBOutlet weak var maxRoXd: UILabel!
    @IBOutlet weak var maxRoYd: UILabel!
    @IBOutlet weak var maxRoZd: UILabel!
    
    var seconds = 0.0
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        sensorsController.startSensorsUpdates()
        runTimer()
    }
    
    func updateLabel() {
        accX.text = LabelValue.shared.accX.precision(3)
        accY.text = LabelValue.shared.accY.precision(3)
        accZ.text = LabelValue.shared.accZ.precision(3)
        maxAccX.text = LabelValue.shared.maxAccX.precision(3)
        maxAccY.text = LabelValue.shared.maxAccY.precision(3)
        maxAccZ.text = LabelValue.shared.maxAccZ.precision(3)
        
        rotX.text = LabelValue.shared.rotX.precision(3)
        rotY.text = LabelValue.shared.rotY.precision(3)
        rotZ.text = LabelValue.shared.rotZ.precision(3)
        maxRotX.text = LabelValue.shared.maxRotX.precision(3)
        maxRotY.text = LabelValue.shared.maxRotY.precision(3)
        maxRotZ.text = LabelValue.shared.maxRotZ.precision(3)
        
        rotXd.text = LabelValue.shared.degX.precision(3)
        rotYd.text = LabelValue.shared.degY.precision(3)
        rotZd.text = LabelValue.shared.degZ.precision(3)
        maxRoXd.text = LabelValue.shared.maxDegX.precision(3)
        maxRoYd.text = LabelValue.shared.maxDegY.precision(3)
        maxRoZd.text = LabelValue.shared.maxDegZ.precision(3)
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self,   selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        seconds += 0.2
        updateLabel()
    }
    
    @IBAction func resetAcc() {
        sensorsController.resetAcc()
    }
    
    @IBAction func resetGyroAngSpeed() {
        sensorsController.resetGyroAngSpeed()
    }
    
    @IBAction func reseGyrotDegree() {
        sensorsController.resetGyroDeg()
    }
}

extension CustomStringConvertible {
    
    private func _precision(number: NSNumber, precision: Int, roundingMode: NumberFormatter.RoundingMode) -> String? {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = precision
        formatter.roundingMode = roundingMode
        return formatter.string(from: number)
    }
    
    func precision(_ number: Int, roundingMode: NumberFormatter.RoundingMode = NumberFormatter.RoundingMode.halfUp) -> String? {
        
        if let num = self as? NSNumber {
            return _precision(number: num, precision: number, roundingMode: roundingMode)
        }
        if let string = self as? String, let double = Double(string) {
            return _precision(number: NSNumber(value: double), precision: number, roundingMode: roundingMode)
        }
        return nil
    }
}


