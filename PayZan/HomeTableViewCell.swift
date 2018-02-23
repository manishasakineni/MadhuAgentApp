//
//  HomeTableViewCell.swift
//  Payan_Naveen
//
//  Created by Nani Mac on 28/09/17.
//  Copyright © 2017 Naveen. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var homeColeectionVW: UICollectionView!
    
    @IBOutlet weak var headLabel: UILabel!
    
    @IBOutlet weak var rechargeViewHeight: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
            rechargeViewHeight.constant = 48
            
            headLabel.font = UIFont.systemFont(ofSize: 18)
        }
        else {
            
            rechargeViewHeight.constant = 24
            
           headLabel.font = UIFont.systemFont(ofSize: 14)
            
        }

       
//        homeColeectionVW.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
    }
    
    
    
    
    
    
    
    
    
    
}
