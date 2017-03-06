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

    @discardableResult
    class func createOnContext(_ context: NSManagedObjectContext) -> Person {
        let person = NSEntityDescription.insertNewObject(forEntityName: "Person", into: context) as! Person
        person.firstName = "Carlos"
        person.lastName = "Duclos"
        person.age = 26
        return person
    }
    
    class func getAllFromContext(_ context: NSManagedObjectContext) -> [Person] {
        let request:NSFetchRequest<Person> = Person.fetchRequest()
        do {
            let results:[Person] = try context.fetch(request)
            return results
        } catch {
            fatalError("Failed to fetch people: \(error)")
        }
        return []
    }
    
    class func deleteAllFromContext(_ context: NSManagedObjectContext) {
        context.deleteAllForEntity(String(describing: Person.self))
    }
    
}
