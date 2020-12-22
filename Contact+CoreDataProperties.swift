//
//  Contact+CoreDataProperties.swift
//  TestTask
//
//  Created by Иван Викторович on 22.12.2020.
//
//

import Foundation
import CoreData


extension Contact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contact> {
        return NSFetchRequest<Contact>(entityName: "Contact")
    }

    @NSManaged public var name: String?
    @NSManaged public var secondName: String?
    @NSManaged public var email: String?
    @NSManaged public var photo: Data?

}

extension Contact : Identifiable {

}
