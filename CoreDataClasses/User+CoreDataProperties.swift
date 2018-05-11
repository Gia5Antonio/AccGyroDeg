//
//  User+CoreDataProperties.swift
//  testGyro
//
//  Created by Vittorio Silvestro on 11/05/18.
//  Copyright © 2018 Vittorio Silvestro. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var username: String?
    @NSManaged public var avatar: String?
    @NSManaged public var prize: NSSet?
    @NSManaged public var trips: NSSet?

}

// MARK: Generated accessors for prize
extension User {

    @objc(addPrizeObject:)
    @NSManaged public func addToPrize(_ value: Prize)

    @objc(removePrizeObject:)
    @NSManaged public func removeFromPrize(_ value: Prize)

    @objc(addPrize:)
    @NSManaged public func addToPrize(_ values: NSSet)

    @objc(removePrize:)
    @NSManaged public func removeFromPrize(_ values: NSSet)

}

// MARK: Generated accessors for trips
extension User {

    @objc(addTripsObject:)
    @NSManaged public func addToTrips(_ value: Trip)

    @objc(removeTripsObject:)
    @NSManaged public func removeFromTrips(_ value: Trip)

    @objc(addTrips:)
    @NSManaged public func addToTrips(_ values: NSSet)

    @objc(removeTrips:)
    @NSManaged public func removeFromTrips(_ values: NSSet)

}
