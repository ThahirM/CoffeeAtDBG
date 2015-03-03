//
//  AddTaskViewController.swift
//  SwiftDemoToDo
//
//  Created by Thahir Maheen on 03/03/15.
//  Copyright (c) 2015 DBG. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textFieldTaskName: UITextField!
    @IBOutlet weak var textFieldTaskDescription: UITextField!

    @IBAction func buttonActionAddTask(sender: UIButton) {
        
        // create a new task
        TaskManager.sharedManager.addTask(textFieldTaskName.text, description: textFieldTaskDescription.text)

        // cleanup text fields
        textFieldTaskName.text = ""
        textFieldTaskDescription.text = ""
        
                
        // show the task list
        tabBarController?.selectedIndex = 0
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        // hide keyboard
        textField.resignFirstResponder()
        
        return true
    }
}
