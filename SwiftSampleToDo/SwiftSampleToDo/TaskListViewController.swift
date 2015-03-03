//
//  TaskListViewController.swift
//  SwiftDemoToDo
//
//  Created by Thahir Maheen on 03/03/15.
//  Copyright (c) 2015 DBG. All rights reserved.
//

import UIKit

class TaskListViewController: UITableViewController {

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Return the number of rows in the section.
        return TaskManager.sharedManager.tasks?.count ?? 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // get a reusable instance
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        
        // get the task for the cell
        let aTask = TaskManager.sharedManager.tasks![indexPath.row]
        
        // populate data
        cell.textLabel?.text = aTask.taskName
        cell.detailTextLabel?.text = aTask.taskDescription
        
        return cell
    }
}
