//
//  SignOutTableViewCell.swift
//  PageView_Naveen
//
//  Created by Nani Mac on 23/09/17.
//  Copyright © 2017 Naveen. All rights reserved.
//

import UIKit

class SignOutTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var signOutBtn: UIButton!
    
    @IBOutlet weak var signOutBtnHeight: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
            signOutBtnHeight.constant = 50
            signOutBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        }
        else {
            
            signOutBtnHeight.constant = 35
            
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
