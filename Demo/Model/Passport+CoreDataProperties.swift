//
//  Passport+CoreDataProperties.swift
//  Demo
//
//  Created by Hetal Mehta on 30/03/22.
//
//

import Foundation
import CoreData


extension Passport {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Passport> {
        return NSFetchRequest<Passport>(entityName: "Passport")
    }

    @NSManaged public var expiryDate: Date?
    @NSManaged public var number: String?
    @NSManaged public var user: UserDetail?

}

