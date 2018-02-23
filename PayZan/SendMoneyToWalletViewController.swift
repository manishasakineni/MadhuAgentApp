//
//  SendMoneyToWalletViewController.swift
//  PayZan
//
//  Created by Mac OS on 30/12/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit
import ContactsUI

import AMPFloatingTextField
import IQKeyboardManagerSwift


class SendMoneyToWalletViewController: BaseViewController,UITextFieldDelegate,CNContactPickerDelegate {
    
    
    
    var sendDelegate: sendTilteDelegate?

    var copyDelegate: CopyDataDelegate?

    var delegate: walletSubtitleOfIndexDelegate?

    @IBOutlet weak var commentTextfield: AMPFloatingTextField!
    
    @IBOutlet weak var sendAmountField: AMPFloatingTextField!
    @IBOutlet weak var mobileNumField: AMPFloatingTextField!

    @IBOutlet weak var phoneBookBtn: UIButton!
    
    @IBOutlet weak var phoneBookAction: UIButton!
    
    @IBOutlet weak var mobileFieldHeight: NSLayoutConstraint!
    
    @IBOutlet weak var amountFieldHeight: NSLayoutConstraint!
    
    @IBOutlet weak var commentsFieldHeight: NSLayoutConstraint!
    
    @IBOutlet weak var sendMoneyBtnHeight: NSLayoutConstraint!
    
    @IBOutlet weak var sendMoneyBtn: UIButton!
    
    
    let refView = WalletViewController()

    var userId:String? = ""
    var walletId:String? = ""
    
    var mobileNo:String? = ""
    
    var totalEnteredAmount:Double = 0.0
    
    let serviceController = ServiceController()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sendAmountField.delegate = self
        commentTextfield.delegate = self
        
        
        
        placeHolderCode()
        
//        mobileNumField.layer.borderWidth = 0.5
//        mobileNumField.layer.borderColor = UIColor.lightGray.cgColor
//        mobileNumField.layer.cornerRadius = 3
//        mobileNumField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
//        
//        sendAmountField.layer.borderWidth = 0.5
//        sendAmountField.layer.borderColor = UIColor.lightGray.cgColor
//        sendAmountField.layer.cornerRadius = 3
//        sendAmountField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
//
//        commentTextfield.layer.borderWidth = 0.5
//        commentTextfield.layer.borderColor = UIColor.lightGray.cgColor
//        commentTextfield.layer.cornerRadius = 3
//        commentTextfield.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        
        
        
        mobileNumField.keyboardType = .phonePad
        mobileNumField.delegate = self

        
        commentTextfield.autocorrectionType = .no
        sendAmountField.autocorrectionType = .no
        
        sendAmountField.keyboardType = .decimalPad
        
        sendAmountField.maxLengthTextField = 7

        
        let defaults = UserDefaults.standard
        
        if let userid = defaults.string(forKey: userIDD) {
            
            userId = userid
            
            print("defaults savedString: \(userid)")
        }
        
        if let mobi = defaults.string(forKey: mobileNum) {
            
            mobileNo = mobi
            
            print("defaults savedString: \(mobi)")
        }
        if let walletid = defaults.string(forKey: walletIDD) {
            
            walletId = walletid
            
            print("defaults savedString: \(walletid)")
            
        }
        
         if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
            sendMoneyBtnHeight.constant = 60
            sendAmountField.updateBorder()
            amountFieldHeight.constant = 90
            mobileFieldHeight.constant = 90
            commentsFieldHeight.constant = 90
           
            mobileNumField.font = UIFont.systemFont(ofSize: 20)
            mobileNumField.placeholderFont = UIFont.systemFont(ofSize: 20)
            mobileNumField.titleFont = UIFont.systemFont(ofSize: 20)
            mobileNumField.errorLabel.font = UIFont.systemFont(ofSize: 14)
            
            sendAmountField.font = UIFont.systemFont(ofSize: 20)
            sendAmountField.placeholderFont = UIFont.systemFont(ofSize: 20)
            sendAmountField.titleFont = UIFont.systemFont(ofSize: 20)
            sendAmountField.errorLabel.font = UIFont.systemFont(ofSize: 14)
            
            commentTextfield.font = UIFont.systemFont(ofSize: 20)
            commentTextfield.placeholderFont = UIFont.systemFont(ofSize: 20)
            commentTextfield.titleFont = UIFont.systemFont(ofSize: 20)
            commentTextfield.errorLabel.font = UIFont.systemFont(ofSize: 14)
            
            sendMoneyBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            
        }
         else {
            
            
        }
        
       
     
        // Do any additional setup after loading the view.
        
      //  IQKeyboardManager.sharedManager().enable = false
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        placeHolderCode()
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
            sendMoneyBtnHeight.constant = 60
            sendAmountField.updateBorder()
            amountFieldHeight.constant = 90
            mobileFieldHeight.constant = 90
            commentsFieldHeight.constant = 90
            
            mobileNumField.font = UIFont.systemFont(ofSize: 20)
            mobileNumField.placeholderFont = UIFont.systemFont(ofSize: 20)
            mobileNumField.titleFont = UIFont.systemFont(ofSize: 20)
            mobileNumField.errorLabel.font = UIFont.systemFont(ofSize: 15)
            
            sendAmountField.font = UIFont.systemFont(ofSize: 20)
            sendAmountField.placeholderFont = UIFont.systemFont(ofSize: 20)
            sendAmountField.titleFont = UIFont.systemFont(ofSize: 20)
            sendAmountField.errorLabel.font = UIFont.systemFont(ofSize: 15)
            
            commentTextfield.font = UIFont.systemFont(ofSize: 20)
            commentTextfield.placeholderFont = UIFont.systemFont(ofSize: 20)
            commentTextfield.titleFont = UIFont.systemFont(ofSize: 20)
            commentTextfield.errorLabel.font = UIFont.systemFont(ofSize: 15)
            
            sendMoneyBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            
        }
        else {
            
            
        }
        
        let defaults = UserDefaults.standard
        
        if let mobi = defaults.string(forKey: mobileNum) {
            
            mobileNo = mobi
            
            print("defaults savedString: \(mobi)")
        }
        
      //  mobileNumField.text = ""
//        sendAmountField.text = ""
//        commentTextfield.text = ""
        
//        IQKeyboardManager.sharedManager().enable = false
        
        if let delegate = self.sendDelegate {
            delegate.sendString(stringValue: "app.SendMoneytowallet".localize())
            
        }
        
//        self.sendAmountField.text = ""
//        self.commentTextfield.text = ""

        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        
