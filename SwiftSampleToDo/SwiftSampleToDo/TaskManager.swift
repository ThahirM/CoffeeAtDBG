//
//  TaskManager.swift
//  SwiftDemoToDo
//
//  Created by Thahir Maheen on 03/03/15.
//  Copyright (c) 2015 DBG. All rights reserved.
//

import Foundation

private let _TaskManager = TaskManager()

class TaskManager {
    
    // tasks
    private(set) var tasks: [Task]? = []
    
    // singleton object
    class var sharedManager: TaskManager {
        return _TaskManager
    }
    
    func addTask(name: String, description: String) {

        // create a new task
        let aTask = Task(name: name, description: description)
        
        // add to tasks
        tasks?.append(aTask)
    }
}