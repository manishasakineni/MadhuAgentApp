//
//  DebitCardTableViewCell.swift
//  PayZanScrollViewScreens
//
//  Created by MANOJ KUMAR on 12/10/17.
//  Copyright © 2017 MANOJ KUMAR. All rights reserved.
//

import UIKit
import AMPFloatingTextField
import TextFieldEffects


class DebitCardTableViewCell: UITableViewCell,UITextFieldDelegate {
    
    
    
    @IBOutlet var debitCardDetailsView: UIView!
    
    @IBOutlet var cardNumberTxtField: AkiraTextField!
    
    
    @IBOutlet var monthTxtField: AkiraTextField!
    
    @IBOutlet var yearTxtField: AkiraTextField!
    
    
    @IBOutlet var cardHoldersTxtField: AkiraTextField!
    
    @IBOutlet var cardLabelTxtField: AkiraTextField!
    
    @IBOutlet weak var payNowBtn: UIButton!
    
    @IBOutlet weak var cvvTF: AkiraTextField!
    
    @IBOutlet weak var cvvBtnOutLet: UIButton!
    
    @IBOutlet weak var checkBoxImg: UIImageView!
    
    
    @IBOutlet weak var enterCardLabel: UILabel!
    
    @IBOutlet weak var expireDateLabel: UIButton!
    
    @IBOutlet weak var saveCardLabel: UILabel!
    
    @IBOutlet weak var securedLabel: UILabel!
    
    @IBOutlet weak var cvvImg: UIButton!
    
    
    @IBOutlet weak var cardNumHeight: NSLayoutConstraint!
    
    @IBOutlet weak var monthHeight: NSLayoutConstraint!
    
    @IBOutlet weak var yearHeight: NSLayoutConstraint!
    
    @IBOutlet weak var cvvHeight: NSLayoutConstraint!
    
    @IBOutlet weak var cardHolderHeight: NSLayoutConstraint!
    
    @IBOutlet weak var cardLabelHeight: NSLayoutConstraint!
    
    @IBOutlet weak var payNowBtnHeight: NSLayoutConstraint!
    
    var lblRight = UILabel()
    
    var imageA = UIImage(named: "selectedBox")!
    var imageB = UIImage(named: "unselectedBox")!
    
    var imgIsactive: Bool = true
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
     //   cardLabelTxtField.layer.cornerRadius = 5
        
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
            payNowBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
            
            cardNumberTxtField.font = UIFont.systemFont(ofSize: 15)
            cardHoldersTxtField.font = UIFont.systemFont(ofSize: 15)
            cardLabelTxtField.font = UIFont.systemFont(ofSize: 15)

            monthTxtField.font = UIFont.systemFont(ofSize: 15)
            yearTxtField.font = UIFont.systemFont(ofSize: 15)
            cvvTF.font = UIFont.systemFont(ofSize: 15)

            
            enterCardLabel.font = UIFont.systemFont(ofSize: 18)
            expireDateLabel.titleLabel?.font = UIFont.systemFont(ofSize: 18)
            
            payNowBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
            
            saveCardLabel.font = UIFont.systemFont(ofSize: 15)
            securedLabel.font = UIFont.systemFont(ofSize: 15)
            
            cardNumHeight.constant = 60
            
            monthHeight.constant = 50
            
            yearHeight.constant = 50
            
            cvvHeight.constant = 50
            
            cardHolderHeight.constant = 60
            
            cardLabelHeight.constant = 60
            
            payNowBtnHeight.constant = 55
            
        }
        else {
            
            payNowBtn.titleLabel?.font = UIFont.systemFont(ofSize: 11)
            
        }
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        checkBoxImg.isUserInteractionEnabled = true
        checkBoxImg.addGestureRecognizer(tapGestureRecognizer)
        
        cardHoldersTxtField.delegate = self
        
        cardNumberTxtField.delegate = self
        cardLabelTxtField.delegate = self
        
        
        
//        cardNumberTxtField.layer.cornerRadius = 8
//        cardHoldersTxtField.layer.cornerRadius = 8
//        cardLabelTxtField.layer.cornerRadius = 8
        
        checkBoxImg.image = UIImage(named:"selectedBox")
        
//        applySkyscannerTheme(textField: cardNumberTxtField)
//        applySkyscannerTheme(textField: cardHoldersTxtField)
//        applySkyscannerTheme(textField: cardLabelTxtField)
        
        borderColor1()
        
        
        // Initialization code
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
    
    func borderColor1(){
        
        
        debitCardDetailsView.layer.borderWidth = 1
        debitCardDetailsView.layer.cornerRadius = 6

        
        debitCardDetailsView.layer.borderColor = UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0).cgColor
        
//        cardNumberTxtField.layer.borderColor = UIColor(red:211.0/255.0, green:211.0/255.0, blue:211.0/255.0, alpha: 1.0).cgColor

//        monthTxtField.layer.borderColor = UIColor(red:207.0/255.0, green:207.0/255.0, blue:207.0/255.0, alpha: 1.0).cgColor
//        monthTxtField.layer.borderWidth = 1
//        
//        yearTxtField.layer.borderColor = UIColor(red:211.0/255.0, green:211.0/255.0, blue:211.0/255.0, alpha: 1.0).cgColor
//        yearTxtField.layer.borderWidth = 1
//        
//        cvvTF.layer.borderColor = UIColor(red:211.0/255.0, green:211.0/255.0, blue:211.0/255.0, alpha: 1.0).cgColor
//        cvvTF.layer.borderWidth = 1
        
//        cardHoldersTxtField.layer.borderColor = UIColor(red:211.0/255.0, green:211.0/255.0, blue:211.0/255.0, alpha: 1.0).cgColor
//        
//        cardLabelTxtField.layer.borderColor = UIColor(red:211.0/255.0, green:211.0/255.0, blue:211.0/255.0, alpha: 1.0).cgColor


        
        
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
        
        if !string.canBeConverted(to: String.Encoding.ascii){
            
            return false
            
        }

        /// 1. replacementString is NOT empty means we are entering text or pasting text: perform the logic
        /// 2. replacementString is empty means we are deleting text: return true
        
        
        
        if textField == cardHoldersTxtField{
            
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
    
    @IBAction func textChangeAction(_ textField: UITextField) {
        
        if textField == cardNumberTxtField{
            
            //this is a credit card number
            //NOTE:this does not cover ALL cards but is used as a simple example of something you COULD do
            
            if (cardNumberTxtField.text!.hasPrefix("4")){
                lblRight.text = "VISA"
            }
            else if (cardNumberTxtField.text!.hasPrefix("65") || cardNumberTxtField.text!.hasPrefix("6011")){
                lblRight.text = "Discover"
            }
            else if (cardNumberTxtField.text!.hasPrefix("34") || cardNumberTxtField.text!.hasPrefix("37")){
                lblRight.text = "AMEX"
            }
            else if (cardNumberTxtField.text!.characters.count > 0){
                lblRight.text = "MasterCard" //yes, this a simplification, again, it's an example
            }
            else{
                lblRight.text = ""
            }
        }
        
    }
    
    @IBAction func cvvBtnAction(_ sender: Any) {
    }
    
  

}
