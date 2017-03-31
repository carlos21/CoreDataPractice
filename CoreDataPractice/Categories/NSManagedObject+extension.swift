//
//  NSManagedObject+extension.swift
//  CoreDataPractice
//
//  Created by Carlos Duclos on 3/30/17.
//  Copyright © 2017 Carlos Duclos. All rights reserved.
//

import Foundation
import CoreData

extension NSManagedObject {
    
    class func create(inContext context: NSManagedObjectContext? = nil) -> NSManagedObject {
        return NSEntityDescription.insertNewObject(forEntityName: String(describing: self), into: context ?? CoreDataStack.sharedStack.managedObjectContext)
    }
    
    class func deleteAll(inContext context: NSManagedObjectContext? = nil) {
        let context = context ?? CoreDataStack.sharedStack.managedObjectContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: String(describing: self))
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        batchDeleteRequest.resultType = .resultTypeCount
        
        do {
            try context.execute(batchDeleteRequest)
            context.reset()
        } catch let error as NSError {
            fatalError(error.localizedDescription)
        }
    }
    
    class func getAll(fromContext context: NSManagedObjectContext? = nil) -> [NSManagedObject] {
        let context = context ?? CoreDataStack.sharedStack.managedObjectContext
        let request = NSFetchRequest<NSManagedObject>(entityName: String(describing: self));
        do {
            return try context.fetch(request)
        } catch {
            fatalError("Failed to fetch objects: \(error)")
        }
        return []
    }
    
}
