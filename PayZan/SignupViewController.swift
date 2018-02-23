//
//  SignupViewController.swift
//  PayZan
//
//  Created by CalibrageMac02 on 05/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit

import FBSDKLoginKit
import Google
import GoogleSignIn
import AMPFloatingTextField
import IQKeyboardManagerSwift

class SignupViewController: BaseViewController,UITextFieldDelegate,UITabBarControllerDelegate,UITabBarDelegate {
    
    //MARK:- OutLets

    @IBOutlet weak var mobileNumField: AMPFloatingTextField!
    
    @IBOutlet weak var emailField: AMPFloatingTextField!
    
    @IBOutlet weak var paswdField: AMPFloatingTextField!
    
    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak var eyeBtn: UIButton!
    
    @IBOutlet weak var signupBtn: UIButton!
    
    @IBOutlet weak var cnfrmpswdeyeOutLet: UIButton!
    
    
    @IBOutlet weak var facebookBtn: UIButton!
    
    @IBOutlet weak var googleBtn: UIButton!
    
    @IBOutlet weak var confirmPasswordField: AMPFloatingTextField!
    
    @IBOutlet weak var headerImgHeight: NSLayoutConstraint!
    
    @IBOutlet weak var headerViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var mobileFieldHeight: NSLayoutConstraint!
    
    @IBOutlet weak var emailFiledHeight: NSLayoutConstraint!
    
    @IBOutlet weak var passwordFieldHeight: NSLayoutConstraint!
    
    @IBOutlet weak var confirmFieldHeight: NSLayoutConstraint!
    
    @IBOutlet weak var termsViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var signUpBtnHeight: NSLayoutConstraint!
    
    @IBOutlet weak var loginViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var orLabelHeight: NSLayoutConstraint!
    
    @IBOutlet weak var facebookBtnHeight: NSLayoutConstraint!
    
    @IBOutlet weak var googleBtnHeight: NSLayoutConstraint!
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var backLabel: UILabel!
    
    
    
    

    let serviceController = ServiceController()

    
      var dict : [String : AnyObject]!
    
    var PwButton = UIButton(type: .custom)
    var confirmPwButton = UIButton(type: .custom)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mobileNumField.maxLengthTextField = 10
        paswdField.maxLengthTextField = 40
        emailField.maxLengthTextField = 40
        confirmPasswordField.maxLengthTextField = 40
        
        eyeBtn.isHidden = true
        cnfrmpswdeyeOutLet.isHidden = true
        
        placeHolderCode()
        
       

        //MARK:- TextField Colors

//        mobileNumField.layer.borderWidth = 0.5
//        mobileNumField.layer.borderColor = UIColor.lightGray.cgColor
//        mobileNumField.layer.cornerRadius = 3
//        mobileNumField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
//        
//        paswdField.layer.borderWidth = 0.5
//        paswdField.layer.borderColor = UIColor.lightGray.cgColor
//        paswdField.layer.cornerRadius = 3
//        paswdField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
//        
//        emailField.layer.borderWidth = 0.5
//        emailField.layer.borderColor = UIColor.lightGray.cgColor
//        emailField.layer.cornerRadius = 3
//        emailField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
//        
//        confirmPasswordField.layer.borderWidth = 0.5
//        confirmPasswordField.layer.borderColor = UIColor.lightGray.cgColor
//        confirmPasswordField.layer.cornerRadius = 3
//        confirmPasswordField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        
        PwButton.setImage(UIImage(named: "eye2"), for: .normal)
        PwButton.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0)
