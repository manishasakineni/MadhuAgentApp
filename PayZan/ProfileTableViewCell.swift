//
//  ProfileTableViewCell.swift
//  PageView_Naveen
//
//  Created by Nani Mac on 22/09/17.
//  Copyright © 2017 Naveen. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var emaiLabel: UILabel!
    
    @IBOutlet weak var addWalletLabel: UILabel!
        
    @IBOutlet weak var addMoneyBtn: UIButton!
    
    @IBOutlet weak var editBtn: UIButton!
    
    @IBOutlet weak var editImage: UIImageView!
    
    @IBOutlet weak var editProfileBtn: UIButton!
    
    @IBOutlet weak var profileView: UIView!
    
    @IBOutlet weak var walletLabelWidth: NSLayoutConstraint!
    
    @IBOutlet weak var addMoneyBtnWidth: NSLayoutConstraint!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
            
            addMoneyBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            
            userNameLabel.font = UIFont.systemFont(ofSize: 20)
            
            walletLabelWidth.constant = 100
            addMoneyBtnWidth.constant = 150
            
            emaiLabel.font = UIFont.systemFont(ofSize: 20)
            addWalletLabel.font = UIFont.systemFont(ofSize: 18)
            
        }
        else {
            
            
            addMoneyBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
