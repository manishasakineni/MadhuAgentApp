//
//  AddAgentTableViewCell.swift
//  PayZan
//
//  Created by CalibrageMac02 on 30/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit

class AddAgentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var addAgentBtn: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
            
            addAgentBtn.titleLabel?.font = UIFont.systemFont(ofSize: 23)
            
        }
        else {
            
            
            addAgentBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            
        }
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
