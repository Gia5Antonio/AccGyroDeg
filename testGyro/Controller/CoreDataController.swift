//
//  CoreDataController.swift
//  testGyro
//
//  Created by Vittorio Silvestro on 11/05/18.
//  Copyright © 2018 Vittorio Silvestro. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataController {
    
    static let shared = CoreDataController()
    
    var context: NSManagedObjectContext
    
    //    MARK: Init
    init() {
        let application = UIApplication.shared.delegate as! AppDelegate
        self.context = application.persistentContainer.viewContext
    }
    
    //    MARK: Save
    func saveContext() {
        do {
            try self.context.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    //    MARK: Add Accelerometer and Gyro Value
    func addAccAndGyroValue(accX: Float, accY: Float, accZ: Float, yaw: Float, pitch: Float, roll: Float) {
        let newAccAndGyroValue = NSEntityDescription.insertNewObject(forEntityName: "AccAndGyroValue", into: context) as! AccAndGyroValue
        
        newAccAndGyroValue.setValue(accX, forKey: "accX")
        newAccAndGyroValue.setValue(accY, forKey: "accY")
        newAccAndGyroValue.setValue(accZ, forKey: "accZ")
        newAccAndGyroValue.setValue(yaw, forKey: "yaw")
        newAccAndGyroValue.setValue(pitch, forKey: "pitch")
        newAccAndGyroValue.setValue(roll, forKey: "roll")
        
        self.saveContext()
        
    }
    
    //    MARK: Show Accelerometer and Gyro Value
    func showAccAndGyroValue() -> [AccAndGyroValue]? {
        var shownAccAndGyroValue: [AccAndGyroValue]?
        let fetchRequest: NSFetchRequest<AccAndGyroValue> = AccAndGyroValue.fetchRequest()
        fetchRequest.returnsObjectsAsFaults = false
        
        do{
            shownAccAndGyroValue = try context.fetch(fetchRequest)
            return shownAccAndGyroValue
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return nil
        }
    }
    
    //    MARK: Add Hit Potholes
    func addHitPotholes(depth: Float, location: Float, speed: Float) {
        let newHitPotholes = NSEntityDescription.insertNewObject(forEntityName: "HitPotholes", into: context) as! HitPotholes
        
        newAccAndGyroValue.setValue(depth, forKey: "depth")
        newAccAndGyroValue.setValue(location, forKey: "location")
        newAccAndGyroValue.setValue(spedd, forKey: "speed")
       
        self.saveContext()
        
    }
    
    //    MARK: Show Hit Potholes
    func showHitPotholes() -> [HitPotholes]? {
        var shownHitPotholes: [HitPotholes]?
        let fetchRequest: NSFetchRequest<HitPotholes> = HitPotholes.fetchRequest()
        fetchRequest.returnsObjectsAsFaults = false
        
        do{
            shownHitPotholes = try context.fetch(fetchRequest)
            return shownHitPotholes
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return nil
        }
    }
    
}
