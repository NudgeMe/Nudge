//
//  Task.swift
//  Nudge
//
//  Created by Lin Zhou on 4/17/17.
//  Copyright © 2017 Dephanie Ho. All rights reserved.
//

import UIKit
import Parse


class Task: NSObject {
    var title: String?
    var taskDescription: String?
    
    /** Method to add a task to Parse */
    class func createTask(taskTitle: String?, taskDescription: String?, completion: @escaping PFBooleanResultBlock){
        let task = PFObject(className: "Task")
        
        task["title"] = taskTitle
        task["description"] = taskDescription
       // task["assginee"] = assignee
        task["date"] = "4/22/2017"
        task["group"] = PFUser.current()?["group"]
        task.saveInBackground(block: completion)

}
}
