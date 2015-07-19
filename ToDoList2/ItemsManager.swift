//
//  ItemsManager.swift
//  ToDoList2
//
//  Created by Maciej Stanik on 19/07/2015.
//  Copyright (c) 2015 Maciej Stanik. All rights reserved.
//

import Foundation

var itemsMgr: ItemsManager = ItemsManager()

struct item {
    var name = ""
    var details = ""
}

class ItemsManager : NSObject {
    
   var items = [item]() // Variable holding array of items initialized with nothing :)
    
    func addItem(name:String, details: String) {
        items.append(item(name: name, details: details))
    }

}