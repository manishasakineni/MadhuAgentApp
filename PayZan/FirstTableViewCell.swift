//
//  FirstTableViewCell.swift
//  Screens
//
//  Created by Manoj on 15/11/17.
//  Copyright © 2017 Manoj. All rights reserved.
//

import UIKit

class FirstTableViewCell: UITableViewCell {
    
    @IBOutlet weak var netWrkHeight: NSLayoutConstraint!
    
    
    @IBOutlet weak var netWrkWidth: NSLayoutConstraint!
    
    @IBOutlet weak var trasactionWidth: NSLayoutConstraint!
    
    @IBOutlet weak var transactionHeight: NSLayoutConstraint!
    
    @IBOutlet weak var amountWidth: NSLayoutConstraint!
    
    @IBOutlet weak var amountHeight: NSLayoutConstraint!
    
    @IBOutlet weak var comisionHeight: NSLayoutConstraint!
    
    @IBOutlet weak var comisionWidth: NSLayoutConstraint!
    @IBOutlet weak var netWorkOutLet: UILabel!
    
    
    @IBOutlet weak var transactionsOutLet: UILabel!
    
    
    @IBOutlet weak var amountOutLet: UILabel!
    
    @IBOutlet weak var commissionOutLet: UILabel!
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
            netWrkHeight.constant = 25
            netWrkWidth.constant = 120
            trasactionWidth.constant = 130
            transactionHeight.constant = 25
            amountWidth.constant = 160
            amountHeight.constant = 25
            comisionHeight.constant = 25
            comisionWidth.constant = 200
            
            
            netWorkOutLet.font = UIFont.systemFont(ofSize: 18)
            transactionsOutLet.font = UIFont.systemFont(ofSize: 18)
            amountOutLet.font = UIFont.systemFont(ofSize: 18)
            commissionOutLet.font = UIFont.systemFont(ofSize: 18)

            
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