//        IQKeyboardManager.sharedManager().enable = false
    }
    
    func placeHolderCode(){
        
        // textfield effect
        
        mobileNumField.placeholder = "app.MobileNumber".localize()
        mobileNumField.selectedTitle = "app.MobileNumber".localize()
        mobileNumField.title = "app.MobileNumber".localize()
        mobileNumField.maxLengthTextField = 13
        
        
        commentTextfield.placeholder = "app.CommentOptional".localize()
        commentTextfield.selectedTitle = "app.CommentOptional".localize()
        commentTextfield.title = "app.CommentOptional".localize()
        commentTextfield.maxLengthTextField = 100
        
        sendAmountField.placeholder = "app.Amount".localize()
        sendAmountField.selectedTitle = "app.Amount".localize()
        sendAmountField.title = "app.Amount".localize()
        
        sendAmountField.maxLengthTextField = 7
        sendAmountField.setLeftPaddingPoints(4)
        commentTextfield.setLeftPaddingPoints(4)
        mobileNumField.setLeftPaddingPoints(4)
        
        applySkyscannerTheme(textField: mobileNumField)
        applySkyscannerTheme(textField: sendAmountField)
        applySkyscannerTheme(textField: commentTextfield)
    }
    
    func applySkyscannerTheme(textField: AMPFloatingTextField) {
        
        textField.tintColor = .black
        
        textField.textColor = .black
        textField.errorLabel.textColor = .red
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
        textField.titleLabel.font = UIFont.systemFont(ofSize: 12)
        textField.placeholderFont = UIFont.systemFont(ofSize: 12)
        //        textField.errorLabel.font = UIFont.systemFont(ofSize: 8)
        //        textField.font = UIFont.systemFont(ofSize: 18)
        //        textField.isImmediateValidation = true
    }

    func validateAllFields() -> Bool
    {
        mobileNumField.text=mobileNumField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
        
        sendAmountField.text = sendAmountField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
        
        
        let phoneField:NSString = mobileNumField.text! as NSString
        let amField:NSString = sendAmountField.text! as NSString
        let comments:NSString = commentTextfield.text! as NSString
        
        if !(sendAmountField.text?.isEmpty)! {
            
            totalEnteredAmount = Double(sendAmountField.text!)!
            
        }

        
        var errorMessage:NSString?
        
        if (phoneField.length<=0) {
            
            errorMessage=GlobalSupportingClass.blankPhoneNumberErrorMessage() as String as String as NSString?
        }
        else if (phoneField.length<=9) {
            
            errorMessage=GlobalSupportingClass.invalidPhoneNumberErrorMessage() as String as String as NSString?
        }
        else if (amField.length<=0) {
            
            errorMessage=GlobalSupportingClass.blankAmountErrorMessage() as String as String as NSString?
        }
            
        else if (totalEnteredAmount > 5000) {
            
            errorMessage=GlobalSupportingClass.AmountErrorMessage() as String as String as NSString?
        }
        
        else if (comments.length > 50) {
            
            errorMessage=GlobalSupportingClass.blankAmountErrorMessage() as String as String as NSString?
        }
        
        
        if let errorMsg = errorMessage{
            
            if (phoneField.length<=0) {
                
                mobileNumField.errorMessage = errorMsg as String
                mobileNumField.errorLabel.textColor = .red
                
            }
           else if (phoneField.length<=9) {
                
                mobileNumField.errorMessage = errorMsg as String
                mobileNumField.errorLabel.textColor = .red
                
            }
            
            else if (amField.length<=0) {
                
                sendAmountField.errorMessage = errorMsg as String
                sendAmountField.errorLabel.textColor = .red
                
            }
            else if (totalEnteredAmount > 5000) {
                
                sendAmountField.errorMessage = errorMsg as String
                sendAmountField.errorLabel.textColor = .red
            }
            else if (comments.length > 50) {
            commentTextfield.errorMessage = errorMsg as String
            commentTextfield.errorLabel.textColor = .red
            
            }
            return false;
        }
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if !string.canBeConverted(to: String.Encoding.ascii){
            
            return false
            
        }
        
//        let countdots = (sendAmountField.text?.components(separatedBy: ".").count)! - 1
//        
//        if countdots > 0 && string == "."
//        {
//            return false
//        }

        /// 1. replacementString is NOT empty means we are entering text or pasting text: perform the logic
        /// 2. replacementString is empty means we are deleting text: return true
        
          let newString = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        
        if(textField==self.sendAmountField&&range.location==0)
        {
            if (string.hasPrefix("0") || string.hasPrefix("."))
            {
                return false
            }
            
        
        
        
        }

    
        if textField == mobileNumField{
            
            if string.characters.count > 0 {
                
                let currentCharacterCount = textField.text?.characters.count ?? 0
                if (range.length + range.location > currentCharacterCount){
                    return false
                }
                let newLength = currentCharacterCount + string.characters.count - range.length
                
                let allowedCharacters = CharacterSet.decimalDigits
                
                let unwantedStr = string.trimmingCharacters(in: allowedCharacters)
                
                return newLength <= 10 && unwantedStr.characters.count == 0
                
            }
            
        }
        
        if textField == sendAmountField{
            
            if string.characters.count > 0 {
                
               
                
                if let enteredValue = Int(newString){
                    if(enteredValue > 5000){
                        
            Utilities.sharedInstance.alertWithOkButtonAction(vc: self, alertTitle: "app.Alert".localize(), messege: "app.PleaseEnterAmountLessThan5000".localize(), clickAction: {
                            
                            
                        })
                        
                    }
                }
                
                let currentCharacterCount = textField.text?.characters.count ?? 0
                if (range.length + range.location > currentCharacterCount){
                    return false
                }
                let newLength = currentCharacterCount + string.characters.count - range.length
                
                let allowedCharacters = CharacterSet.decimalDigits
                
                let unwantedStr = string.trimmingCharacters(in: allowedCharacters)
                
                return newLength <= 4 && unwantedStr.characters.count == 0
                
            }
            
        }
        
        return true
    }
    
    //MARK:- sendMoneyToWalletService
    
    
    func sendMoneyToWalletService(){
        
        
        if !(walletId?.isEmpty)! && !(userId?.isEmpty)! {
            
            let walletField:String = sendAmountField.text!
            
            let phone:String = mobileNumField.text!
            
            let  strUrl = sendWalletUrl
            
            
            let currentDate = GlobalSupportingClass.getCurrentDate()
            
            print("currentDate\(currentDate)")
            
            let dictParams = ["userWalletHistory": [
                "WalletId": walletId!,
                "Amount": walletField,
                "TransactionTypeId": "9",
                "ReasonTypeId": "10",
                "Id": 0,
                "IsActive": true,
                "CreatedBy": userId!,
                "ModifiedBy": userId!,
                "Created": currentDate,
                "Modified": currentDate
                ],"recieverUserName": phone] as NSDictionary
            
            print("dic params \(dictParams)")
            
            let dictHeaders = ["":"","":""] as NSDictionary
            
            
            print("dictHeader:\(dictHeaders)")
            
            serviceController.requestPOSTURL(strURL: strUrl as NSString, postParams: dictParams, postHeaders: dictHeaders, successHandler:{(result) in
                DispatchQueue.main.async()
                    {
                        
                        print("result:\(result)")
                        
                        let respVO:SendWalletVo = Mapper().map(JSONObject: result)!
                        
                        
                        print("responseString = \(respVO)")
                        
                        
                        let statusCode = respVO.IsSuccess
                        
                        print("StatusCode:\(String(describing: statusCode))")
                        
                        
                        if statusCode == true
                        {
                            
                            let successMsg = respVO.EndUserMessage
                            
                            let waleetBalance = respVO.Result?.Balance
                            
                            let defaults = UserDefaults.standard
                            
                            
                            defaults.set(waleetBalance, forKey: "walletAmount")
                            
                            
                            if let walletAmount = defaults.string(forKey: "walletAmount") {
                                
                              //  self.refView.walletBalLabel.text = walletAmount
                                
//                                 let reOrderPopOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WalletViewController") as! WalletViewController
//                                                              
                                if let delegate = self.copyDelegate {
                                    
                                    delegate.stringToBeCopied(stringValue: walletAmount)
                                    
                                }

                                
                           //     self.walletBalLabel.text = walletAmount
                                
                                print("defaults savedString: \(walletAmount)")
                            }
                            
                            self.sendAmountField.updateBorder()
                            self.mobileNumField.updateBorder()
                            self.commentTextfield.updateBorder()
                            
                            self.sendAmountField.text! = ""
                            self.mobileNumField.text! = ""
                            self.commentTextfield.text! = ""
                            
                            self.sendAmountField.resignFirstResponder()
                            self.mobileNumField.resignFirstResponder()
                            self.commentTextfield.resignFirstResponder()
                            
                            //                        let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                            //                        self.navigationController?.pushViewController(homeViewController, animated: true)
                            
                            
                            self.appDelegate.window?.makeToast(successMsg!, duration:kToastDuration, position:CSToastPositionCenter)
                            
                            
                            
                        }
                        else if statusCode == false{
                            
                            let failMsg = respVO.EndUserMessage
                            
                            self.showAlertViewWithTitle("Failed", message: failMsg!, buttonTitle: "Ok")
                            
                        }
                            
                        else
                        {
                            
                            let failMsg = respVO.EndUserMessage
                            
                            self.showAlertViewWithTitle("Failed", message: failMsg!, buttonTitle: "Ok")
                            
                        }
                }
            }, failureHandler: {(error) in
                
                
                if(error == "unAuthorized"){
                    self.serviceController.refreshTokenForLogin(successHandler:{(result) in
                        DispatchQueue.main.async()
                            {
                                
                                self.sendMoneyToWalletService()
                                
                        }
                    }, failureHandler:  {(error) in
                        
                        DispatchQueue.main.async()
                            {
                                
                                let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                                
                                let viewController = mainStoryboard.instantiateViewController(withIdentifier: "LoginNav") as! UINavigationController
                                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                                appDelegate.window?.rootViewController = viewController
                                
                        }
                        
                        
                    })
                }
            })
        }
        
        
    }

    //MARK:- validateSendMoneyFields
    
    
    func validateSendMoneyFields() -> Bool
    {
        mobileNumField.text=mobileNumField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
        sendAmountField.text=sendAmountField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
        
        let mnumb:NSString = mobileNumField.text! as NSString
        let sendAmount:NSString = sendAmountField.text! as NSString
        
        
        //Check whether textField are left empty or not
        var errorMessage:NSString?
        
        if (mnumb.length<=0) {
            errorMessage=GlobalSupportingClass.blankPhoneNumberErrorMessage() as String as String as NSString?
        }
        else if (mnumb.length<=9) {
            errorMessage=GlobalSupportingClass.invalidPhoneNumberErrorMessage() as String as String as NSString?
        }
            
        else if (mobileNumField.text == "0000000000") {
            errorMessage=GlobalSupportingClass.valiedPhoneNumberErrorMessage() as String as String as NSString?
            
        }
            
        else if (sendAmount.length<=0) {
            errorMessage=GlobalSupportingClass.blankSendAmountErrorMessage() as String as String as NSString?
        }
        
        if let errorMsg = errorMessage{
            
            self.showAlertViewWithTitle("app.Alert".localize(), message: errorMsg as String, buttonTitle: "app.Retry".localize())
            return false;
        }
        return true
    }
    
    
    @IBAction func sendMoneyAction(_ sender: Any) {
        
        
        if validateAllFields(){
            
            if(appDelegate.checkInternetConnectivity()){
                
                if !(walletId?.isEmpty)! && !(userId?.isEmpty)! {
                    
                    let phone:String = mobileNumField.text!
                    
                    if phone == mobileNo {
                        
                        
                    self.showAlertViewWithTitle("app.Alert".localize(), message: "You Can Not Transfer Money To Your Own Account", buttonTitle: "app.Retry".localize())
                        
                    }
                    else {
                        
                        sendMoneyToWalletService()
                    }
                    
                    
                   
                }
                else {
                    
                    let alertController = UIAlertController(title: "app.Alert".localize(), message: "app.LoginAlert".localize(), preferredStyle: UIAlertControllerStyle.alert)
                    
                    
                    let cancelAction = UIAlertAction(title: "app.Cancel".localize(), style: UIAlertActionStyle.cancel) { (result : UIAlertAction) -> Void in
                        print("Cancel")
                        
                        
                    }
                    let okAction = UIAlertAction(title: "app.Ok".localize(), style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
                        print("OK")
                        
                        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                        
                        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "LoginNav") as! UINavigationController
                        //                    let navigationController = UINavigationController(rootViewController: viewController)
                        let appDelegate = UIApplication.shared.delegate as! AppDelegate
                        appDelegate.window?.rootViewController = viewController
                    }
                    alertController.addAction(cancelAction)
                    alertController.addAction(okAction)
                    self.present(alertController, animated: true, completion: nil)
                    
                }
                
                
            }
            else {
                
                self.appDelegate.window?.makeToast(kNetworkStatusMessage, duration:kToastDuration, position:CSToastPositionCenter)
                return
                
            }
            
        }
        
        
    }
  
       override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func phoneBookAction(_ sender: Any) {
        
        if #available(iOS 9.0, *) {
            let cnPicker = CNContactPickerViewController()
            cnPicker.delegate = self
            self.present(cnPicker, animated: true, completion: nil)
        } else {
            // Fallback on earlier versions
        }
    }

    //MARK:- CNContactPickerDelegate Method
    
    @objc @available(iOS 9.0, *)
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        
        let contactNo = contact.phoneNumbers
        
        let phoneNumber = contactNo.first?.value
        
        let phoneNo = phoneNumber?.stringValue
        
        let formattedString = phoneNo?.replacingOccurrences(of: " ", with: "")
        
        let removeunderscore = formattedString?.replacingOccurrences(of: "-", with: "")
        
        let removebraces = removeunderscore?.replacingOccurrences(of: "(", with: "")
        
        let finalNo = removebraces?.replacingOccurrences(of: ")", with: "")
        
        let last10 = finalNo?.substring(from:(finalNo?.index((finalNo?.endIndex)!, offsetBy: -10))!)
        
        mobileNumField.text = last10!
        
        
    }
    
//    @available(iOS 9.0, *)
//    func contactPicker(_ picker: CNContactPickerViewController, didSelect contacts: [CNContact]) {
//        contacts.forEach { contact in
//            for number in contact.phoneNumbers {
//                let phoneNumber = number.value
//                print("number is = \(phoneNumber)")
//                
//                let phoneNo = phoneNumber.stringValue
//                
//                let formattedString = phoneNo.replacingOccurrences(of: " ", with: "")
//                
//                let removeunderscore = formattedString.replacingOccurrences(of: "-", with: "")
//                let removebraces = removeunderscore.replacingOccurrences(of: "(", with: "")
//                
//                let finalNo = removebraces.replacingOccurrences(of: ")", with: "")
//                
//                let last10 = finalNo.substring(from:finalNo.index(finalNo.endIndex, offsetBy: -10))
//                
//                mobileNumField.text = last10
//                
//                
//            }
//            
//            let cnContacts = [CNContact]()
//            
//            for contact in cnContacts {
//                let fullName = CNContactFormatter.string(from: contact, style: .fullName) ?? "No Name"
//                print("\(fullName): \(contact.phoneNumbers.description)")
//            }
//        }
//    }

}
