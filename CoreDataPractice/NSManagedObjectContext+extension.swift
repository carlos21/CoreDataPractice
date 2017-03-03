//
//  NSManagedObjectContext.swift
//  CoreDataPractice
//
//  Created by Carlos Duclos on 3/3/17.
//  Copyright © 2017 Carlos Duclos. All rights reserved.
//

import Foundation
import CoreData

extension NSManagedObjectContext {
    
    func deleteAllForEntity(_ entityName: String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        batchDeleteRequest.resultType = .resultTypeCount
        
        do {
            try self.execute(batchDeleteRequest)
            self.reset()
        } catch let error as NSError {
            fatalError(error.localizedDescription)
        }
    }
    
}
