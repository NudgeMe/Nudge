//
//  TaskViewController.swift
//  Nudge
//
//  Created by Derek Ho on 4/10/17.
//  Copyright © 2017 Dephanie Ho. All rights reserved.
//

import UIKit
import Parse

class TaskViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tasks: [PFObject]?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        if let user = PFUser.current(){
            let query = PFQuery(className: "Task")
            query.order(byAscending: "createdAt")
            let group  = user["group"] as? String
            query.findObjectsInBackground{ (tasks: [PFObject]?,  error: Error?) in
                if let tasks = tasks {
                    self.tasks = tasks as? [PFObject]
                    self.tableView.reloadData()
                }
                else {
                    print(error?.localizedDescription)
                }
            
            }
        }
        
        tableView.reloadData()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let tasks = tasks {
            return tasks.count
        }
        else {
        return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskViewCell", for: indexPath) as! TaskViewCell
        let task = tasks?[indexPath.row]
        cell.task = task
        cell.selectionStyle = .none
        
        return cell;
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.viewDidLoad()
        
    }
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
//        if (editingStyle == UITableViewCellEditingStyle.delete){
//            let task = tasks?[indexPath.row]
//            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
//            task?.deleteInBackground();
//        }
//        tableView.reloadData()
    }

    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
