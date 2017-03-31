//
//  Department+CoreDataProperties.swift
//  CoreDataPractice
//
//  Created by Carlos Duclos on 3/30/17.
//  Copyright © 2017 Carlos Duclos. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Department {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Department> {
        return NSFetchRequest<Department>(entityName: "Department");
    }

    @NSManaged public var name: String?
    @NSManaged public var employees: NSSet?

}

// MARK: Generated accessors for employees
extension Department {

    @objc(addEmployeesObject:)
    @NSManaged public func addToEmployees(_ value: Employee)

    @objc(removeEmployeesObject:)
    @NSManaged public func removeFromEmployees(_ value: Employee)

    @objc(addEmployees:)
    @NSManaged public func addToEmployees(_ values: NSSet)

    @objc(removeEmployees:)
    @NSManaged public func removeFromEmployees(_ values: NSSet)

}
