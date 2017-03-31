//
//  Person+CoreDataProperties.swift
//  CoreDataPractice
//
//  Created by Carlos Duclos on 3/30/17.
//  Copyright © 2017 Carlos Duclos. All rights reserved.
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person");
    }

    @NSManaged public var age: Int16
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?

}
