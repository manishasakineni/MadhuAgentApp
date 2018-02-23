//
//  ExpandedCell.swift
//  MobleRechargeCard
//
//  Created by Mac OS on 28/12/17.
//  Copyright © 2017 Mac OS. All rights reserved.
//

import UIKit

class ExpandedCell: UITableViewCell {

    @IBOutlet weak var radioButton: UIButton!
    @IBOutlet weak var backGroundView: UIView!
    
    @IBOutlet weak var visaImageView: UIImageView!
    
    @IBOutlet weak var accountNumberLabel: UILabel!
    
    @IBOutlet weak var deleteButton: UIButton!
    
    @IBOutlet weak var bottomLabel: UILabel!
 
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
     //   radioButton.setImage(UIImage(named: "unselectedBox.png"), for: .normal)

        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
            accountNumberLabel.font = UIFont.systemFont(ofSize: 18)
        }
        else {
            
            accountNumberLabel.font = UIFont.systemFont(ofSize: 13)
            
        }
        
//        backGroundView.layer.cornerRadius = 3.0
//        backGroundView.layer.shadowColor = UIColor.lightGray.cgColor
//        backGroundView.layer.shadowOffset = CGSize(width: 0, height: 3)
//        backGroundView.layer.shadowOpacity = 0.6
//        backGroundView.layer.shadowRadius = 2.0
//        
        
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func radioBtnAction(_ sender: Any) {
        
    //    radioButton.setImage(UIImage(named: "selectedBox.png"), for: .normal)
        
//        if select == true {
//            selectBtn.setImage(UIImage(named: "unselectedBox.png"), for: .normal)
//            select = false
//        }
//            
//        else {
//            
//            selectBtn.setImage(UIImage(named: "unselectedBox.png"), for: .normal)
//            select = true
//            
//        }


        
    }
    
}
