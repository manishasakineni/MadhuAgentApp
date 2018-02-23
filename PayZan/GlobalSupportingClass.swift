//
//  GlobalSupportingClass.swift
//  Mag-nificent
//
//  Created by Soniya on 6/4/15.
//  Copyright (c) 2015 Eaurac. All rights reserved.
//

import UIKit

class GlobalSupportingClass {
    
    static let dateFormatStandard:String = "yyyy-MM-dd HH:mm:ss"
    static let dateFormatInputField:String = "MM/dd/yyyy hh:mm a"
    
    //2017-10-30T04:37:57.006Z
    
    var autTokenn = UserDefaults.standard.string(forKey: "accessToken")
    var authTokenType = UserDefaults.standard.string(forKey: "tokenType")
    
    
    // MARK: - Error Messages
    class func AmountErrorMessage() -> String {
        return "app.Can'tAddmorethanRs5000".localize()
    }
    class func blankCvvErrorMessage() -> String {
        return "app.PleaseProvideYourCvvNumber".localize()
    }
    class func blankMonthErrorMessage() -> String {
        return "app.PleaseSelectYourMonth".localize()
    }
    class func blankYearErrorMessage() -> String {
        return "app.PleaseSelectYourYear".localize()
    }
    class func blankCardNumberErrorMessage() -> String {
        return "app.PleaseProvideYourCardNumber".localize()
    }
    class func blankCardHolderErrorMessage() -> String {
        return "app.PleaseProvideYourCardHolderName".localize()
    }
    class func blankCardLaelErrorMessage() -> String {
        return "app.PleaseProvideYourCardLabel".localize()
    }
    
    class func blankDataCardNumberErrorMessage() -> String {
        return "app.PleaseProvideYourDataCardNumber".localize()
    }
    class func blankConsumerNumberErrorMessage() -> String {
        return "app.PleaseProvideYourConsumerNumber".localize()
    }
    class func blankBoardErrorMessage() -> String {
        return "app.PleaseSelectBoard".localize()
    }
    class func blankAccountNumberErrorMessage() -> String {
        return "app.PleaseProvideYourAccountNumber".localize()
    }
    class func blankSubscriberErrorMessage() -> String {
        return "app.PleaseProvideYourSubscriberId".localize()
    }
    class func blankServiceNumberErrorMessage() -> String {
        return "app.PleaseProvideYourServiceNumber".localize()
    }
    class func blankOperatorErrorMessage() -> String {
        return "app.PleaseSelectYourOperator".localize()
    }
    class func blankCircleErrorMessage() -> String {
        return "app.PleaseSelectYourCircle".localize()
    }
    class func blankStdNumberErrorMessage() -> String {
        return "app.PleaseprovideyourNumberWithStdCode".localize()
    }
    class func blankNetworkErrorMessage() -> String {
        return "app.PleaseSelectYourNetwork".localize()
    }
    class func blankAmountErrorMessage() -> String {
        return "app.PleaseprovideyourAmount".localize()
    }
    class func blankProvinceErrorMessage() -> String {
        return "app.Pleaseprovideyourprovince".localize()
    }
    class func blankDOBirthErrorMessage() -> String {
        return "app.PleaseSelectYourDateOfBirth".localize()
    }
    class func blankTitleErrorMessage() -> String {
        return "app.Pleaseselectyourtitle".localize()
    }
    class func blankDistrictErrorMessage() -> String {
        return "app.Pleaseprovideyourdistrict".localize()
    }
    class func blankMandalErrorMessage() -> String {
        return "app.Pleaseprovideyourmandal".localize()
    }
    class func blankVillageErrorMessage() -> String {
        return "app.Pleaseprovideyourvillage".localize()
    }
    class func blankAddress1ErrorMessage() -> String {
        return "app.Pleaseprovideyouraddress1".localize()
    }
    class func blankAddress2ErrorMessage() -> String {
        return "app.Pleaseprovideyouraddress2".localize()
    }
    
    class func blankLandmarkErrorMessage() -> String {
        return "app.Pleaseprovideyourlandmark".localize()
    }
    class func blankCommentsErrorMessage() -> String {
        return "app.Pleaseprovideyourcomments".localize()
    }
    
    class func invalidEmaildIDFormatErrorMessage() -> String {
        return "app.Pleaseprovidevalidemailid".localize()
    }
    class func blankEmailIDErrorMessage() -> String {
        return "app.Pleaseprovideemailid".localize()
    }
    class func blankPasswordErrorMessage() -> String {
        return "app.Pleaseprovidepassword".localize()
    }
    class func blankSendAmountErrorMessage() -> String {
        return "app.Pleaseenterwalletamount".localize()
    }
    
    class func invalidDigitsInPasswordErrorMessage() -> String {
        return "app.Passwordshouldbeofminimum8character".localize()
    }
    class func invalidPasswordErrorMessage() -> String {
        return "app.PleaseEnterValidPassword".localize()
    }
    
