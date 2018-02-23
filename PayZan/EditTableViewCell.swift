//
//  EditTableViewCell.swift
//  PayZan
//
//  Created by CalibrageMac02 on 19/01/18.
//  Copyright © 2018 CalibrageMac02. All rights reserved.
//

import UIKit
import AMPFloatingTextField

class EditTableViewCell: UITableViewCell,UITextFieldDelegate {
    
    
    @IBOutlet weak var profileField: AMPFloatingTextField!
    
    @IBOutlet weak var profileFiledHeight: NSLayoutConstraint!
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileField.delegate = self
        
        applySkyscannerTheme(textField: profileField)
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
            profileFiledHeight.constant = 90
        }
        else {
            
           profileFiledHeight.constant = 65
            
        }
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func applySkyscannerTheme(textField: AMPFloatingTextField) {
        
        textField.tintColor = .black
        
        textField.textColor = .black
        textField.errorColor = .red
        //        textField.layer.cornerRadius = 10
        //        textField.borderSize.formSquareRoot()
        textField.rightView?.isHidden = true
        //        textField.activeBackgroundColor = lightGreyColor
        //        textField.inActiveBackgroundColor = lightGreyColor
        textField.selectedTitleColor = #colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1)
        textField.errorBackGroundColor = UIColor.lightGray.withAlphaComponent(0.1)
        textField.borderStyle = .none
        textField.placeholderColor = UIColor.lightGray
        textField.lineColor = UIColor.white
        
        
        // Set custom fonts for the title, placeholder and textfield labels
        //        textField.titleLabel.font = UIFont.systemFont(ofSize: 12)
        //        textField.placeholderFont = UIFont.systemFont(ofSize: 18)
        //        textField.font = UIFont.systemFont(ofSize: 18)
        //        textField.isImmediateValidation = true
    }
    
}
