//
//  FirstViewController.swift
//  ToDoList2
//
//  Created by Maciej Stanik on 19/07/2015.
//  Copyright (c) 2015 Maciej Stanik. All rights reserved.
//

import UIKit
import CoreData

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var items = [Item]()
    
    @IBOutlet weak var itemsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        fetchData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Table View Data Souce methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "CellId")
        
        let item = items[indexPath.row]
        
        cell.textLabel!.text = item.name
        cell.detailTextLabel!.text = item.details
        
        return cell
    }
    
    // Swipe to delete
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            itemsMgr.deleteItem(items[indexPath.row])
   
          fetchData()
        }
    }
    
    func fetchData() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        let fetchRequest = NSFetchRequest(entityName:"Item")
        
        var error: NSError?
        
        let fetchedResults = managedContext.executeFetchRequest(fetchRequest, error: &error) as? [Item]
        
        if let results = fetchedResults {
            items = results
        } else {
            println("Could not fetch \(error), \(error!.userInfo)")
        }
        
         itemsTableView.reloadData()
    }
    
}

