//
//  FirsrHomeTableViewCell.swift
//  Homescreen
//
//  Created by Manoj on 17/11/17.
//  Copyright © 2017 Manoj. All rights reserved.
//

import UIKit

class FirsrHomeTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var todayTrnsHeight: NSLayoutConstraint!
    
    
    @IBOutlet weak var mnyColllectedHeight: NSLayoutConstraint!
    
    @IBOutlet weak var todayComisionHeight: NSLayoutConstraint!
    
    @IBOutlet weak var totalComisionHeight: NSLayoutConstraint!
    
    @IBOutlet weak var transactionAmtOutLet: UILabel!
    
    @IBOutlet weak var transactionOutLet: UILabel!
   
    
    @IBOutlet weak var collectionAmtOutLet: UILabel!
    
    
    @IBOutlet weak var collectionOutLet: UILabel!
    
    
    @IBOutlet weak var tdycomisionAmtOutLet: UILabel!
    
    @IBOutlet weak var tdycomisionOutLet: UILabel!
    
    @IBOutlet weak var totalComisionAmtOutLet: UILabel!
    
    @IBOutlet weak var totalComisionOutLet: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
            todayTrnsHeight.constant = 120
            mnyColllectedHeight.constant = 120

            todayComisionHeight.constant = 120
            totalComisionHeight.constant = 120

            
            
            transactionAmtOutLet.font = UIFont.systemFont(ofSize: 20)
            transactionOutLet.font = UIFont.systemFont(ofSize: 20)
            
            collectionAmtOutLet.font = UIFont.systemFont(ofSize: 20)
            collectionOutLet.font = UIFont.systemFont(ofSize: 20)
            
            tdycomisionAmtOutLet.font = UIFont.systemFont(ofSize: 20)
            tdycomisionOutLet.font = UIFont.systemFont(ofSize: 20)
            
            totalComisionAmtOutLet.font = UIFont.systemFont(ofSize: 20)
            totalComisionOutLet.font = UIFont.systemFont(ofSize: 20)

            
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
