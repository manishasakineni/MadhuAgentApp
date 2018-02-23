//
//  AddMoneyToWalletCell.swift
//  OffersScreen
//
//  Created by Mac OS on 30/12/17.
//  Copyright © 2017 Mac OS. All rights reserved.
//

import UIKit

import AMPFloatingTextField



class AddMoneyToWalletCell: UITableViewCell {

    @IBOutlet weak var backGroundView: UIView!
    
    
    
    
    
    @IBOutlet weak var amount100Button: UIButton!
    
    @IBOutlet weak var amount500Button: UIButton!
    
    @IBOutlet weak var amount1000Button: UIButton!
    
    @IBOutlet weak var amountLabel: AMPFloatingTextField!
    
    @IBOutlet weak var promoCodeLabel: AMPFloatingTextField!
    
    @IBOutlet weak var addMoneyButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
        amount100Button.layer.borderColor = UIColor(red: 128.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha:1.0).cgColor
        amount100Button.layer.borderWidth = 1
        amount500Button.layer.borderColor = UIColor(red: 128.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha:1.0).cgColor
        amount500Button.layer.borderWidth = 1
        amount1000Button.layer.borderColor = UIColor(red: 128.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha:1.0).cgColor
        amount1000Button.layer.borderWidth = 1

//        backGroundView.layer.cornerRadius = 3.0
//        backGroundView.layer.shadowColor = UIColor.lightGray.cgColor
//        backGroundView.layer.shadowOffset = CGSize(width: 0, height: 3)
//        backGroundView.layer.shadowOpacity = 0.6
//        backGroundView.layer.shadowRadius = 2.0
        

        
        
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
