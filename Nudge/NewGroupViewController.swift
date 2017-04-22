//
//  NewGroupViewController.swift
//  Nudge
//
//  Created by Thuan Nguyen on 4/22/17.
//  Copyright © 2017 Dephanie Ho. All rights reserved.
//

import UIKit
import Parse

class NewGroupViewController: UIViewController {

    @IBOutlet weak var groupName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let calendar: Calendar
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func textChanged(_ sender: Any) {
        
    }
    @IBAction func onCreateGroup(_ sender: Any) {
        Group.newGroup(groupName: groupName.text, user: PFUser.current()!) { (success: Bool,error: Error? ) in
            if success {
                self.dismiss(animated: true, completion: nil)
                self.viewWillAppear(true)
            }
            
            else{
                print(error?.localizedDescription)
            }
        }
    }
    

    @IBAction func onCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
