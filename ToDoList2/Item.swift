//
//  Item.swift
//  ToDoList2
//
//  Created by Maciej Stanik on 25/07/2015.
//  Copyright (c) 2015 Maciej Stanik. All rights reserved.
//

import Foundation
import CoreData

class Item: NSManagedObject {

    @NSManaged var details: String
    @NSManaged var name: String

}
