//
//  ItemsManager.swift
//  ToDoList2
//
//  Created by Maciej Stanik on 19/07/2015.
//  Copyright (c) 2015 Maciej Stanik. All rights reserved.
//

import UIKit
import CoreData

var itemsMgr: ItemsManager = ItemsManager()

class ItemsManager : NSObject {
    
    func addItem(name: String, details: String) {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        let entity =  NSEntityDescription.entityForName("Item", inManagedObjectContext: managedContext)
        let itemMO = NSManagedObject(entity: entity!, insertIntoManagedObjectContext:managedContext)
        
        itemMO.setValue(name, forKey: "name")
        itemMO.setValue(details, forKey: "details")
        
        var error: NSError?
        if !managedContext.save(&error) {
            println("Could not save \(error), \(error?.userInfo)")
        }
    }
    
    func deleteItem(item: NSManagedObject) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        
        managedContext.deleteObject(item)
        
        var error: NSError?
        if !managedContext.save(&error) {
            println("Could not save \(error), \(error?.userInfo)")
        }
    }
    
}