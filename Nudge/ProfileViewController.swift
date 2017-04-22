//
//  ProfileViewController.swift
//  Nudge
//
//  Created by Lin Zhou on 4/15/17.
//  Copyright © 2017 Dephanie Ho. All rights reserved.
//

import UIKit
import Parse

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var realName: UILabel!
    
    @IBOutlet weak var groupLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let user = PFUser.current() {
        usernameLabel.text = user.username
        realName.text = user["fullname"] as? String
    
        if (user["isInGroup"] as! Bool){
                groupLabel.text = user["group"] as? String
            }
        else {
                groupLabel.text = "No Group"
            
            }
            
        
        }
        
        // Do any additional setup after loading the view.
    }
    
    //TODO
    func fetchUserInfo(){
        let query = PFQuery(className: "User")
        query.whereKey("username", equalTo:"user")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogout(_ sender: Any) {
        
        
        //TODO confirm b4 logout
        PFUser.logOutInBackground { (error: Error?) in
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "UserDidLogOut"), object: nil)
            
        }
    }

    //Function to add a photo to profile picture
    @IBAction func onProfilePicture(_ sender: UIButton) {
        print("Clicked button")
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(vc, animated: true, completion: nil)
        sender.isHidden = true
    }
    //Set profile picture as the selected image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        //Set image
        pictureImageView.image = originalImage
        
        //Dismiss imagePIckerController to go back to original view controller
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onCreateGroup(_ sender: Any) {
        let user = PFUser.current()!
        let isInGroup = user["isInGroup"] as! Bool
        if isInGroup{
            let alert = UIAlertController(title: "Oops", message: "Already in a group", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        else {
            self.performSegue(withIdentifier: "newGroupSegue", sender: nil)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewDidLoad()
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
