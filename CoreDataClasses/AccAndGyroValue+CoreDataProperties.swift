//
//  AccAndGyroValue+CoreDataProperties.swift
//  testGyro
//
//  Created by Vittorio Silvestro on 11/05/18.
//  Copyright © 2018 Vittorio Silvestro. All rights reserved.
//
//

import Foundation
import CoreData


extension AccAndGyroValue {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AccAndGyroValue> {
        return NSFetchRequest<AccAndGyroValue>(entityName: "AccAndGyroValue")
    }

    @NSManaged public var accX: Float
    @NSManaged public var accY: Float
    @NSManaged public var accZ: Float
    @NSManaged public var yaw: Float
    @NSManaged public var pitch: Float
    @NSManaged public var roll: Float

}
