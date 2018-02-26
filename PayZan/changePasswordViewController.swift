//
//  changePasswordViewController.swift
//  PayZan
//
//  Created by Manoj on 05/12/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit
import AMPFloatingTextField


class changePasswordViewController: BaseViewController,UITextFieldDelegate,UITabBarControllerDelegate {
    
    //MARK:- OutLets


    @IBOutlet weak var eyebtnOutLet: UIButton!
    
    @IBOutlet weak var currentPswdTF: AMPFloatingTextField!
    
    @IBOutlet weak var newpswdOutLet: AMPFloatingTextField!
    
    
    @IBOutlet weak var reTypeNewPswdOutLet: AMPFloatingTextField!
    
    @IBOutlet weak var newpswdeyebtnOutlet: UIButton!
    
    
    @IBOutlet weak var retypePswdOutLet: UIButton!
    
    
    @IBOutlet weak var headerImgHeight: NSLayoutConstraint!
    
    @IBOutlet weak var headerViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var oldPasswordFiledHeight: NSLayoutConstraint!
    
    @IBOutlet weak var newPasswordHeight: NSLayoutConstraint!
    
    @IBOutlet weak var confirmPasswordHeight: NSLayoutConstraint!
    
    @IBOutlet weak var changePwBtnHeight: NSLayoutConstraint!
    
    @IBOutlet weak var changePasswordBtn: UIButton!
    
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var backLabel: UILabel!
    
     var cPwButton = UIButton(type: .custom)
     var  nPwButton = UIButton(type: .custom)
     var  rPwButton = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eyebtnOutLet.isHidden = true
        newpswdeyebtnOutlet.isHidden = true
        retypePswdOutLet.isHidden = true
        
        placeHolderCode()
        
        
        cPwButton.setImage(UIImage(named: "eye2"), for: .normal)
 
