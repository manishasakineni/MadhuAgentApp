//
//  ViewController.swift
//  PayZan
//
//  Created by CalibrageMac02 on 04/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Google
import GoogleSignIn
import AMPFloatingTextField




//let reachability = Reachability()!

class ViewController: BaseViewController,UITextFieldDelegate,GIDSignInUIDelegate,GIDSignInDelegate,SWRevealViewControllerDelegate {
    
    
    
    @IBOutlet weak var byLogingWidth: NSLayoutConstraint!
    
    @IBOutlet weak var byLogingOutLet: UILabel!
    
    @IBOutlet weak var termsAndConditionsWidth: NSLayoutConstraint!
    
    @IBOutlet weak var andWidth: NSLayoutConstraint!
    @IBOutlet weak var termsAndConditionsOutLet: UIButton!
    
    @IBOutlet weak var andOutLet: UILabel!
    
    @IBOutlet weak var privacypolicyOutLet: UIButton!
    
    @IBOutlet weak var privacypolicyWidth: NSLayoutConstraint!
    
    @IBOutlet weak var orOutLet: UILabel!
    
    @IBOutlet weak var donthaveAcntWidth: NSLayoutConstraint!
    
    @IBOutlet weak var signUpOutLet: UIButton!
    
    @IBOutlet weak var dontHaveAccountOutLet: UILabel!

    
    @IBOutlet weak var cannotLoginOutLet: UIButton!
    
    
    @IBOutlet weak var cannotLoginWidth: NSLayoutConstraint!
    
    
    
    @IBOutlet weak var barBtn: UIBarButtonItem!
    
    @IBOutlet weak var mobileField: AMPFloatingTextField!
    
    @IBOutlet weak var passwordField: AMPFloatingTextField!
    
    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak var eyeBtnOutlet: UIButton!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var facebookBtn: UIButton!
    
    @IBOutlet weak var googleBtn: UIButton!
    
    @IBOutlet weak var headerImgHeight: NSLayoutConstraint!
    
    @IBOutlet weak var LaterBtn: UIButton!
    
    @IBOutlet weak var headerViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var mobileFiledHeight: NSLayoutConstraint!
    
    @IBOutlet weak var passwordFiledHeight: NSLayoutConstraint!
    
    @IBOutlet weak var termsViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var loginBtnHeight: NSLayoutConstraint!
    
    @IBOutlet weak var signUpViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var orLabelHeight: NSLayoutConstraint!
    
    @IBOutlet weak var facebookBtnHeight: NSLayoutConstraint!
    
    @IBOutlet weak var googleBtnHeight: NSLayoutConstraint!
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var backLabel: UILabel!
    
    var dict : [String : AnyObject]!
    
    var userId:String = ""
    
    let serviceController = ServiceController()
    
    var PwButton = UIButton(type: .custom)

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        mobileField.maxLengthTextField = 10
        passwordField.maxLengthTextField = 40
        
        eyeBtnOutlet.isHidden = true
        
        placeHolderCode()
        
