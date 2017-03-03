//
//  Person+CoreDataClass.swift
//  CoreDataPractice
//
//  Created by Carlos Duclos on 3/2/17.
//  Copyright © 2017 Carlos Duclos. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData

@objc(Person)
public class Person: NSManagedObject {

    class func create() -> Person {
        let person = NSEntityDescription.insertNewObject(forEntityName: "Person", into: CoreDataStack.sharedStack.managedObjectContext) as! Person
        person.firstName = "Carlos"
        person.lastName = "Duclos"
        person.age = 26
        return person
    }
    
    class func getAll() -> Array<Person> {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
        var results = Array<Person>()
        do {
            results = try CoreDataStack.sharedStack.managedObjectContext.execute(request)
        } catch {
            fatalError("Failed to fetch people: \(error)")
        }
        return results
    }
    
}
