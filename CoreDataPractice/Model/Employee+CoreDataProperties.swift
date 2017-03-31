//
//  Employee+CoreDataProperties.swift
//  CoreDataPractice
//
//  Created by Carlos Duclos on 3/30/17.
//  Copyright © 2017 Carlos Duclos. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Employee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee");
    }

    @NSManaged public var salary: Int16
    @NSManaged public var startDate: NSDate?
    @NSManaged public var department: Department?

}
