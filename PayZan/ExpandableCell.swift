//
//  ExpandableCell.swift
//  DemoExpanded
//
//  Created by Mac OS on 28/12/17.
//  Copyright © 2017 Mac OS. All rights reserved.
//

import UIKit
import TextFieldEffects

class ExpandableCell: UITableViewCell {

    @IBOutlet weak var expandableBackGroundView: UIView!
    
    
    @IBOutlet weak var CVVTextField: AkiraTextField!
    
    
    @IBOutlet weak var payNowButton: UIButton!
    
    
    @IBOutlet weak var bottomLabel: UILabel!
    
    
    @IBOutlet weak var cvvHeight: NSLayoutConstraint!
    
    @IBOutlet weak var payNowBtnHeight: NSLayoutConstraint!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
             payNowButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
            
            cvvHeight.constant = 50
        }
        else {
            
            payNowButton.titleLabel?.font = UIFont.systemFont(ofSize: 13)
            
            payNowBtnHeight.constant = 35
            
        }
        
        borderColor()
    }

    
    func borderColor(){
        
      //  payNowButton.layer.borderWidth = 1
        payNowButton.layer.cornerRadius = 3
        
//        expandableBackGroundView.layer.cornerRadius = 3.0
//        expandableBackGroundView.layer.shadowColor = UIColor.lightGray.cgColor
//        expandableBackGroundView.layer.shadowOffset = CGSize(width: 0, height: 3)
//        expandableBackGroundView.layer.shadowOpacity = 0.6
//        expandableBackGroundView.layer.shadowRadius = 2.0
//        
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
