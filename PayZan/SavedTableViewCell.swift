//
//  SavedTableViewCell.swift
//  NewScreens
//
//  Created by Manoj on 23/11/17.
//  Copyright © 2017 Manoj. All rights reserved.
//

import UIKit

import AMPFloatingTextField

import TextFieldEffects


class SavedTableViewCell: UITableViewCell,UITextFieldDelegate {

    
    @IBOutlet var creditCardDetailsView: UIView!
    
    
    @IBOutlet var cardNumberTextField: AkiraTextField!
    
    
    @IBOutlet var monthTextField: UITextField!
    
    @IBOutlet var yearTextField: UITextField!
    
    
    @IBOutlet var cardHoldersTextField: AkiraTextField!
    
    
    @IBOutlet var cardLabelTextField: AkiraTextField!
    
    @IBOutlet weak var checkBoxImg: UIImageView!
    
    @IBOutlet weak var addCardBtn: UIButton!
    
    
    @IBOutlet weak var cvvTF: UITextField!
    
    
    @IBOutlet weak var cvvBtnOutLet: UIButton!
    
    var lblRight = UILabel()

    var imgIsactive: Bool = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        checkBoxImg.isUserInteractionEnabled = true
        checkBoxImg.addGestureRecognizer(tapGestureRecognizer)
        
        checkBoxImg.image = UIImage(named:"selectedBox")


     cardNumberTextField.delegate = self
        
        self.borderColor()
        
        cardNumberTextField.delegate = self
        cardHoldersTextField.delegate = self
        cardLabelTextField.delegate = self
        
//        applySkyscannerTheme(textField: cardNumberTextField)
//        applySkyscannerTheme(textField: cardHoldersTextField)
//        applySkyscannerTheme(textField: cardLabelTextField)

        
    }
    
    func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        //        let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        //        if checkBoxImg.image?.accessibilityIdentifier == "selectedBox" {
        
        if imgIsactive == true {
            
            checkBoxImg.image = UIImage(named:"unselectedBox")
            
            imgIsactive = false
        }
        else {
            
            checkBoxImg.image = UIImage(named:"selectedBox")
            
            imgIsactive = true
        }
        
    }
    
    func borderColor(){
        
        creditCardDetailsView.layer.borderWidth = 1
        creditCardDetailsView.layer.borderColor = UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0).cgColor
        
        
        cardNumberTextField.layer.borderColor = UIColor(red:211.0/255.0, green:211.0/255.0, blue:211.0/255.0, alpha: 1.0).cgColor
        
        
        monthTextField.layer.borderColor = UIColor(red:211.0/255.0, green:211.0/255.0, blue:211.0/255.0, alpha: 1.0).cgColor
        
        monthTextField.layer.borderWidth = 1
        yearTextField.layer.borderWidth = 1
        cvvTF.layer.borderWidth = 1
        yearTextField.layer.borderColor = UIColor(red:211.0/255.0, green:211.0/255.0, blue:211.0/255.0, alpha: 1.0).cgColor
        
        cvvTF.layer.borderColor = UIColor(red:211.0/255.0, green:211.0/255.0, blue:211.0/255.0, alpha: 1.0).cgColor
        
        cardHoldersTextField.layer.borderColor = UIColor(red:211.0/255.0, green:211.0/255.0, blue:211.0/255.0, alpha: 1.0).cgColor
        
        cardLabelTextField.layer.borderColor = UIColor(red:211.0/255.0, green:211.0/255.0, blue:211.0/255.0, alpha: 1.0).cgColor
        
    
        
        
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
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        /// 1. replacementString is NOT empty means we are entering text or pasting text: perform the logic
        /// 2. replacementString is empty means we are deleting text: return true
        
        
        
        if textField == cardHoldersTextField{
            
            if string.characters.count > 0 {
                
                let currentCharacterCount = textField.text?.characters.count ?? 0
                if (range.length + range.location > currentCharacterCount){
                    return false
                }
                let newLength = currentCharacterCount + string.characters.count - range.length
                
                let allowedCharacters = CharacterSet.letters
                
                let unwantedStr = string.trimmingCharacters(in: allowedCharacters)
                
                return unwantedStr.characters.count == 0
                
            }
            
        }
        
        
        
        return true
    }
    
    
    @IBAction func cvvBtnAction(_ sender: Any) {
        
        
    }
    
    
}