        cPwButton.frame = CGRect(x: 30, y: 0, width: cPwButton.frame.size.width - 50, height: 20)
        cPwButton.tintColor = #colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1)
        cPwButton.contentMode = .scaleAspectFit
        cPwButton.addTarget(self, action: #selector(self.currentPwBtnAction), for: .touchUpInside)
        currentPswdTF.rightView = cPwButton
        currentPswdTF.rightViewMode = .always
        
        
        nPwButton.setImage(UIImage(named: "eye2"), for: .normal)
   
        nPwButton.frame = CGRect(x: 30, y: 0, width: nPwButton.frame.size.width - 50, height: 20)
        nPwButton.addTarget(self, action: #selector(self.newPwBtnAction), for: .touchUpInside)
        
        nPwButton.tintColor = #colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1)
        nPwButton.contentMode = .scaleAspectFit
        newpswdOutLet.rightView = nPwButton
        newpswdOutLet.rightViewMode = .always
        
        rPwButton.setImage(UIImage(named: "eye2"), for: .normal)
        rPwButton.frame = CGRect(x: 30, y: 0, width: rPwButton.frame.size.width - 50, height: 20)
        rPwButton.addTarget(self, action: #selector(self.reNewPwBtnAction), for: .touchUpInside)
        rPwButton.tintColor = #colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1)
        rPwButton.contentMode = .scaleAspectFit
        reTypeNewPswdOutLet.rightView = rPwButton
        reTypeNewPswdOutLet.rightViewMode = .always
        
        currentPswdTF.setLeftPaddingPoints(4)
        newpswdOutLet.setLeftPaddingPoints(4)
        reTypeNewPswdOutLet.setLeftPaddingPoints(4)
        

//        
        
        
        self.tabBarController?.delegate = self
        
        currentPswdTF.delegate = self
        newpswdOutLet.delegate = self
        reTypeNewPswdOutLet.delegate = self
        

        //MARK:- headerImgHeight For iphone and ipad

        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
            headerImgHeight.constant = 150
            
            changePwBtnHeight.constant = 60
            
            currentPswdTF.updateBorder()
            oldPasswordFiledHeight.constant = 90
            newPasswordHeight.constant = 90
            confirmPasswordHeight.constant = 90
            
            
            currentPswdTF.font = UIFont.systemFont(ofSize: 20)
            currentPswdTF.placeholderFont = UIFont.systemFont(ofSize: 20)
            currentPswdTF.titleFont = UIFont.systemFont(ofSize: 20)
            currentPswdTF.errorLabel.font = UIFont.systemFont(ofSize: 14)
            
            newpswdOutLet.font = UIFont.systemFont(ofSize: 20)
            newpswdOutLet.placeholderFont = UIFont.systemFont(ofSize: 20)
            newpswdOutLet.titleFont = UIFont.systemFont(ofSize: 20)
            newpswdOutLet.errorLabel.font = UIFont.systemFont(ofSize: 14)
            
            reTypeNewPswdOutLet.font = UIFont.systemFont(ofSize: 20)
            reTypeNewPswdOutLet.placeholderFont = UIFont.systemFont(ofSize: 20)
            reTypeNewPswdOutLet.titleFont = UIFont.systemFont(ofSize: 20)
            reTypeNewPswdOutLet.errorLabel.font = UIFont.systemFont(ofSize: 14)
            
            backLabel.font = UIFont.systemFont(ofSize: 16)
            
            changePasswordBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        }
        else {
            
            headerImgHeight.constant = 79
            
            backLabel.font = UIFont.systemFont(ofSize: 12)
            
            
            currentPswdTF.errorLabel.font = UIFont.systemFont(ofSize: 10)
            newpswdOutLet.errorLabel.font = UIFont.systemFont(ofSize: 10)
            reTypeNewPswdOutLet.errorLabel.font = UIFont.systemFont(ofSize: 10)
            

            
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
        
        if cPwButton.tag == 0
        {
            currentPswdTF.isSecureTextEntry = false
            cPwButton.setImage(UIImage(named: "Eye"), for: .normal)
            cPwButton.contentMode = .scaleAspectFit
            cPwButton.tag = 1
        }
            
        else
            
        {
            currentPswdTF.isSecureTextEntry = true
            cPwButton.setImage(UIImage(named: "eye2"), for: .normal)
            cPwButton.contentMode = .scaleAspectFit
            cPwButton.tag = 0
            
            
        }
    }
    
    @IBAction func newPwBtnAction(_ sender: Any) {
        
        if newpswdOutLet.tag == 0
        {
            newpswdOutLet.isSecureTextEntry = false
            nPwButton.setImage(UIImage(named: "Eye"), for: .normal)
            nPwButton.contentMode = .scaleAspectFit
            newpswdOutLet.tag = 1
        }
            
        else
            
        {
            newpswdOutLet.isSecureTextEntry = true
            nPwButton.setImage(UIImage(named: "eye2"), for: .normal)
            nPwButton.contentMode = .scaleAspectFit
            newpswdOutLet.tag = 0
            
            
        }
    }
    
    @IBAction func reNewPwBtnAction(_ sender: Any) {
        
        if rPwButton.tag == 0
        {
            reTypeNewPswdOutLet.isSecureTextEntry = false
            rPwButton.setImage(UIImage(named: "Eye"), for: .normal)
            rPwButton.contentMode = .scaleAspectFit
            rPwButton.tag = 1
        }
            
        else
            
        {
            reTypeNewPswdOutLet.isSecureTextEntry = true
            rPwButton.setImage(UIImage(named: "eye2"), for: .normal)
            rPwButton.contentMode = .scaleAspectFit
            rPwButton.tag = 0
            
            
        }
    }

    
    func placeHolderCode(){
        
        
        currentPswdTF.placeholder = "app.CurrentPassword".localize()
        currentPswdTF.selectedTitle = "app.CurrentPassword".localize()
        currentPswdTF.title = "app.CurrentPassword".localize()
        
//        currentPswdTF.rightViewMode = .always
        
        currentPswdTF.maxLengthTextField = 40

        
        newpswdOutLet.placeholder = "app.NewPassword".localize()
        newpswdOutLet.selectedTitle = "app.NewPassword".localize()
        newpswdOutLet.title = "app.NewPassword".localize()
        
        newpswdOutLet.maxLengthTextField = 40

        reTypeNewPswdOutLet.placeholder = "app.ReTypeNewPassword".localize()
        reTypeNewPswdOutLet.selectedTitle = "app.ReTypeNewPassword".localize()
        reTypeNewPswdOutLet.title = "app.ReTypeNewPassword".localize()
        
        reTypeNewPswdOutLet.maxLengthTextField = 40

        
        applySkyscannerTheme(textField: currentPswdTF)
        applySkyscannerTheme(textField: newpswdOutLet)
        applySkyscannerTheme(textField: reTypeNewPswdOutLet)
    }
    
    
    func applySkyscannerTheme(textField: AMPFloatingTextField) {
        
        textField.tintColor = .black
        
        textField.textColor = .black
        textField.errorLabel.textColor = .red
        textField.rightView?.isHidden = false
        textField.errorBackGroundColor = UIColor.lightGray.withAlphaComponent(0.1)
        textField.placeholderColor = UIColor.lightGray
        textField.lineColor = UIColor.white
        textField.selectedTitleColor = #colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1)
        
        
        
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        
        
        if textField == currentPswdTF {
            
            if !string.canBeConverted(to: String.Encoding.ascii){
                return false
            }
            
        }
        if textField == newpswdOutLet {
            
            if !string.canBeConverted(to: String.Encoding.ascii){
                return false
            }
            
        }
        if textField == reTypeNewPswdOutLet {
            
            if !string.canBeConverted(to: String.Encoding.ascii){
                return false
            }
            
        }
       
        return true
    }

    
    //MARK:- Button Action

    
    @IBAction func backAction(_ sender: Any) {
        
         self.navigationController?.popViewController(animated: true)
    }
    
    //MARK:- postLoginService

    
    func changePasswordService(){
        
        let  strUrl = changePasswordUrl
        
        let oldPassword:String = currentPswdTF.text!
        let newPswd:String = newpswdOutLet.text!
        let confirmPswd:String = reTypeNewPswdOutLet.text!
        
        let defaults = UserDefaults.standard
        
        let uname:String = defaults.string(forKey: uNamee)!
        
        
        let dictParams = [
            "UserName": uname,
            "OldPassword": oldPassword,
            "NewPassword": newPswd,
            "ConfirmPassword": confirmPswd
            ] as NSDictionary
        
        print("dic params \(dictParams)")
        
        let dictHeaders = ["":"","":""] as NSDictionary
        
        
        serviceController.requestPOSTURL(strURL: strUrl as NSString, postParams: dictParams, postHeaders: dictHeaders, successHandler:{(result) in
            DispatchQueue.main.async()
                {
                    
                    print("result:\(result)")
                    
                    let respVO:ChangePasswordVo = Mapper().map(JSONObject: result)!
                    
                    
                    print("responseString = \(respVO)")
                    
                    
                    let isSuccess = respVO.IsSuccess
                    
                    print("StatusCode:\(String(describing: isSuccess))")
                    
                    
                    if isSuccess == true
                    {
                        
                    let successmsg = respVO.EndUserMessage
                        
                    self.showAlertViewWithTitle("app.Alert".localize(), message: successmsg!, buttonTitle: "app.Ok".localize())
                        
                        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                        
                        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "LoginNav") as! UINavigationController
                        let appDelegate = UIApplication.shared.delegate as! AppDelegate
                        appDelegate.window?.rootViewController = viewController
                        
                    }
                    else if isSuccess == false
                    {
                         let invalidmsg = respVO.EndUserMessage
                        
                              self.showAlertViewWithTitle("app.Alert".localize(), message: invalidmsg!, buttonTitle: "app.Retry".localize())
                        
                    }
            }
        }, failureHandler: {(error) in
            
            if(error == "unAuthorized"){
                
                serviceController.refreshTokenForLogin(successHandler:{(result) in
                    DispatchQueue.main.async()
                        {
                            
                            self.changePasswordService()
                            
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
        currentPswdTF.text=currentPswdTF.text!.trimmingCharacters(in: CharacterSet.whitespaces)
        newpswdOutLet.text=newpswdOutLet.text!.trimmingCharacters(in: CharacterSet.whitespaces)
        
        let currenuPswd:NSString = currentPswdTF.text! as NSString
        let newPswd:NSString = newpswdOutLet.text! as NSString
        let reTypeNewPswd:NSString = reTypeNewPswdOutLet.text! as NSString
        
        
        var errorMessage:NSString?
        
        if (currenuPswd.length<=0) {
            errorMessage=GlobalSupportingClass.changePasswordErrorMessage() as String as String as NSString?
        }
            
            

            
        else if (newPswd.length<=0) {
            errorMessage=GlobalSupportingClass.newPasswordErrorMessage() as String as String as NSString?
        }
        else if(!GlobalSupportingClass.capitalOnly(password: newPswd as String)) {
            
            errorMessage=GlobalSupportingClass.capitalLetterMessage() as String as String as NSString?
        }
        else if(!GlobalSupportingClass.numberOnly(password: newPswd as String)) {
            
            errorMessage=GlobalSupportingClass.numberMessage() as String as String as NSString?
        }
        else if(!GlobalSupportingClass.specialCharOnly(password: newPswd as String)) {
            
            errorMessage=GlobalSupportingClass.specialCharacterMessage() as String as String as NSString?
        }
        else if(newPswd.length<8)
        {
            errorMessage = GlobalSupportingClass.invalidDigitsInPasswordErrorMessage() as String as String as NSString?
        }
        else if(newPswd.length>40)
        {
            errorMessage = GlobalSupportingClass.invalidDigitsInPasswordErrorMessage() as String as String as NSString?
        }
        else if(reTypeNewPswd.length<=0){
            errorMessage=GlobalSupportingClass.blankConfirmPasswordErrorMessage() as String as String as NSString?
        }
        else if(!newPswd.isEqual(to: reTypeNewPswd as String)){
            errorMessage=GlobalSupportingClass.passwordMissMatchErrorMessage() as String as String as NSString?
        }
        
        if let errorMsg = errorMessage{
            
            if (currenuPswd.length<=0) {
                
                currentPswdTF.errorMessage = errorMsg as String
                currentPswdTF.errorLabel.textColor = .red
            }
                
                
                
            else if (newPswd.length<=0) {
                
                newpswdOutLet.errorMessage = errorMsg as String
                newpswdOutLet.errorLabel.textColor = .red
            }
            else if(!GlobalSupportingClass.capitalOnly(password: newPswd as String)) {
                
                newpswdOutLet.errorMessage = errorMsg as String
                newpswdOutLet.errorLabel.textColor = .red
            }
            else if(!GlobalSupportingClass.numberOnly(password: newPswd as String)) {
                
                newpswdOutLet.errorMessage = errorMsg as String
                newpswdOutLet.errorLabel.textColor = .red
            }
            else if(!GlobalSupportingClass.specialCharOnly(password: newPswd as String)) {
                
                newpswdOutLet.errorMessage = errorMsg as String
                newpswdOutLet.errorLabel.textColor = .red
            }
            else if(newPswd.length<8)
            {
                newpswdOutLet.errorMessage = errorMsg as String
                newpswdOutLet.errorLabel.textColor = .red
            }
            else if (reTypeNewPswd.length<=0) {
                
                reTypeNewPswdOutLet.errorMessage = errorMsg as String
                reTypeNewPswdOutLet.errorLabel.textColor = .red
            }
            
            else if(!newPswd.isEqual(to: reTypeNewPswd as String)){
                
                reTypeNewPswdOutLet.errorMessage = errorMsg as String
                reTypeNewPswdOutLet.errorLabel.textColor = .red
            }
                
            
            
            return false


        }
        
        
        return true
    }
    

    //MARK:- Button Action

   
    @IBAction func eyebtnclicked(_ sender: Any) {
        
        if eyebtnOutLet.tag == 0
        {
            currentPswdTF.isSecureTextEntry = false
            eyebtnOutLet.tag = 1
        }
            
        else
            
        {
            currentPswdTF.isSecureTextEntry = true
            eyebtnOutLet.tag = 0
            
            
        }

        
    }
    
    
    @IBAction func newPswdAction(_ sender: Any) {
        
        if newpswdOutLet.tag == 0
        {
            newpswdOutLet.isSecureTextEntry = false
            newpswdOutLet.tag = 1
        }
            
        else
            
        {
            newpswdOutLet.isSecureTextEntry = true
            newpswdOutLet.tag = 0
            
            
        }

        
        
        
    }
    
    
    @IBAction func reTypePswdAction(_ sender: Any) {
        
        if retypePswdOutLet.tag == 0
        {
            reTypeNewPswdOutLet.isSecureTextEntry = false
            retypePswdOutLet.tag = 1
        }
            
        else
            
        {
            reTypeNewPswdOutLet.isSecureTextEntry = true
            reTypeNewPswdOutLet.tag = 0
            
            
        }

    }
    
    
    
    
    @IBAction func changePswdAction(_ sender: Any) {
        
        if self.validateAllFields(){
            
            if(appDelegate.checkInternetConnectivity()){
                
                changePasswordService()
                
            }
            else{
                appDelegate.window?.makeToast(kNetworkStatusMessage, duration:kToastDuration, position:CSToastPositionCenter)
                return
            }
            
        }
    }
    

        
    }
    
   