        PwButton.setImage(UIImage(named: "eye2"), for: .normal)
        PwButton.contentMode = .scaleAspectFit
        PwButton.frame = CGRect(x: 5, y: 5, width: 20, height: 20)
        PwButton.tintColor = #colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1)
        PwButton.addTarget(self, action: #selector(self.currentPwBtnAction), for: .touchUpInside)

        
        let paddingView: UIView = UIView.init(frame: CGRect(x: 0, y: 0, width: 40, height: 30))
        paddingView.addSubview(PwButton)
        passwordField.rightViewMode = .always
        passwordField.rightView = paddingView
        

        mobileField.setLeftPaddingPoints(4)
        passwordField.setLeftPaddingPoints(4)

//        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self as GIDSignInDelegate
        
        mobileField.delegate = self
        passwordField.delegate = self
        
        facebookBtn.layer.cornerRadius = 3
        googleBtn.layer.cornerRadius = 3
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
            headerImgHeight.constant = 150
            
            mobileFiledHeight.constant = 90
            mobileField.updateBorder()
            passwordFiledHeight.constant = 90
            
            loginBtnHeight.constant = 50
            facebookBtnHeight.constant = 40
            googleBtnHeight.constant = 40
            
            termsViewHeight.constant = 30
            signUpViewHeight.constant = 30
            
            headerViewHeight.constant = 50
            
            donthaveAcntWidth.constant = 200
            
            termsAndConditionsWidth.constant = 150
            privacypolicyWidth.constant = 130
            andWidth.constant = 35
            byLogingWidth.constant = 210
            cannotLoginWidth.constant = 150

            
            mobileField.font = UIFont.systemFont(ofSize: 20)
            mobileField.placeholderFont = UIFont.systemFont(ofSize: 20)
            mobileField.titleFont = UIFont.systemFont(ofSize: 20)
            mobileField.errorLabel.font = UIFont.systemFont(ofSize: 14)
            
            passwordField.font = UIFont.systemFont(ofSize: 20)
            passwordField.placeholderFont = UIFont.systemFont(ofSize: 20)
            passwordField.titleFont = UIFont.systemFont(ofSize: 20)
            passwordField.errorLabel.font = UIFont.systemFont(ofSize: 14)
            
            
            dontHaveAccountOutLet.font = UIFont.systemFont(ofSize: 15)
            
            signUpOutLet.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            facebookBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            googleBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            cannotLoginOutLet.titleLabel?.font = UIFont.systemFont(ofSize: 15)

            termsAndConditionsOutLet.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            privacypolicyOutLet.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            andOutLet.font = UIFont.systemFont(ofSize: 15)
            byLogingOutLet.font = UIFont.systemFont(ofSize: 15)
            orOutLet.font = UIFont.systemFont(ofSize: 15)
            

            
            
            backLabel.font = UIFont.systemFont(ofSize: 16)
        }
        else {
            
            headerImgHeight.constant = 79
            backLabel.font = UIFont.systemFont(ofSize: 12)
            
            mobileField.errorLabel.font = UIFont.systemFont(ofSize: 10)
            passwordField.errorLabel.font = UIFont.systemFont(ofSize: 10)
            

            
        }
        
//        sideMenus()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        

        
        super.viewDidAppear(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
         if UserDefaults.standard.object(forKey: kIsFirstTime) as? String == "true" {
            
            LaterBtn.isHidden = true
            
        }
        
        let defaults = UserDefaults.standard
        
        if let hideBack = defaults.string(forKey: "hideBackBtn") {
            
            print(hideBack)
            
            backBtn.isHidden = true
            
            if UserDefaults.standard.object(forKey: "hideBackBtn") != nil {
                
                UserDefaults.standard.removeObject(forKey: "hideBackBtn")
                UserDefaults.standard.synchronize()
            }
        }
        else {
            
            backBtn.isHidden = false
        }
        
        self.tabBarController?.tabBar.isHidden = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    @IBAction func currentPwBtnAction(_ sender: Any) {
        
        if PwButton.tag == 0
        {
            passwordField.isSecureTextEntry = false
            PwButton.setImage(UIImage(named: "Eye"), for: .normal)
            PwButton.contentMode = .scaleAspectFit
            PwButton.tag = 1
            
            
        }
            
        else
            
        {
            passwordField.isSecureTextEntry = true
            PwButton.setImage(UIImage(named: "eye2"), for: .normal)
            PwButton.contentMode = .scaleAspectFit
            PwButton.tag = 0
            
            
        }
    }
    
    func placeHolderCode(){
        
        
        mobileField.placeholder = "app.MobileNumber".localize()
        mobileField.selectedTitle = "app.MobileNumber".localize()
        mobileField.title = "app.MobileNumber".localize()
        
        passwordField.placeholder = "app.Password".localize()
        passwordField.selectedTitle = "app.Password".localize()
        passwordField.title = "app.Password".localize()
        
        
        applySkyscannerTheme(textField: mobileField)
        applySkyscannerTheme(textField: passwordField)
    }
    
    
    func applySkyscannerTheme(textField: AMPFloatingTextField) {
        
        textField.tintColor = .black
        
        textField.textColor = .black
        textField.errorLabel.textColor = .red
        textField.rightView?.isHidden = true
        textField.errorBackGroundColor = UIColor.lightGray.withAlphaComponent(0.1)
        textField.placeholderColor = UIColor.lightGray
        textField.lineColor = UIColor.white
        textField.selectedTitleColor = #colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1)
        
       
        
    }
    
    
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == passwordField {
            
            if !string.canBeConverted(to: String.Encoding.ascii){
                return false
            }
            
        }
        
                    
        if textField == mobileField // your text filed name
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
            
            return true
        }
        
        
    }
    
    func sideMenus(){
        
        if revealViewController() != nil {
            
            barBtn.target = revealViewController()
            barBtn.action = #selector(SWRevealViewController.revealToggle(_:))
            //  revealViewController() .rearViewRevealWidth = 275
            revealViewController().rightViewRevealWidth = 275
            
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
        
    }
    
    func postLoginService(){
        
        let  strUrl = loginUrl
        
        let mobileNumber:String = mobileField.text!
        let pword:String = passwordField.text!
        
        
        let dictParams = ["clientId": "payzan.mobile",
                          "clientSecret": "PayZan!@",
                          "scope": "offline_access","userName":mobileNumber,"password":pword] as NSDictionary
        
        print("dic params \(dictParams)")
        
        let dictHeaders = ["":"","":""] as NSDictionary
        
        
        serviceController.requestPOSTURL(strURL: strUrl as NSString, postParams: dictParams, postHeaders: dictHeaders, successHandler:{(result) in
            DispatchQueue.main.async()
                {
                    
                    print("result:\(result)")
                    
                    let respVO:LoginResultVo = Mapper().map(JSONObject: result)!
                    
                    
                    print("responseString = \(respVO)")
                    
                    
                    let isSuccess = respVO.IsSuccess
                    
                    print("StatusCode:\(String(describing: isSuccess))")
                    
                    
                    if isSuccess == true
                    {
                        
                        self.userId = (respVO.Result?.Roles?[0].UserId)!
                        
                        let walletId = respVO.Result?.UserWallet?.WalletId
                        
                        print("userId:\(String(describing: self.userId))")
                        print("walletId:\(String(describing: walletId))")
                        
                        let accessTokenn = respVO.Result?.AccessToken
                        let expireTokenTime = respVO.Result?.ExpiresIn
                        let refreshT = respVO.Result?.RefreshToken
                        let tokenTypee = respVO.Result?.TokenType
                        
                        let walletAmount = respVO.Result?.UserWallet?.Balance
                        
                        let uName  = respVO.Result?.User?.UserName
                        
                        let mobileNo = respVO.Result?.User?.PhoneNumber
                        
                        let profileUrl = respVO.Result?.User?.ProfilePicUrl
                        
                        let emailId = respVO.Result?.User?.Email
                        
                        let loginMsg = respVO.EndUserMessage
                        
                        let walletAmountId = respVO.Result?.UserWallet?.Id
                        
                        print("uName:\(String(describing: uName))")
                        
                        let defaults = UserDefaults.standard
                        
                        // Save String value to UserDefaults
                        
                        defaults.set(uName, forKey: uNamee)
                        
                        defaults.set(mobileNo, forKey: mobileNum)
                        
                        defaults.set(profileUrl, forKey: profilePicUrl)
                        
                        defaults.set(emailId, forKey: emailIdd)
                        
                        defaults.set(walletAmount, forKey: walletAmountt)

                        defaults.set(self.userId, forKey: userIDD)
                        
                        defaults.set(walletId, forKey: walletIDD)
                        defaults.set(walletAmountId, forKey: walletAmId)
                        
                        defaults.set(accessTokenn, forKey: accessToken)
                        defaults.set (expireTokenTime, forKey: expiresIn)
                        defaults.set (refreshT, forKey: refreshTokenn)
                        defaults.set(tokenTypee, forKey: tokenType)
                        defaults.set(loginMsg, forKey: loginSuccessfulStr)
                        defaults.set("1", forKey: "1")
                        
                        UserDefaults.standard.synchronize()
                        
                        
                        UserDefaults.standard.setValue("true", forKey: kIsFirstTime)
                        UserDefaults.standard.synchronize()
                        
                        let  homeVC  = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                        
                        
                         homeVC.loginStr = "1"
                        
                        
                        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "TabsViewController") as! UITabBarController
                        
                        
                        
                        if let tabStrings = self.tabBarController?.tabBar.items
                        {
                            tabStrings[1].title = "app.Login".localize()
                        }
                        
                        let appDelegate = UIApplication.shared.delegate as! AppDelegate
                        appDelegate.window?.rootViewController = viewController
                        
                    }
                    else if isSuccess == false {
                        
//                        let inValidMsg = GlobalSupportingClass.invalidLoginMessage()
                        
                        let invalidmsg = respVO.EndUserMessage
                        
                        self.showAlertViewWithTitle("app.Alert".localize(), message: invalidmsg!, buttonTitle: "app.Retry".localize())
                        
                    }
                    else
                    {
                        
                        let inValidMsg = GlobalSupportingClass.invalidLoginMessage()
                        
                        self.showAlertViewWithTitle("app.Alert".localize(), message: inValidMsg as String, buttonTitle: "app.Retry".localize())
                        
                    }
            }
        }, failureHandler: {(error) in
            
            
        })
    }
    
    func refreshTokenApiCall(){
    
    
    }
    
    
    func validateAllFields() -> Bool
    {
        mobileField.text=mobileField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
        passwordField.text=passwordField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
        
        let mnumb:NSString = mobileField.text! as NSString
        let pasword:NSString = passwordField.text! as NSString
        
        
        //Check whether textField are left empty or not
        var errorMessage:NSString?
        
        if (mnumb.length<=0) {
            errorMessage=GlobalSupportingClass.blankPhoneNumberErrorMessage() as String as String as NSString?
        }
        else if (mnumb.length<=9) {
            errorMessage=GlobalSupportingClass.invalidPhoneNumberErrorMessage() as String as String as NSString?
        }
        else if (mobileField.text == "0000000000") {
            errorMessage=GlobalSupportingClass.valiedPhoneNumberErrorMessage() as String as String as NSString?
            
        }
        else if (pasword.length<=0) {
            errorMessage=GlobalSupportingClass.blankPasswordErrorMessage() as String as String as NSString?
        }
            
        else if (pasword.length<8) {
            errorMessage=GlobalSupportingClass.invalidPasswordErrorMessage() as String as String as NSString?
        }
        

        
        if let errorMsg = errorMessage{
            
            if (mnumb.length<=0) {
                
                mobileField.errorMessage = errorMsg as String
                 mobileField.errorLabel.textColor = .red
            }
            else if (mnumb.length<=9) {
                
                mobileField.errorMessage = errorMsg as String
                 mobileField.errorLabel.textColor = .red
            }
            else if (mobileField.text == "0000000000") {
                
                mobileField.errorMessage = errorMsg as String
                passwordField.errorLabel.textColor = .red
                
            }
            else if (pasword.length<=0) {
                
                passwordField.errorMessage = errorMsg as String
                
                passwordField.errorLabel.textColor = .red
            }
                
            else if (pasword.length<8){
                
                passwordField.errorMessage = errorMsg as String
                passwordField.errorLabel.textColor = .red
            }
                
           
            return false


        }
        return true
    }
    

    @IBAction func loginBtnAction(_ sender: Any) {
        
        if self.validateAllFields(){
        
        if(appDelegate.checkInternetConnectivity()){
            
                postLoginService()
           
        }
        else{
                appDelegate.window?.makeToast(kNetworkStatusMessage, duration:kToastDuration, position:CSToastPositionCenter)
                return
        }
        
        }
        
    }

    @IBAction func fbBtnAction(_ sender: Any) {
        
        
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
    
    @IBAction func gmailBtnAction(_ sender: Any) {
        
//        MBProgressHUD.showAdded(to:appDelegate.window,animated:true)
//        
//        
//       GIDSignIn.sharedInstance().signIn()
        
        
    }
    
    func sign(inWillDispatch signIn: GIDSignIn!, error: Error!) {
        
        MBProgressHUD.hide(for:appDelegate.window,animated:true)
    }
    
    // Present a view that prompts the user to sign in with Google
    func sign(_ signIn: GIDSignIn!,
              present viewController: UIViewController!) {
        self.present(viewController, animated: true, completion: nil)
    }
    
    // Dismiss the "Sign in with Google" view
    
    func sign(_ signIn: GIDSignIn!,
              dismiss viewController: UIViewController!) {
        self.dismiss(animated: true, completion: nil)
    }
    
   
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
//        if error != nil{
//            print(error ?? "google error")
//            return
//        }
        if (error == nil)
        {
            
        if UIDevice.current.userInterfaceIdiom == .phone {
            //            if UserDefaults.standard.bool(forKey: "checkLogin") {
            
            let userId = user.userID                  // For client-side use only!
            let idToken = user.authentication.idToken // Safe to send to the server
            let fullName = user.profile.name
            let givenName = user.profile.givenName
            let familyName = user.profile.familyName
            let email = user.profile.email
            let profileUrl = user.profile.imageURL(withDimension: 200)
            //            let mobile = user.profile.
            
            
            print("fullName:\(String(describing: fullName))")
            print("givenName:\(String(describing: givenName))")
            print("email:\(String(describing: email))")
            print("profileUrl:\(String(describing: profileUrl))")
            
            UserDefaults.standard.setValue("true", forKey: kIsFirstTime)
            UserDefaults.standard.synchronize()
            
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = mainStoryboard.instantiateViewController(withIdentifier: "TabsViewController") as! UITabBarController
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = viewController
            
        }
        else if UIDevice.current.userInterfaceIdiom == .pad {
            
            let userId = user.userID                  // For client-side use only!
            let idToken = user.authentication.idToken // Safe to send to the server
            let fullName = user.profile.name
            let givenName = user.profile.givenName
            let familyName = user.profile.familyName
            let email = user.profile.email
            //            let mobile = user.profile.
            
            
            print("fullName:\(String(describing: fullName))")
            print("givenName:\(String(describing: givenName))")
            print("email:\(String(describing: email))")
            
            UserDefaults.standard.setValue("true", forKey: kIsFirstTime)
            UserDefaults.standard.synchronize()
            
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = mainStoryboard.instantiateViewController(withIdentifier: "TabsViewController") as! UITabBarController
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = viewController
            
        }
        }
        else {
        Thread.sleep(forTimeInterval: 1.0)
        var configureError: Error?
        //    [[GGLContext sharedInstance] configureWithError:&configureError];
        assert(configureError == nil, "Error configuring Google services: \(String(describing: configureError))")
        GIDSignIn.sharedInstance().delegate = self as GIDSignInDelegate
            
        }
        
    }
    
    @IBAction func backAction(_ sender: Any) {
        
        if((self.presentingViewController) != nil){
            
            dismiss(animated: true, completion: nil)
            
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = mainStoryboard.instantiateViewController(withIdentifier: "TabsViewController") as! UITabBarController
            
            viewController.tabBar.items?[1].title = "app.Login".localize()
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = viewController
        }
        else{
            
            self.navigationController?.popViewController(animated: true)
        }
        
    
        
    }
    
    @IBAction func signupBtnAction(_ sender: Any) {
        
//        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        appDelegate.window?.rootViewController = viewController
        
        if((self.presentingViewController) != nil){
            
            let viewController = self.storyboard?.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
            self.present(viewController, animated: true, completion: nil)
            
        }
        else {
            
           
            let viewController = self.storyboard?.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
            self.navigationController?.pushViewController(viewController, animated: true)
            

        }
        
        
    }
    
    @IBAction func eyeBtnAction(_ sender: Any) {
        
        if eyeBtnOutlet.tag == 0
        {
          //  passwordField.isSecureTextEntry = false
            eyeBtnOutlet.setImage(UIImage(named: "eyeicon2.png"), for: .normal)
            eyeBtnOutlet.tag = 1
        }
        else{
            
          //  passwordField.isSecureTextEntry = true
            eyeBtnOutlet.setImage(UIImage(named: "Eye.png"), for: .normal)
            eyeBtnOutlet.tag = 0
            
            
        }
    }
    
    @IBAction func laterBtnAction(_ sender: Any) {
        
       
            
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "TabsViewController") as! UITabBarController
        
        viewController.tabBar.items?[1].title = "app.Login".localize()
        
        UserDefaults.standard.setValue("true", forKey: kIsFirstTime)
        UserDefaults.standard.synchronize()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = viewController
        
       
        
    }
    
}

