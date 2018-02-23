//
//  AddaddressTableViewCell.swift
//  PayZan
//
//  Created by Manoj on 28/12/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit

class AddaddressTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBOutlet weak var address1Label: UILabel!
    
    @IBOutlet weak var address2Label: UILabel!
    
    @IBOutlet weak var pinCodeLabel: UILabel!
    
        
    @IBOutlet weak var editBtn: UIButton!
    
    @IBOutlet weak var deleteBtn: UIButton!
    
    @IBOutlet weak var nameTextLbl: UILabel!
    
    @IBOutlet weak var add1Lbl: UILabel!
    
    @IBOutlet weak var add2Lbl: UILabel!

    @IBOutlet weak var pinLbl: UILabel!
    
    @IBOutlet weak var editWidth: NSLayoutConstraint!
    
    @IBOutlet weak var editHeight: NSLayoutConstraint!
    
    @IBOutlet weak var deleteWidth: NSLayoutConstraint!
    
    @IBOutlet weak var deleteHeight: NSLayoutConstraint!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
         if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
            nameTextLbl.font = UIFont.boldSystemFont(ofSize: 17)
            add1Lbl.font = UIFont.boldSystemFont(ofSize: 17)
            add2Lbl.font = UIFont.boldSystemFont(ofSize: 17)
            pinLbl.font = UIFont.boldSystemFont(ofSize: 17)
            
            nameLabel.font = UIFont.systemFont(ofSize: 16)
            address1Label.font = UIFont.systemFont(ofSize: 16)
            address2Label.font = UIFont.systemFont(ofSize: 16)
            pinCodeLabel.font = UIFont.systemFont(ofSize: 16)
            
            editBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
            deleteBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
            
            editWidth.constant = 80
            deleteWidth.constant = 80
            
        }
         else {
            
            
            
        }
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
