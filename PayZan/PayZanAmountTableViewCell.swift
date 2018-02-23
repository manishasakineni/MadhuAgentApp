//
//  PayZanAmountTableViewCell.swift
//  PayZan
//
//  Created by CalibrageMac02 on 02/02/18.
//  Copyright © 2018 CalibrageMac02. All rights reserved.
//

import UIKit

class PayZanAmountTableViewCell: UITableViewCell {
    
    @IBOutlet weak var checkBoxBtn: UIButton!
    
    @IBOutlet weak var availableBal: UILabel!
    
    @IBOutlet weak var usePayZanAmount: UILabel!
    
    @IBOutlet weak var totalAmount: UILabel!
    
    @IBOutlet weak var totalAmTextLabel: UILabel!
    
    @IBOutlet weak var usePayzanTextLabel: UILabel!
    
    @IBOutlet weak var availableBalTextLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
            
            availableBal.font = UIFont.systemFont(ofSize: 17)
            usePayZanAmount.font = UIFont.systemFont(ofSize: 17)
            totalAmount.font = UIFont.systemFont(ofSize: 17)
            
            totalAmTextLabel.font = UIFont.systemFont(ofSize: 17)
            usePayzanTextLabel.font = UIFont.systemFont(ofSize: 17)
            availableBalTextLabel.font = UIFont.systemFont(ofSize: 17)
        }
        else {
            
            
//            availableBal.font = UIFont.systemFont(ofSize: 14)
            
        }

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
