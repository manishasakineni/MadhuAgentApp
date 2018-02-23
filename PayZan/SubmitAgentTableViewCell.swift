//
//  SubmitAgentTableViewCell.swift
//  PayZan
//
//  Created by CalibrageMac02 on 01/11/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit

class SubmitAgentTableViewCell: UITableViewCell {

    
    @IBOutlet weak var submitBtn: UIButton!
    
    @IBOutlet weak var submitBtnHeight: NSLayoutConstraint!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
            submitBtnHeight.constant = 60
            
            submitBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        }
        else {
            
            submitBtnHeight.constant = 50
            
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
