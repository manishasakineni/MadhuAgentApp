//
//  NetBankingTableViewCell.swift
//  PayZanScrollViewScreens
//
//  Created by MANOJ KUMAR on 12/10/17.
//  Copyright © 2017 MANOJ KUMAR. All rights reserved.
//

import UIKit

import AMPFloatingTextField

import TextFieldEffects


class NetBankingTableViewCell: UITableViewCell,UITextFieldDelegate {
    
    
    @IBOutlet var netBankingDetailsView: UIView!
    
    
    @IBOutlet var selectBankTextField: AkiraTextField!
    
    @IBOutlet weak var bank1OutLet: UIButton!
    
    
    @IBOutlet weak var bank2OutLet: UIButton!
    
    @IBOutlet weak var bank3OutLet: UIButton!
    
    @IBOutlet weak var bank4OutLet: UIButton!
    
    
    @IBOutlet weak var bank5OutLet: UIButton!
    
    @IBOutlet weak var bank6OutLet: UIButton!
    
    @IBOutlet weak var textfiledHeight: NSLayoutConstraint!
    
    @IBOutlet weak var payBtnHeight: NSLayoutConstraint!
    
    @IBOutlet weak var payNowBtn: UIButton!
    
    @IBOutlet weak var selectTextLabel: UILabel!
    
    
    var selectedButtonString = ""


    override func awakeFromNib() {
        super.awakeFromNib()
        borderColor()
        
        selectBankTextField.delegate = self
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
            textfiledHeight.constant = 60
            payBtnHeight.constant = 55
            
            payNowBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
            selectBankTextField.font = UIFont.systemFont(ofSize: 15)
            selectTextLabel.font = UIFont.systemFont(ofSize: 18)

        }
        else {
            
            textfiledHeight.constant = 45
            payBtnHeight.constant = 35
            
        }
        
//        applySkyscannerTheme(textField: selectBankTextField)
        // Initialization code
    }
    
    func borderColor(){
        
        netBankingDetailsView.layer.borderWidth = 1
        netBankingDetailsView.layer.cornerRadius = 6

        
        netBankingDetailsView.layer.borderColor = UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0).cgColor
        
        
        selectBankTextField.layer.borderColor = UIColor(red:211.0/255.0, green:211.0/255.0, blue:211.0/255.0, alpha: 1.0).cgColor

        
        
        
        
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
        textField.errorBackGroundColor = UIColor.lightGray.withAlphaComponent(0.1)
        //        textField.borderStyle = .roundedRect
        textField.placeholderColor = UIColor.lightGray
        textField.lineColor = UIColor.white
        textField.selectedTitleColor = #colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1)
        
        // Set custom fonts for the title, placeholder and textfield labels
        //        textField.titleLabel.font = UIFont.systemFont(ofSize: 12)
        //        textField.placeholderFont = UIFont.systemFont(ofSize: 18)
        //        textField.font = UIFont.systemFont(ofSize: 18)
        //        textField.isImmediateValidation = true
    }

    
    
    @IBAction func bank1Action(_ sender: Any) {
        
        selectedButtonString = "HDFC"
    selectBankTextField.text = selectedButtonString
        
     
      //  creditCardButtonOutLet.setImage(UIImage(named: "payment_creitcard_active"), for: UIControlState.normal)

    }
    
    
    
    @IBAction func bank2Action(_ sender: Any) {
        
        selectedButtonString = "ICICI"
        selectBankTextField.text = selectedButtonString
     
    }
    
    @IBAction func bank3Action(_ sender: Any) {
        
        selectedButtonString = "SBI"
        selectBankTextField.text = selectedButtonString
      
    }
    
    @IBAction func bank4Action(_ sender: Any) {
        
        selectedButtonString = "BOI"
        selectBankTextField.text = selectedButtonString
     
    }
    
    @IBAction func bank5Action(_ sender: Any) {
        
        selectedButtonString = "BOB"
        selectBankTextField.text = selectedButtonString
        
        
    }
   
    @IBAction func bank6Action(_ sender: Any) {
        
        selectedButtonString = "BOH"
        selectBankTextField.text = selectedButtonString
        
    
    }
    
    
}
