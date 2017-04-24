//
//  User.swift
//  Nudge
//
//  Created by Lin Zhou on 4/23/17.
//  Copyright © 2017 Dephanie Ho. All rights reserved.
//

import UIKit
import Parse

class User: PFObject{
    var image: UIImage?
    var realname: String?
    var username: String?
    
    class func postUSerImage(image: UIImage?, withCompletion completion: PFBooleanResultBlock?) {
        
        let user = PFObject(className: "User")
        
        user["image"] = getPFFileFromImage(image: image)
        user["username"] = PFUser.current()?.username
        //user["realname"] = PFUser.current().
    }
    
    /**
     Method to convert UIImage to PFFile
     
     - parameter image: Image that the user wants to upload to parse
     
     - returns: PFFile for the the data in the image
     */
    class func getPFFileFromImage(image: UIImage?) -> PFFile? {
        if let image = image{
            if let imageData = UIImagePNGRepresentation(image){
                return PFFile(name: "image.png", data: imageData)
            }
        }
        return nil
    }
}

