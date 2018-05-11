//
//  Trip+CoreDataProperties.swift
//  testGyro
//
//  Created by Vittorio Silvestro on 11/05/18.
//  Copyright © 2018 Antonio Giaquinto. All rights reserved.
//
//

import Foundation
import CoreData


extension Trip {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Trip> {
        return NSFetchRequest<Trip>(entityName: "Trip")
    }

    @NSManaged public var id: Int32
    @NSManaged public var points: Float
    @NSManaged public var penalty: Float
    @NSManaged public var stillTime: Double
    @NSManaged public var maxSpeed: Float
    @NSManaged public var avgSpeed: Float
    @NSManaged public var movingTime: Double
    @NSManaged public var km: Float
    @NSManaged public var totalTime: Double
    @NSManaged public var avgGForce: Float
    @NSManaged public var attentionLevel: Int16
    @NSManaged public var date: NSDate?
    @NSManaged public var path: Int64
    @NSManaged public var destination: String?
    @NSManaged public var overtake: Int32
    @NSManaged public var potholes: NSSet?
    @NSManaged public var user: User?

}

// MARK: Generated accessors for potholes
extension Trip {

    @objc(addPotholesObject:)
    @NSManaged public func addToPotholes(_ value: HitPothole)

    @objc(removePotholesObject:)
    @NSManaged public func removeFromPotholes(_ value: HitPothole)

    @objc(addPotholes:)
    @NSManaged public func addToPotholes(_ values: NSSet)

    @objc(removePotholes:)
    @NSManaged public func removeFromPotholes(_ values: NSSet)

}