    class func max40DigitsInPasswordErrorMessage() -> String {
        return "app.Passwordshouldbeofmaximum40character".localize()
    }
    class func blankFnameErrorMessage() -> String {
        return "app.Pleaseprovideyourfirstname".localize()
    }
    class func firstNamebitweenMessage() -> String {
        return "app.firstNameMustbebetween4to30Characters".localize()
    }
    class func blankNameErrorMessage() -> String {
        return "app.PleaseprovideyourName".localize()
    }
    class func blankLnameErrorMessage() -> String {
        return "app.Pleaseprovideyourlastname".localize()
    }
    class func blankPhoneNumberErrorMessage() -> String {
        return "app.Pleaseprovideyourmobilenumber".localize()
    }
    class func invalidPhoneNumberErrorMessage() -> String {
        return "app.Pleaseprovide10digitsmobilenumber".localize()
    }
    
    class func valiedPhoneNumberErrorMessage() -> String {
        return "app.Pleaseprovidevaliedmobilenumber".localize()
    }
    
    
    class func blankConfirmPasswordErrorMessage() -> String {
        
        return "app.Pleaseconfirmpassword".localize()
    }
    class func changePasswordErrorMessage() -> String {
        return "app.Pleaseprovideyourcurrentpassword".localize()
    }
    class func newPasswordErrorMessage() -> String {
        return "app.Pleaseprovideyournewpassword".localize()
    }
    class func reTypeNewnewPasswordErrorMessage() -> String {
        return "app.PleaseprovideyourreTypeNewpassword".localize()
    }

    
    class func passwordMissMatchErrorMessage() -> String {
        return "app.PasswordmustmatchwithCreatePassword".localize()
    }
    class func blankDOBErrorMessage() -> String {
        return "app.Pleaseprovideyourdateofbirth".localize()
    }
    class func networkErrorMessage() -> String {
        return "app.NetworkiseitherslowornotConnected".localize()
    }
    class func invalidLoginErrorMessage() -> String {
        return "app.Invalidusernameorpassword".localize()
    }
    class func someErrorOccuredErrorMessage() -> String {
        return "app.SomeErrorOccured".localize()
    }
    class func successfullyDoneMessage() -> String {
        return "app.SuccessfullyDone".localize()
    }
    
    class func pinvalidationMessage() -> String {
        return "app.PleaseEnterValidPin".localize()
    }
    class func cloudvalidationMessage() -> String {
        return "app.PleaseEnterValidInformation".localize()
    }
    class func specialCharacterMessage() -> String {
        return "app.Passwordsmusthaveatleastonenonalphanumericcharacter".localize()
    }
    class func capitalLetterMessage() -> String {
        return "app.Passwordsmusthaveatleastoneuppercase".localize()
    }
    class func numberMessage() -> String {
        return "app.Passwordsmusthaveatleastonedigit".localize()
    }
    class func miniCharEmailIDErrorMessage() -> String {
        return "app.Emailshouldbeofminimum5character".localize()
    }
    class func phoneValidateMessage() -> String {
        return "app.Mobilenumbershouldstartwith".localize()
    }
    class func invalidLoginMessage() -> String {
        
        return "app.InvalidUsernameorPassword".localize()
    }
    
   
    
    // MARK: - Phone Number Valdation
    
   class func phoneValidate(value: String) -> Bool {
        let PHONE_REGEX = "^((\\+)|(00))[0-9]{6,14}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: value)
        return result
    }
    
    // MARK: - Capital
    
    class func capitalOnly(password: String) -> Bool {
        let capitalLetterRegEx  = ".*[A-Z]+.*"
        let texttest = NSPredicate(format:"SELF MATCHES %@", capitalLetterRegEx)
        guard texttest.evaluate(with: password) else { return false }
        
        return true
    }
    
    // MARK: - Number Only
    
    class func numberOnly(password: String) -> Bool {
        
        let numberRegEx  = ".*[0-9]+.*"
        let texttest1 = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        guard texttest1.evaluate(with: password) else { return false }
        
        return true
    }
    
    // MARK: - Special Char Only
    
    class func specialCharOnly(password: String) -> Bool {
        
        let specialCharacterRegEx  = ".*[!&^%$#@()/_*+-]+.*"
        let texttest2 = NSPredicate(format:"SELF MATCHES %@", specialCharacterRegEx)
        guard texttest2.evaluate(with: password) else { return false }
        
        return true
    }
    
    
    
    // MARK: - Validate
    
    class func isValidEmail(_ emailID:NSString) -> Bool {
        // println("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: emailID)
    }
    
