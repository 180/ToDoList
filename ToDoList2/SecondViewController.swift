//
//  SecondViewController.swift
//  ToDoList2
//
//  Created by Maciej Stanik on 19/07/2015.
//  Copyright (c) 2015 Maciej Stanik. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var detailsTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    @IBAction func addItemButton(sender: UIButton) {
        
        if (nameTextField.text.isEmpty) {
            displayAlert()
        } else {
            itemsMgr.addItem(nameTextField.text, details: detailsTextField.text)
            
            nameTextField.text = ""
            detailsTextField.text = ""
            
            // Navigate to list
            self.tabBarController?.selectedIndex = 0
        }
        
    }
    
    func displayAlert () {
        
        let alert = UIAlertController(title: "Empty name!", message: "You cannot save item without a name", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

