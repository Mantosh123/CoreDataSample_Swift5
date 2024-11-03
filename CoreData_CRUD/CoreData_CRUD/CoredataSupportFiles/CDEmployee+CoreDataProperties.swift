//
//  CDEmployee+CoreDataProperties.swift
//  CoreData_CRUD
//
//  Created by Mantosh Kumar on 02/11/24.
//
//

import Foundation
import CoreData

extension CDEmployee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDEmployee> {
        return NSFetchRequest<CDEmployee>(entityName: "CDEmployee")
    }

    @NSManaged public var profilePic: Data?
    @NSManaged public var name: String?
    @NSManaged public var email: String?
    @NSManaged public var id: UUID?
    
    func convertToEmployee() -> Employee {
        return Employee(id: self.id!, name: self.name, emailId: self.email, profilePic: self.profilePic)
    }
}

extension CDEmployee : Identifiable {

}