    class func isEmailValid(_ email: String) -> Bool {
        let emailRegEx = "(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"+"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"+"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"+"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"+"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"+"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"+"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        
        let emailTest = NSPredicate(format:"SELF MATCHES[c] %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    //MARK : - Special character checking in string
    
    class func isHavingSpecialCharacter(_ string:NSString) -> Bool {
        
        let set:CharacterSet = CharacterSet(charactersIn:"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890").inverted
        if string.rangeOfCharacter(from: set).location == NSNotFound    {
            //No special character exists
            return false
        }
        //special character exists
        return true
    }
    
    class func isOnlyNumbers(_ string:NSString) -> Bool {
        
        let set:CharacterSet = CharacterSet(charactersIn:"1234567890").inverted
        if string.rangeOfCharacter(from: set).location == NSNotFound    {
            //No special character exists
            return false
        }
        //special character exists
        return true
    }
    
    //MARK : - Navigation
    class func imageLayerForNavigationGradientBackground(_ frame :CGRect) -> UIImage {
        
        var updatedFrame = frame
        // take into account the status bar
        updatedFrame.size.height += 20
        let layer = CAGradientLayer()
        layer.startPoint = CGPoint(x: 0.0, y: 0.5);
        layer.endPoint = CGPoint(x: 1.0, y: 0.5);
        layer.frame = updatedFrame
        layer.colors = [UIColor(red: 110/255.0, green: 150/255.0, blue: 150/255.0, alpha: 1.0).cgColor, UIColor(red: 140/255.0, green: 185/255.0, blue: 150/255.0, alpha: 1.0).cgColor]
        UIGraphicsBeginImageContext(layer.bounds.size)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    //MARK: - Date Methods
    
    static  func getDateFromFormat(_ currFormat:String,ToFormat toFormat:String, WithDate strDate:String) ->String
    {
        var resultString:String
        let dateFormatter:DateFormatter  =  DateFormatter()
        dateFormatter.dateFormat = currFormat
        let yourDate = dateFormatter.date(from: strDate)
        if yourDate != nil{
            dateFormatter.dateFormat = toFormat
            resultString = dateFormatter.string(from: yourDate!)
        }
        else{
            resultString = strDate
        }
        
        return resultString
    }
    
    static  func getCurrentDate() -> String
    {
        // Set up an NSDateFormatter for UTC time zone
        let formatterUtc:DateFormatter  =  DateFormatter()
        formatterUtc.dateFormat = GlobalSupportingClass.dateFormatStandard
        formatterUtc.timeZone = TimeZone(secondsFromGMT: 0)
        
        
        // Cast the input string to NSDate
        let utcDate:Date = Date()
       // print("utc: \(utcDate)", terminator: "")
        let strUTC:String = formatterUtc.string(from: utcDate)
      //  print("strutc: \(strUTC)")
        
        return strUTC;
    }
    
    class func dateStandardFormat() -> String {
        return dateFormatStandard
    }
    class func date120Format() -> String {
        return dateFormatInputField
    }
    
    static  func getEpochDateFromFormat(_ currFormat:String, WithDate strDate:String) ->String
    {
        var resultString:String
        let dateFormatter:DateFormatter  =  DateFormatter()
        dateFormatter.dateFormat = currFormat
        let yourDate = dateFormatter.date(from: strDate)
        if yourDate != nil{
            let epochTimeInterval:TimeInterval = floor(yourDate!.timeIntervalSince1970)
            resultString = NSString(format:"%d",epochTimeInterval) as String
        }
        else{
            resultString = strDate
        }
        
        return resultString
    }
    
//    class func saveAccessToken(_ accessToken: String) {
//        
//        if let accessTokenData = accessToken.data(using: String.Encoding.utf8) {
//            
//            let encryptedAccessToken = RNCryptor.encrypt(data: accessTokenData, withPassword: autTokenn)
//            UserDefaults.standard.setValue(encryptedAccessToken, forKey: autTokenn)
//            UserDefaults.standard.synchronize()
//        }
//    }
//    
//    class func getAccessToken() -> String {
//        
//        if let accessTokenData = UserDefaults.standard.value(forKey: autTokenn) as? Data {
//            
//            do {
//                
//                let decryptedAccessToken = try RNCryptor.decrypt(data: accessTokenData, withPassword: autTokenn)
//                
//                if let accessToken = String.init(data: decryptedAccessToken, encoding: String.Encoding.utf8) {
//                    
//                    return accessToken
//                }
//                
//            } catch {
//                
//                fatalError("Error fetching password items - \(error)")
//            }
//        }
//        
//        return ""
//    }
//    
//    class func saveTokenType(_ tokenType: String) {
//        
//        UserDefaults.standard.setValue(tokenType, forKey: autTokenn)
//        UserDefaults.standard.synchronize()
//    }
//    
//    class func getTokenType() -> String {
//        
//        let tokenType = UserDefaults.standard.value(forKey: autTokenn) as? String
//        
//        if tokenType == nil {
//            
//            return ""
//            
//        } else {
//            
//            return tokenType!
//        }
//    }
    
//    //MARK: - Alert
//    
//    static func showAlertViewWithTitle(title:String,message:String,buttonTitle:String)
//    {
//        let alertView:UIAlertView = UIAlertView();
//        alertView.title=title
//        alertView.message=message
//        alertView.addButtonWithTitle(buttonTitle)
//        alertView.show()
//    }
//    
//    static func showAlertViewWithTitleAndButtons(title:String,message:String,arrButtons:
//        
//        NSArray,delegate:AnyObject)
//    {
//        let alertView:UIAlertView = UIAlertView();
//        alertView.title=title
//        alertView.message=message
//        alertView.delegate=delegate
//        for  buttonTitle in arrButtons
//        {
//            alertView.addButtonWithTitle(buttonTitle as! String)
//        }
//        alertView.show()
//    }
    
}