//        PwButton.frame = CGRect(x: CGFloat(paswdField.frame.size.width - 15), y: CGFloat(5), width: CGFloat(17), height: CGFloat(17))
        PwButton.frame = CGRect(x: 30, y: 0, width: PwButton.frame.size.width - 50, height: 20)
        PwButton.tintColor = #colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1)
        PwButton.addTarget(self, action: #selector(self.currentPwBtnAction), for: .touchUpInside)
//        PwButton.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        paswdField.rightView = PwButton
        paswdField.rightViewMode = .always
        
        confirmPwButton.setImage(UIImage(named: "eye2"), for: .normal)
        confirmPwButton.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0)
        confirmPwButton.frame = CGRect(x: 30, y: 0, width: confirmPwButton.frame.size.width - 50, height: 20)
        confirmPwButton.tintColor = #colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1)
        confirmPwButton.addTarget(self, action: #selector(self.confirmPwBtnAction), for: .touchUpInside)
//        confirmPwButton.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        confirmPasswordField.rightView = confirmPwButton
        confirmPasswordField.rightViewMode = .always
        
        mobileNumField.setLeftPaddingPoints(4)
        paswdField.setLeftPaddingPoints(4)
        emailField.setLeftPaddingPoints(4)
        confirmPasswordField.setLeftPaddingPoints(4)
        
        
        mobileNumField.delegate = self
        
        emailField.delegate = self
        paswdField.delegate = self
        
        confirmPasswordField.delegate = self
        
        self.tabBarController?.delegate = self
        
        
        mobileNumField.keyboardType = .phonePad
        emailField.keyboardType = .emailAddress
        paswdField.keyboardType = .default
        confirmPasswordField.keyboardType = .default
        
    
        
        
        facebookBtn.layer.cornerRadius = 3
        googleBtn.layer.cornerRadius = 3
        
        //MARK:- headerImgHeight For iphone and ipad


        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
            headerImgHeight.constant = 150
            
            mobileFieldHeight.constant = 90
            
//            mobileNumField.updateBorder()
            emailFiledHeight.constant = 90
            passwordFieldHeight.constant = 90
            confirmFieldHeight.constant = 90
            
            signUpBtnHeight.constant = 50
            
            headerViewHeight.constant = 50
            
            termsViewHeight.constant = 30
            loginViewHeight.constant = 30
            
            facebookBtnHeight.constant = 40
            googleBtnHeight.constant = 40
            
            mobileNumField.font = UIFont.systemFont(ofSize: 20)
            mobileNumField.placeholderFont = UIFont.systemFont(ofSize: 20)
            mobileNumField.titleFont = UIFont.systemFont(ofSize: 20)
            mobileNumField.errorLabel.font = UIFont.systemFont(ofSize: 14)
            
            emailField.font = UIFont.systemFont(ofSize: 20)
            emailField.placeholderFont = UIFont.systemFont(ofSize: 20)
            emailField.titleFont = UIFont.systemFont(ofSize: 20)
            emailField.errorLabel.font = UIFont.systemFont(ofSize: 14)
            
            paswdField.font = UIFont.systemFont(ofSize: 20)
            paswdField.placeholderFont = UIFont.systemFont(ofSize: 20)
            paswdField.titleFont = UIFont.systemFont(ofSize: 20)
            paswdField.errorLabel.font = UIFont.systemFont(ofSize: 14)
            
            confirmPasswordField.font = UIFont.systemFont(ofSize: 20)
            confirmPasswordField.placeholderFont = UIFont.systemFont(ofSize: 20)
            confirmPasswordField.titleFont = UIFont.systemFont(ofSize: 20)
            confirmPasswordField.errorLabel.font = UIFont.systemFont(ofSize: 14)
            
            backLabel.font = UIFont.systemFont(ofSize: 16)
        }
        else {
            
            headerImgHeight.constant = 79
            
            backLabel.font = UIFont.systemFont(ofSize: 12)
            
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.isHidden = true
    }
    
    @IBAction func currentPwBtnAction(_ sender: Any) {
        
        if PwButton.tag == 0
        {
            paswdField.isSecureTextEntry = false
            PwButton.setImage(UIImage(named: "Eye"), for: .normal)
            PwButton.contentMode = .scaleAspectFit
            PwButton.tag = 1
        }
            
        else
            
        {
            paswdField.isSecureTextEntry = true
            PwButton.setImage(UIImage(named: "eye2"), for: .normal)
            PwButton.contentMode = .scaleAspectFit
            PwButton.tag = 0
            
            
        }
    }
    @IBAction func confirmPwBtnAction(_ sender: Any) {
        
        if confirmPwButton.tag == 0
        {
            confirmPasswordField.isSecureTextEntry = false
            confirmPwButton.setImage(UIImage(named: "Eye"), for: .normal)
            confirmPwButton.contentMode = .scaleAspectFit
            confirmPwButton.tag = 1
        }
            
        else
            
        {
            confirmPasswordField.isSecureTextEntry = true
            confirmPwButton.setImage(UIImage(named: "eye2"), for: .normal)
            confirmPwButton.contentMode = .scaleAspectFit
            confirmPwButton.tag = 0
            
            
        }
    }

    
    func placeHolderCode(){
        
        
        mobileNumField.placeholder = "app.MobileNumber".localize()
        mobileNumField.selectedTitle = "app.MobileNumber".localize()
        mobileNumField.title = "app.MobileNumber".localize()

        
        emailField.placeholder = "app.Email".localize()
        emailField.selectedTitle = "app.Email".localize()
        emailField.title = "app.Email".localize()
        
        
        paswdField.placeholder = "app.CreateaPassword".localize()
        paswdField.selectedTitle = "app.CreateaPassword".localize()
        paswdField.title = "app.CreateaPassword".localize()
        

        
        confirmPasswordField.placeholder = "app.ConfirmPassword".localize()
        confirmPasswordField.selectedTitle = "app.ConfirmPassword".localize()
        confirmPasswordField.title = "app.ConfirmPassword".localize()
        

        
        applySkyscannerTheme(textField: mobileNumField)
        applySkyscannerTheme(textField: emailField)
        applySkyscannerTheme(textField: paswdField)
        applySkyscannerTheme(textField: confirmPasswordField)
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
        //        textField.titleLabel.font = UIFont.systemFont(ofSize: 12)
        //        textField.placeholderFont = UIFont.systemFont(ofSize: 18)
        //        textField.font = UIFont.systemFont(ofSize: 18)
        //        textField.isImmediateValidation = true
    }

    
    // Touch and TextFieldShouldReturn Functions
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //MARK:- textFieldShouldReturn

    func textFieldDidEndEditing(_ textField: UITextField) {
        
//        self.view.layoutIfNeeded()
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        //        self.view.endEditing(true)
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        
        
        if textField == emailField {
            
            if !string.canBeConverted(to: String.Encoding.ascii){
                return false
            }
            
        }
        if textField == paswdField {
            
            if !string.canBeConverted(to: String.Encoding.ascii){
                return false
            }
            
        }
        if textField == confirmPasswordField {
            
            if !string.canBeConverted(to: String.Encoding.ascii){
                return false
            }
            
        }
        
        if(textField==self.emailField&&range.location==0)
        {
            if (string.hasPrefix("."))
            {
                return false
            }
            
            if !string.canBeConverted(to: String.Encoding.ascii){
                return false
            }
            
        }
        
        if textField == mobileNumField // your text filed name
        {
            var result = true
            let prospectiveText = (textField.text! as NSString).replacingCharacters(in: range, with: string)
            
            if string.characters.count > 0
            {
                let disallowedCharacterSet = NSCharacterSet(charactersIn:"0123456789").inverted
                let replacementStringIsLegal = string.rangeOfCharacter(from: disallowedCharacterSet) == nil
                 let currentCharacterCount = textField.text?.characters.count ?? 0
                let newLength = currentCharacterCount + string.characters.count - range.length
                
                let resultingStringLengthIsLegal = prospectiveText.characters.count > 0
                
                let scanner = Scanner(string: prospectiveText)
                let resultingTextIsNumeric = scanner.scanDecimal(nil) && scanner.isAtEnd
                
                result = replacementStringIsLegal && resultingStringLengthIsLegal && resultingTextIsNumeric && newLength <= 10
            }
            return result
        }
        else
        {
            
//            let nsString:NSString? = textField.text as NSString?
//            let updatedString = nsString?.replacingCharacters(in:range, with:string)
//            
//            textField.text = updatedString
            return true
        }
    }
    

    //MARK:- postSignUpService

    
    func postSignUpService(){
        
        let null = NSNull()
        
        let mNumber:String = mobileNumField.text!
        let pword:String = paswdField.text!
        let email:String = emailField.text!
        
        print("email:\(email)")
        
        let  strUrl = registerUrl
        
        
        let dictParams = ["MobileNumber":mNumber,"Password":pword,"ConfirmPassword":pword,"Email":email,"RoleIds":null] as NSDictionary
        
        print("dic params \(dictParams)")
        //CleverTap.sharedInstance()?.onUserLogin(dictParams as! [AnyHashable : Any])
        let dictHeaders = ["":"","":""] as NSDictionary
        
        serviceController.requestPOSTURL(strURL: strUrl as NSString, postParams: dictParams, postHeaders: dictHeaders, successHandler:{(result) in
            DispatchQueue.main.async()
                {
                    
                    let respVO:SignupVo = Mapper().map(JSONObject: result)!
                    
                    print("responseString = \(respVO)")
                    
                    let statusCode = respVO.IsSuccess
                    
                    print("StatusCode:\(String(describing: statusCode))")
                    
                    
                    if statusCode == true
                    {
                        
//                        let endUserMsg = respVO.EndUserMessage
                        
                        let alertController = UIAlertController(title: "app.Alert".localize(), message: "app.userregistersuccessfully".localize(), preferredStyle: UIAlertControllerStyle.alert)
                        
                        let DestructiveAction = UIAlertAction(title: "app.Ok".localize(), style: UIAlertActionStyle.destructive) { (result : UIAlertAction) -> Void in
                            
                            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                            
                            let viewController = mainStoryboard.instantiateViewController(withIdentifier: "LoginNav") as! UINavigationController
                            //                    let navigationController = UINavigationController(rootViewController: viewController)
                            let appDelegate = UIApplication.shared.delegate as! AppDelegate
                            appDelegate.window?.rootViewController = viewController
                        }
                        alertController.addAction(DestructiveAction)
                        self.present(alertController, animated: true, completion: nil)
                        
                        
                    }
                    else if statusCode == false{
                        
                        let endUserMsg = respVO.EndUserMessage
                        
                        let alertController = UIAlertController(title: "app.Alert".localize(), message: endUserMsg , preferredStyle: UIAlertControllerStyle.alert)
                        
                        let DestructiveAction = UIAlertAction(title: "app.Ok".localize(), style: UIAlertActionStyle.destructive) { (result : UIAlertAction) -> Void in
                        }
                        alertController.addAction(DestructiveAction)
                        self.present(alertController, animated: true, completion: nil)
                        
                        
                    }
                    else
                    {
                        
                        
                        let alertController = UIAlertController(title: "Error", message: "Network Error" , preferredStyle: UIAlertControllerStyle.alert)
                        
                        let DestructiveAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.destructive) { (result : UIAlertAction) -> Void in
                        }
                        alertController.addAction(DestructiveAction)
                        self.present(alertController, animated: true, completion: nil)
                        
                    }
            }
        }, failureHandler: {(error) in
            
            print("error")
            
            
            if(error == "unAuthorized"){
                self.serviceController.refreshTokenForLogin(successHandler:{(result) in
                    DispatchQueue.main.async()
                        {
                            
                            self.postSignUpService()
                            
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
    //MARK:- validateAllFields

    
    func validateAllFields() -> Bool
    {
        mobileNumField.text=mobileNumField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
        emailField.text=emailField.text!.trimmingCharacters(in: CharacterSet.whitespaces)

        paswdField.text=paswdField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
        
        confirmPasswordField.text=confirmPasswordField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
        
        let mnumb:NSString = mobileNumField.text! as NSString
        
        let emailId:NSString = emailField.text! as NSString
        let pasword:NSString = paswdField.text! as NSString
        let confirmPassword:NSString = confirmPasswordField.text! as NSString
        
        
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

        else if (emailId.length<=0) {
            errorMessage=GlobalSupportingClass.blankEmailIDErrorMessage() as String as String as NSString?
        }
        else if (emailId.length<=4) {
            errorMessage=GlobalSupportingClass.miniCharEmailIDErrorMessage() as String as String as NSString?
        }
        else if(!GlobalSupportingClass.isEmailValid((emailId as NSString) as String))
        {
            errorMessage=GlobalSupportingClass.invalidEmaildIDFormatErrorMessage() as String as String as NSString?
        }
            
        else if (pasword.length<=0) {
            errorMessage=GlobalSupportingClass.blankPasswordErrorMessage() as String as String as NSString?
        }
        else if(!GlobalSupportingClass.capitalOnly(password: pasword as String)) {
            
            errorMessage=GlobalSupportingClass.capitalLetterMessage() as String as String as NSString?
        }
        else if(!GlobalSupportingClass.numberOnly(password: pasword as String)) {
            
            errorMessage=GlobalSupportingClass.numberMessage() as String as String as NSString?
        }
        else if(!GlobalSupportingClass.specialCharOnly(password: pasword as String)) {
            
            errorMessage=GlobalSupportingClass.specialCharacterMessage() as String as String as NSString?
        }
        else if(pasword.length<8)
        {
            errorMessage = GlobalSupportingClass.invalidDigitsInPasswordErrorMessage() as String as String as NSString?
        }
        else if(confirmPassword.length<=0){
            errorMessage=GlobalSupportingClass.blankConfirmPasswordErrorMessage() as String as String as NSString?
        }
            
        else if(!pasword.isEqual(to: confirmPassword as String)){
            errorMessage=GlobalSupportingClass.passwordMissMatchErrorMessage() as String as String as NSString?
        }
        
        if let errorMsg = errorMessage{
            
            if (mnumb.length<=0) {
                
                mobileNumField.errorMessage = errorMsg as String
                mobileNumField.errorLabel.textColor = .red
            }
            else if (mnumb.length<=9) {
                
                mobileNumField.errorMessage = errorMsg as String
                mobileNumField.errorLabel.textColor = .red
            }
            else if (mobileNumField.text == "0000000000") {
                
                 mobileNumField.errorMessage = errorMsg as String
                mobileNumField.errorLabel.textColor = .red
            }
            else if (emailId.length<=0) {
                
                emailField.errorMessage = errorMsg as String
                emailField.errorLabel.textColor = .red
            }
            
            else if (emailId.length<=3) {
                
                emailField.errorMessage = errorMsg as String
                emailField.errorLabel.textColor = .red
            }

            else if(!GlobalSupportingClass.isEmailValid((emailId as NSString) as String))
            {
                emailField.errorMessage = errorMsg as String
                emailField.errorLabel.textColor = .red
            }
            else if (pasword.length<=0) {
                
                paswdField.errorMessage = errorMsg as String
                paswdField.errorLabel.textColor = .red
            }
            
            else if(!GlobalSupportingClass.capitalOnly(password: pasword as String)) {
                
                paswdField.errorMessage = errorMsg as String
                paswdField.errorLabel.textColor = .red
            }
            else if(!GlobalSupportingClass.numberOnly(password: pasword as String)) {
                
                paswdField.errorMessage = errorMsg as String
                paswdField.errorLabel.textColor = .red
            }
            else if(!GlobalSupportingClass.specialCharOnly(password: pasword as String)) {
                
               paswdField.errorMessage = errorMsg as String
                paswdField.errorLabel.textColor = .red
            }
            else if(pasword.length<8)
            {
                paswdField.errorMessage = errorMsg as String
                paswdField.errorLabel.textColor = .red
            }
            else if (confirmPassword.length<=0) {
                
                confirmPasswordField.errorMessage = errorMsg as String
                confirmPasswordField.errorLabel.textColor = .red
            }
            else if(!pasword.isEqual(to: confirmPassword as String)){
                
                confirmPasswordField.errorMessage = errorMsg as String
                 confirmPasswordField.errorLabel.textColor = .red
            }
           
            
            
            return false
        
        
//        if let errorMsg = errorMessage{
//            
//            self.showAlertViewWithTitle("app.Alert".localize(), message: errorMsg as String, buttonTitle: "app.Retry".localize())
//            return false;
        }
        
        
        
        return true
    }
    
    

    //MARK:- BUtoons Actions

       @IBAction func signUpAction(_ sender: Any) {
        
        
        if self.validateAllFields()
        {
            if(appDelegate.checkInternetConnectivity()){
                
                postSignUpService()
            }
            else {
                
                self.appDelegate.window?.makeToast(kNetworkStatusMessage, duration:kToastDuration, position:CSToastPositionCenter)
                return
                
            }
            
        }
        
        
    }

    @IBAction func loginAction(_ sender: Any) {
        
//        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        appDelegate.window?.rootViewController = viewController
        
//        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        
//        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "LoginNav") as! UINavigationController
//        //                    let navigationController = UINavigationController(rootViewController: viewController)
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        appDelegate.window?.rootViewController = viewController
        
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        self.present(viewController, animated: true, completion: nil)
        
//        self.navigationController?.pushViewController(viewController, animated: true)
        
//        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func facebookAction(_ sender: Any) {
        
//        MBProgressHUD.showAdded(to:appDelegate.window,animated:true)
//        
//        MBProgressHUD.hide(for:appDelegate.window,animated:true)
//        
//        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
//        fbLoginManager.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
//            if (error == nil){
//                let fbloginresult : FBSDKLoginManagerLoginResult = result!
//                if fbloginresult.grantedPermissions != nil {
//                    if(fbloginresult.grantedPermissions.contains("email"))
//                    {
//                        UserDefaults.standard.setValue("true", forKey: kIsFirstTime)
//                        UserDefaults.standard.synchronize()
//                        
//                        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//                        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "TabsViewController") as! UITabBarController
//                        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//                        appDelegate.window?.rootViewController = viewController
//                        
//                        self.getFBUserData()
//                        
//                        //                        fbLoginManager.logOut()
//                    }
//                    
//                }
//            }
//        }
        
    }
    
    //MARK:- getFBUserData

    
    func getFBUserData(){
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                
                if (error == nil){
                    self.dict = result as! [String : AnyObject]
                    print(result!)
                    
                    print(self.dict)
                    
                    let json = result as! [String : Any]
                    
                    if json["first_name"] != nil {
                        
                        let name = json["first_name"]
                        
                        print("name:\(String(describing: name))")
                    }
                    
                    
                }
            })
        }
        

        
    }
    
    //MARK:- Button Actions

    
    @IBAction func googleAction(_ sender: Any) {
        
        
    }
    
    @IBAction func backAction(_ sender: Any) {
        
        if((self.presentingViewController) != nil){
            
            dismiss(animated: true, completion: nil)
            
        }
        else{
            
            self.navigationController?.popViewController(animated: true)
        }
        
        
        //let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        //let viewController = mainStoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        //let appDelegate = UIApplication.shared.delegate as! AppDelegate
        //appDelegate.window?.rootViewController = viewController
    }
    
    @IBAction func eyeAction(_ sender: Any) {
        
        if eyeBtn.tag == 0
        {
            paswdField.isSecureTextEntry = false
            eyeBtn.tag = 1
        }
            
        else
            
        {
            paswdField.isSecureTextEntry = true
            eyeBtn.tag = 0
            
            
        }
    }
    
    
    @IBAction func eyeBtnAction(_ sender: Any) {
        
        if cnfrmpswdeyeOutLet.tag == 0
        {
            confirmPasswordField.isSecureTextEntry = false
            cnfrmpswdeyeOutLet.tag = 1
        }
            
        else
            
        {
            confirmPasswordField.isSecureTextEntry = true
            cnfrmpswdeyeOutLet.tag = 0
            
            
        }

    }
    
    //MARK:- isValidEmailAddress

    
    func isValidEmailAddress(emailAddressString: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
    
    //MARK:- displayAlertMessage

    
    func displayAlertMessage(messageToDisplay: String)
    {
        let alertController = UIAlertController(title: "Alert", message: messageToDisplay, preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
            
            // Code in this block will trigger when OK button tapped.
            print("Ok button tapped");
            
        }
        
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true, completion:nil)
    }
}

//MARK:- extension String

extension String {
    
        func isEqualToString(find: String) -> Bool {
            return String(format: self) == find
        }
    
    //To check text field or String is blank or not
    var isBlank: Bool {
        get {
            let trimmed = trimmingCharacters(in: CharacterSet.whitespaces)
            return trimmed.isEmpty
        }
    }
    
    //MARK:- Validate Email

    
    
    var isEmail: Bool {
        do {
            let regex = try NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}", options: .caseInsensitive)
            return regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.characters.count)) != nil
        } catch {
            return false
        }
    }
    
    var isAlphanumeric: Bool {
        return !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
    }
    
     //MARK:- validate Password
    
    var isValidPassword: Bool {
        do {
            let regex = try NSRegularExpression(pattern: "^[a-zA-Z_0-9\\-_,;.:#+*?=!§$%&/()@]+$", options: .caseInsensitive)
            if(regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.characters.count)) != nil){
                
                if(self.characters.count>=6 && self.characters.count<=20){
                    return true
                }else{
                    return false
                }
            }else{
                return false
            }
        } catch {
            return false
        }
    }
}
