//
//  UserDetail+CoreDataProperties.swift
//  Demo
//
//  Created by Hetal Mehta on 30/03/22.
//
//

import Foundation
import CoreData


extension UserDetail {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserDetail> {
        return NSFetchRequest<UserDetail>(entityName: "UserDetail")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var userID: Int64
    @NSManaged public var passport: Passport?

}
