//
//  TableViewCell.swift
//  CheckList
//
//  Created by Jackson Huang on 10/13/15.
//  Copyright © 2015 iOS Decal. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var check: UIButton!
    
    @IBOutlet weak var task: UILabel!
    
    weak var tableView: TableViewController!
    
    
    @IBAction func check_button(sender: AnyObject) {
        check.setTitle("Done", forState: .Normal)
        tableView.finishtask++
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
