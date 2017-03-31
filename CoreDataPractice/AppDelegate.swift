//
//  AppDelegate.swift
//  CoreDataPractice
//
//  Created by Carlos Duclos on 3/2/17.
//  Copyright © 2017 Carlos Duclos. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let dir = CoreDataStack.sharedStack.libraryDirectory
        print("\(dir.path)")
        
        let context = CoreDataStack.sharedStack.managedObjectContext
        let person1 = Person.createOnContext(context)
        person1.firstName = "Person 1"
        person1.lastName = "Person 1"
        person1.age = 26
        
        let person2 = Person.createOnContext(context)
        person2.firstName = "Person 2"
        person2.lastName = "Person 2"
        person2.age = 28
        
        let employee1 = Employee.createOnContext(context)
        employee1.firstName = "Employee 1"
        employee1.lastName = "Employee 1"
        employee1.age = 28
        
        context.saveContext()
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
    }

}

