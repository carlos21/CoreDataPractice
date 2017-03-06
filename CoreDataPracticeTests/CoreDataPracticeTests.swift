//
//  CoreDataPracticeTests.swift
//  CoreDataPracticeTests
//
//  Created by Carlos Duclos on 3/2/17.
//  Copyright © 2017 Carlos Duclos. All rights reserved.
//

import XCTest
import CoreData

@testable import CoreDataPractice

class CoreDataPracticeTests: XCTestCase {
    
    var managedObjectContext: NSManagedObjectContext!
    var backgroundManagedObjectContext: NSManagedObjectContext!
    
    override func setUp() {
        super.setUp()
        managedObjectContext = CoreDataStack.sharedStack.managedObjectContext
        backgroundManagedObjectContext = CoreDataStack.sharedStack.backgroundManagedObjectContext
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testShouldDeleteAllPeople() {
        Person.deleteAllFromContext(managedObjectContext)
        Person.createOnContext(managedObjectContext)
        Person.createOnContext(managedObjectContext)
        Person.createOnContext(managedObjectContext)
        Person.deleteAllFromContext(managedObjectContext)
        
        let people = Person.getAllFromContext(managedObjectContext)
        XCTAssert(people.count == 0)
    }
    
    func testShouldHaveAllChangesAfterSaving() {
        Person.deleteAllFromContext(managedObjectContext)
        Person.createOnContext(managedObjectContext)
        Person.createOnContext(managedObjectContext)
        Person.createOnContext(managedObjectContext)
        Person.deleteAllFromContext(managedObjectContext)
        managedObjectContext.saveContext()
        
        let newContext = CoreDataStack.sharedStack.newContext
        let people = Person.getAllFromContext(newContext)
        XCTAssert(people.count == 0)
    }
    
    func testPeopleShouldHaveThreeElements() {
        Person.deleteAllFromContext(managedObjectContext)
        Person.createOnContext(managedObjectContext)
        Person.createOnContext(managedObjectContext)
        Person.createOnContext(managedObjectContext)
        let people = Person.getAllFromContext(managedObjectContext)
        XCTAssert(people.count == 3)
    }
    
    func testPeopleShouldHave0ElementsInOtherContext() {
        Person.deleteAllFromContext(managedObjectContext)
        Person.createOnContext(managedObjectContext)
        Person.createOnContext(managedObjectContext)
        Person.createOnContext(managedObjectContext)
        let people = Person.getAllFromContext(backgroundManagedObjectContext)
        XCTAssert(people.count == 0)
    }
    
}
