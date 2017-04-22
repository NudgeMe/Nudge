//
//  CreateTaskViewController.swift
//  Nudge
//
//  Created by Lin Zhou on 4/17/17.
//  Copyright © 2017 Dephanie Ho. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var descriptionText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onCreate(_ sender: Any) {
        Task.createTask(taskTitle: titleTextField.text, taskDescription: descriptionText.text) { (success: Bool,  error: Error?) in
            if success {
                print("task created")
                self.dismiss(animated: true, completion: nil)
                self.viewDidAppear(true)
            }
            else {
            print(error?.localizedDescription)}
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
