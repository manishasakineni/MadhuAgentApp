//
//  SendMoneyToWalletCell.swift
//  OffersScreen
//
//  Created by Mac OS on 29/12/17.
//  Copyright © 2017 Mac OS. All rights reserved.
//

import UIKit

import AMPFloatingTextField


class SendMoneyToWalletCell: UITableViewCell {

    @IBOutlet weak var mobileNumber: AMPFloatingTextField!
    
    @IBOutlet weak var amountLabel: AMPFloatingTextField!
    
    @IBOutlet weak var commentLabel: AMPFloatingTextField!
    
    
    @IBOutlet weak var sendMoneyButton: UIButton!
    
    
    
    @IBOutlet weak var backGroundView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
       
        
//        backGroundView.layer.cornerRadius = 3.0
//        backGroundView.layer.shadowColor = UIColor.lightGray.cgColor
//        backGroundView.layer.shadowOffset = CGSize(width: 0, height: 3)
//        backGroundView.layer.shadowOpacity = 0.6
//        backGroundView.layer.shadowRadius = 2.0
//        
        
        // Initialization code
    }
    func borderColor(){
        
        
//        mobileNumber.layer.borderWidth = 0.5
//        mobileNumber.layer.borderColor = UIColor.lightGray.cgColor
//        mobileNumber.layer.cornerRadius = 3
//        mobileNumber.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
//        
//        amountLabel.layer.borderWidth = 0.5
//        amountLabel.layer.borderColor = UIColor.lightGray.cgColor
//        amountLabel.layer.cornerRadius = 3
//        amountLabel.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
//        
//        commentLabel.layer.borderWidth = 0.5
//        commentLabel.layer.borderColor = UIColor.lightGray.cgColor
//        commentLabel.layer.cornerRadius = 3
//        commentLabel.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
//        
//        
        mobileNumber.keyboardType = .phonePad

        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
