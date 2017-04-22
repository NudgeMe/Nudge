//
//  TaskViewCell.swift
//  Nudge
//
//  Created by Thuan Nguyen on 4/16/17.
//  Copyright © 2017 Dephanie Ho. All rights reserved.
//

import UIKit
import Parse

class TaskViewCell: UITableViewCell {
    @IBOutlet weak var tasknameLabel: UILabel!
    @IBOutlet weak var taskDescriptionLabel: UILabel!
    @IBOutlet weak var deadLineLabel: UILabel!
    @IBOutlet weak var onDutyLabel: UILabel!
    
    var task: PFObject! {
        didSet {
            tasknameLabel.text = task["title"] as? String
            taskDescriptionLabel.text = task["description"] as? String
            deadLineLabel.text = task["date"] as? String
            onDutyLabel.text = "Not implemented yet"
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
