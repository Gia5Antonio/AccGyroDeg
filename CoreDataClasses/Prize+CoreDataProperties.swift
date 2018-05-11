//
//  Prize+CoreDataProperties.swift
//  testGyro
//
//  Created by Vittorio Silvestro on 11/05/18.
//  Copyright © 2018 Vittorio Silvestro. All rights reserved.
//
//

import Foundation
import CoreData


extension Prize {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Prize> {
        return NSFetchRequest<Prize>(entityName: "Prize")
    }

    @NSManaged public var name: String?
    @NSManaged public var isUnlocked: Bool
    @NSManaged public var user: User?

}
