//
//  HitPothole+CoreDataProperties.swift
//  testGyro
//
//  Created by Vittorio Silvestro on 11/05/18.
//  Copyright © 2018 Vittorio Silvestro. All rights reserved.
//
//

import Foundation
import CoreData


extension HitPothole {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HitPothole> {
        return NSFetchRequest<HitPothole>(entityName: "HitPothole")
    }

    @NSManaged public var speed: Float
    @NSManaged public var depht: Float
    @NSManaged public var location: Float
    @NSManaged public var trip: Trip?

}
