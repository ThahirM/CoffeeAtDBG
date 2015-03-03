//
//  Task.swift
//  SwiftDemoToDo
//
//  Created by Thahir Maheen on 03/03/15.
//  Copyright (c) 2015 DBG. All rights reserved.
//

import Foundation

class Task {
    
    var taskName = ""
    var taskDescription = ""
    
    init(name: String, description: String) {
        taskName = name
        taskDescription = description
    }
}