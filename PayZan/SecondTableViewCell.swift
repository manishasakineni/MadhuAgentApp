//
//  SecondTableViewCell.swift
//  Screens2
//
//  Created by Manoj on 15/11/17.
//  Copyright © 2017 Manoj. All rights reserved.
//

import UIKit

class SecondTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var dateOutLet: UILabel!
    
    
    @IBOutlet weak var networkOutLet: UILabel!
    
    
    @IBOutlet weak var numbersOutLet: UILabel!
    
    
    @IBOutlet weak var phNoOutLet: UILabel!
    
    @IBOutlet weak var amountOutLet: UILabel!
    
    @IBOutlet weak var postPaidOutLet: UILabel!
    
    
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
                dateOutLet.font = UIFont.systemFont(ofSize: 18)
            
            networkOutLet.font = UIFont.systemFont(ofSize: 18)
            numbersOutLet.font = UIFont.systemFont(ofSize: 18)
            phNoOutLet.font = UIFont.systemFont(ofSize: 18)
            amountOutLet.font = UIFont.systemFont(ofSize: 18)
            postPaidOutLet.font = UIFont.systemFont(ofSize: 18)

            
            
        }
        else {
            
            //            todayTrnsHeight.constant = 24
            //
            //            headLabel.font = UIFont.systemFont(ofSize: 14)
            //            
        }
        
        
        
        
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
