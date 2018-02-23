//
//  AddMoneyToWalletViewController.swift
//  PayZan
//
//  Created by Mac OS on 30/12/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit

import AMPFloatingTextField
import IQKeyboardManagerSwift


class AddMoneyToWalletViewController: BaseViewController,UITextFieldDelegate{
    
    @IBOutlet weak var add100PluseButtonOutLet: UIButton!
    
    @IBOutlet weak var add500PluseButtonOutLet: UIButton!
    
    @IBOutlet weak var add1000PluseButtonOutLet: UIButton!
    
    
    @IBOutlet weak var addAmountTextField: AMPFloatingTextField!
    
    @IBOutlet weak var addPromoTextFiled: AMPFloatingTextField!
    
    
    @IBOutlet weak var addMoneyButtonOutLet: UIButton!
    
    @IBOutlet weak var amountFiledHeight: NSLayoutConstraint!
    
    @IBOutlet weak var promoFieldHeight: NSLayoutConstraint!
    
    @IBOutlet weak var addMoneyBtnHeight: NSLayoutConstraint!
    
    
    @IBOutlet weak var hundredHeight: NSLayoutConstraint!
    
    @IBOutlet weak var hundredWidth: NSLayoutConstraint!
    
    @IBOutlet weak var fivehundredHeight: NSLayoutConstraint!
    
    @IBOutlet weak var fivehundredWidth: NSLayoutConstraint!
    
    @IBOutlet weak var thousandHeight: NSLayoutConstraint!
    
    @IBOutlet weak var thousandWidth: NSLayoutConstraint!
    
    
    var delegate: walletSubtitleOfIndexDelegate?
    
    var copyDelegate: CopyDataDelegate?
    
    
    var userId:String? = ""
    var walletId:String? = ""
    
    private var hCountInt:Int = 0
    private var fCountInt:Int = 0
    private var tCountInt:Int = 0
    
    var totalAmount = ""
    
    //MARK:- Variables
    
    var addedamount  = Int()
    
    
    var indexValue:Int!
    
    var hunredTitle:Int = 0
    var fivehundredTitle:Int = 0
    var thousnadTitle:Int = 0
    
    var hunredCounter:Int = 100
    var fivehundredCounter:Int = 500
    var thousnadTCounter:Int = 1000
    
    
    let serviceController = ServiceController()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        placeHolderCode()
        addedamount = 0
        addAmountTextField.keyboardType = .decimalPad
        addAmountTextField.delegate = self
        addPromoTextFiled.delegate = self
        addAmountTextField.autocorrectionType = .no
        addPromoTextFiled.autocorrectionType = .no
        
        addAmountTextField.text = ""
        addPromoTextFiled.text = ""

        
//        addAmountTextField.layer.borderWidth = 0.5
//        addAmountTextField.layer.borderColor = UIColor.lightGray.cgColor
//        addAmountTextField.layer.cornerRadius = 3
//        addAmountTextField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
//        
//        addPromoTextFiled.layer.borderWidth = 0.5
//        addPromoTextFiled.layer.borderColor = UIColor.lightGray.cgColor
//        addPromoTextFiled.layer.cornerRadius = 3
//        addPromoTextFiled.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        
        
        let defaults = UserDefaults.standard
        
        if let userid = defaults.string(forKey: userIDD) {
            
            userId = userid
            
            print("defaults savedString: \(userid)")
        }
        if let walletid = defaults.string(forKey: walletIDD) {
            
            walletId = walletid
            
            print("defaults savedString: \(walletid)")
            
        }
        
   
        borderColor()
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
            addMoneyBtnHeight.constant = 60
            addAmountTextField.updateBorder()
            promoFieldHeight.constant = 90
            amountFiledHeight.constant = 90
            
            hundredHeight.constant = 50
            hundredWidth.constant = 150
            
            fivehundredHeight.constant = 50
            fivehundredWidth.constant = 150
            
            thousandHeight.constant = 50
            thousandWidth.constant = 150
            
            
            addAmountTextField.font = UIFont.systemFont(ofSize: 20)
            addAmountTextField.placeholderFont = UIFont.systemFont(ofSize: 20)
            addAmountTextField.titleFont = UIFont.systemFont(ofSize: 20)
            addAmountTextField.errorLabel.font = UIFont.systemFont(ofSize: 15)
            
            addPromoTextFiled.font = UIFont.systemFont(ofSize: 20)
            addPromoTextFiled.placeholderFont = UIFont.systemFont(ofSize: 20)
            addPromoTextFiled.titleFont = UIFont.systemFont(ofSize: 20)
            addPromoTextFiled.errorLabel.font = UIFont.systemFont(ofSize: 15)
            
            addMoneyButtonOutLet.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            
        }
        else {
            
            
        }
        
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        placeHolderCode()
        addAmountTextField.text = ""
        addPromoTextFiled.text = ""
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
            addMoneyBtnHeight.constant = 60
            addAmountTextField.updateBorder()
            promoFieldHeight.constant = 90
            amountFiledHeight.constant = 90
            
            hundredHeight.constant = 50
            hundredWidth.constant = 150
            
            fivehundredHeight.constant = 50
            fivehundredWidth.constant = 150
            
            thousandHeight.constant = 50
            thousandWidth.constant = 150
            
            
            addAmountTextField.font = UIFont.systemFont(ofSize: 20)
            addAmountTextField.placeholderFont = UIFont.systemFont(ofSize: 20)
            addAmountTextField.titleFont = UIFont.systemFont(ofSize: 20)
            addAmountTextField.errorLabel.font = UIFont.systemFont(ofSize: 14)
            
            addPromoTextFiled.font = UIFont.systemFont(ofSize: 20)
            addPromoTextFiled.placeholderFont = UIFont.systemFont(ofSize: 20)
            addPromoTextFiled.titleFont = UIFont.systemFont(ofSize: 20)
            addPromoTextFiled.errorLabel.font = UIFont.systemFont(ofSize: 14)
            
            addMoneyButtonOutLet.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            
            add100PluseButtonOutLet.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            add500PluseButtonOutLet.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            add1000PluseButtonOutLet.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            
        }
        else {
            
            
        }
        
         hCountInt = 0
         fCountInt = 0
         tCountInt = 0
        
//        self.title = "app.AddMoneytowallet".localize()
        
        let defaults = UserDefaults.standard
        
        if let walletAmount = defaults.string(forKey: "walletAmount") {
            
            
//            walletBalLabel.text = walletAmount
            
//             addAmountTextField.text = ""
            
            print("defaults savedString: \(walletAmount)")
        }
       
        if let userid = defaults.string(forKey: userIDD) {
            
            userId = userid
            
            print("defaults savedString: \(userid)")
        }
        else {
            
            userId = ""
            
        }
        if let walletid = defaults.string(forKey: walletIDD) {
            
            walletId = walletid
            
            print("defaults savedString: \(walletid)")
            
        }
        else {
            
            walletId = ""
        }
       
        
       // IQKeyboardManager.sharedManager().enable = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(true)
        
        let defaults = UserDefaults.standard
        
        if let emptyId = defaults.string(forKey: "emptyField") {
            
            
            print(emptyId)
            
            addAmountTextField.text = ""
            
            addAmountTextField.updateBorder()
            
//            addAmountTextField.editingBegin()
            
            if UserDefaults.standard.object(forKey: "emptyField") != nil {
                
                UserDefaults.standard.removeObject(forKey: "emptyField")
                UserDefaults.standard.synchronize()
            }
            
        }
        
        
        
        
    }

    func placeHolderCode(){
        
        // textfield effect
        
        addPromoTextFiled.placeholder = "app.EnterPromocode".localize()
        addPromoTextFiled.selectedTitle = "app.EnterPromocode".localize()
        addPromoTextFiled.title = "app.EnterPromocode".localize()
        addAmountTextField.maxLengthTextField = 40
        
        addAmountTextField.placeholder = "app.EnteredAmount".localize()
        addAmountTextField.selectedTitle = "app.EnteredAmount".localize()
        addAmountTextField.title = "app.EnteredAmount".localize()
        
        addAmountTextField.maxLengthTextField = 7
        addAmountTextField.setLeftPaddingPoints(4)
        addPromoTextFiled.setLeftPaddingPoints(4)
        
        applySkyscannerTheme(textField: addPromoTextFiled)
        applySkyscannerTheme(textField: addAmountTextField)
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
        addAmountTextField.text=addAmountTextField.text!.trimmingCharacters(in: CharacterSet.whitespaces)        
        
//        let nwField:NSString = networkField.text! as NSString
        let amField:NSString = addAmountTextField.text! as NSString
        
        
        var errorMessage:NSString?
        
        
         if (amField.length<=0) {
            
            errorMessage=GlobalSupportingClass.blankSendAmountErrorMessage() as String as String as NSString?
        }
        
        if addAmountTextField.text != "" {
        if Float(addAmountTextField.text!)! > 5000{
        
            Utilities.sharedInstance.alertWithOkButtonAction(vc: self, alertTitle: "app.Alert".localize(), messege: "app.Can'tAddmorethanRs5000".localize(), clickAction: {
                
                
                
            })
            
          return false
        
        }
        }
        
        if let errorMsg = errorMessage{
            
            
             if (amField.length<=0) {
                
                addAmountTextField.errorMessage = errorMsg as String
                addAmountTextField.errorLabel.textColor = .red
                
            }
            return false;
        }
        return true
    }
    
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        
        
        if textField == addAmountTextField{
        
            if textField.text != "" {
                
                if Int(textField.text!)! > 5000 {
                    
                    Utilities.sharedInstance.alertWithOkButtonAction(vc: self, alertTitle: "app.Alert".localize(), messege: "app.Can'tAddmorethanRs5000".localize(), clickAction: {
                        
                    })
                }
                
                hCountInt = 0
                addedamount = Int(textField.text!)!
    
            }else{
                hCountInt = 0
               // textField.text = String(0)
                addedamount = 0
            }
            
            
      
        }
        
       
        
        
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        /// 1. replacementString is NOT empty means we are entering text or pasting text: perform the logic
        /// 2. replacementString is empty means we are deleting text: return true
        
//        let countdots = (addAmountTextField.text?.components(separatedBy: ".").count)! - 1
//        
//        if countdots > 0 && string == "."
//        {
//            return false
//        }
        
        if textField == addPromoTextFiled {
            
            if !string.canBeConverted(to: String.Encoding.ascii){
                return false
            }
            
        }

        
        
        let newValue = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        
        if(textField==self.addAmountTextField&&range.location==0)
        {
            if (string.hasPrefix("0") || string.hasPrefix("."))
            {
                return false
            }
        }
        
        if textField == addAmountTextField{
            
            if string.characters.count > 0 {
                
                if let enterdString = Int(newValue){
                
                    if enterdString > 5000 {
                    
                        Utilities.sharedInstance.alertWithOkButtonAction(vc: self, alertTitle: "app.Alert".localize(), messege: "app.Can'tAddmorethanRs5000".localize(), clickAction: {
    
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
        
        if textField == addPromoTextFiled{
        
            let currentCharacterCount = textField.text?.characters.count ?? 0
            if (range.length + range.location > currentCharacterCount){
                return false
            }
            let newLength = currentCharacterCount + string.characters.count - range.length
            
            
            
            return newLength <= 40
        
        }
        
//        textField.text = ""

        
        return true
    }
    
    
    func borderColor(){
        
        
        add100PluseButtonOutLet.layer.borderColor = UIColor(red: 128.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha:1.0).cgColor
        add100PluseButtonOutLet.layer.borderWidth = 1
        
        add500PluseButtonOutLet.layer.borderColor = UIColor(red: 128.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha:1.0).cgColor
        add500PluseButtonOutLet.layer.borderWidth = 1
        
        add1000PluseButtonOutLet.layer.borderColor = UIColor(red: 128.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha:1.0).cgColor
        add1000PluseButtonOutLet.layer.borderWidth = 1
        
    }

    @IBAction func thousendButtonClicked(_ sender: Any) {
        
        addAmountTextField.errorMessage = ""
        
        addAmountTextField.errorLabel.text = ""
        
        if addAmountTextField.text != ""{
        
        if Int(addAmountTextField.text!)! > 5000{

            Utilities.sharedInstance.alertWithOkButtonAction(vc: self, alertTitle: "app.Alert".localize(), messege: "app.Can'tAddmorethanRs5000".localize(), clickAction: {
    
                
            })
            
            return
        }
    
        }

            self.addAmountTextField.text = ""
            
           //   tCountInt = addedamount
            hCountInt = hCountInt + addedamount
            hCountInt += 1000
            addAmountTextField.text = "\(hCountInt)"
        
        if hCountInt >= 5001{
            
            hCountInt = hCountInt - 1000
            
            Utilities.sharedInstance.alertWithOkButtonAction(vc: self, alertTitle: "app.Alert".localize(), messege: "app.Can'tAddmorethanRs5000".localize(), clickAction: {
                
                
                
            })
            
            return
        }
            addedamount = 0
   
    }
    
    
    @IBAction func fiveHundredButtonClicked(_ sender: Any) {
        
        addAmountTextField.errorMessage = ""
        
        if addAmountTextField.text != ""{
            
            if Int(addAmountTextField.text!)! > 5000{
                
                Utilities.sharedInstance.alertWithOkButtonAction(vc: self, alertTitle: "app.Alert".localize(), messege: "app.Can'tAddmorethanRs5000".localize(), clickAction: {
     
                })
                
                return
            }
            
        }

//        hCountInt = 0
//        
//        fCountInt = 0
//        tCountInt = 0
        self.addAmountTextField.text = ""
        
      //  fCountInt = addedamount
           hCountInt = hCountInt + addedamount
        hCountInt += 500
       // self.addAmountTextField.text = "\(fCountInt)"
       addAmountTextField.text = "\(hCountInt)"
        
        if hCountInt >= 5001{
            
            hCountInt = hCountInt - 1000
            
            Utilities.sharedInstance.alertWithOkButtonAction(vc: self, alertTitle: "app.Alert".localize(), messege: "app.Can'tAddmorethanRs5000".localize(), clickAction: {
                
                
                
            })
            
            return
        }
        addedamount = 0
       
        
        
        
    }
    
    @IBAction func hundredButtonClicked(_ sender: Any) {
        
        addAmountTextField.errorMessage = ""
        
//        addAmountTextField.updateBorder()
        
        
        if addAmountTextField.text != ""{
            
            let totalEnteredAmount : Int = Int(addAmountTextField.text!)!
            
            if totalEnteredAmount >=  5000{
                
                Utilities.sharedInstance.alertWithOkButtonAction(vc: self, alertTitle: "app.Alert".localize(), messege: "app.Can'tAddmorethanRs5000".localize(), clickAction: {
    
                })
            
                return
            }
            
        }

//       hCountInt = 0
//        
//        fCountInt = 0
//        tCountInt = 0
        
     //  addedamount = Int(self.addAmountTextField.text!)!
        
      //  let CurrentVal : Int = Int(self.addAmountTextField.text!)!
        self.addAmountTextField.text = ""
        
         hCountInt = hCountInt + addedamount
        
        hCountInt += 100
        
        addAmountTextField.text = "\(hCountInt)"
        
        if hCountInt >= 5001{
            
            hCountInt = hCountInt - 1000
            
            Utilities.sharedInstance.alertWithOkButtonAction(vc: self, alertTitle: "app.Alert".localize(), messege: "app.Can'tAddmorethanRs5000".localize(), clickAction: {
                
                
                
            })
            
            return
        }
   addedamount = 0
        
    }
    
    @IBAction func addMoneyAction(_ sender: Any) {
        
        if(appDelegate.checkInternetConnectivity()){
            
            if validateAllFields() {
                
                if !(walletId?.isEmpty)! && !(userId?.isEmpty)! {
                
//                        postWalletMoneyService()
                let addMoney:String = "AddMoney"
                
                  let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                
                    
                    let addMoneyViewController = mainStoryboard.instantiateViewController(withIdentifier: "PayzAppViewController") as! PayzAppViewController
                    
                    let numberFormatter = NumberFormatter()
                    numberFormatter.minimumFractionDigits = 2
                    numberFormatter.maximumFractionDigits = 2
                    
                    let dValue = Float(addAmountTextField.text!)
                    
                    let amField = numberFormatter.string(from: dValue! as NSNumber)!
                    
                    print(amField)
                    
                    addMoneyViewController.addMoneyAmount = amField
                    
                    addMoneyViewController.addMoneyStr = addMoney
                    
//                    addMoneyViewController.addMoneyAmount = addAmountTextField.text!
                    
                    self.navigationController?.pushViewController(addMoneyViewController, animated: true)
                 
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
            
        }
        else {
            
            appDelegate.window?.makeToast(kNetworkStatusMessage, duration:kToastDuration, position:CSToastPositionCenter)
            return
            
        }
        
        
        
    }
    
    //MARK:- postWalletMoneyService
    
    
    func postWalletMoneyService(){
        
        
        if !(walletId?.isEmpty)! && !(userId?.isEmpty)! {
            
            let walletField:String = addAmountTextField.text!
            
            let  strUrl = walletUrl
            
            let currentDate = GlobalSupportingClass.getCurrentDate()
            
            print("currentDate\(currentDate)")
            
            let dictParams = ["WalletId":walletId!,
                              "Amount":walletField,
                              "TransactionTypeId":1,
                              "ReasonTypeId":1,
                              "Id":0,
                              "IsActive":true
                              ] as NSDictionary
            
            print("dic params \(dictParams)")
            
            let dictHeaders = ["":"","":""] as NSDictionary
            
            
            print("dictHeader:\(dictHeaders)")
            
            serviceController.requestPOSTURL(strURL: strUrl as NSString, postParams: dictParams, postHeaders: dictHeaders, successHandler:{(result) in
                DispatchQueue.main.async()
                    {
                        
                        print("result:\(result)")
                        
                        let respVO:ResultVo = Mapper().map(JSONObject: result)!
                        
                        
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
                                
                                
                                if let delegate = self.copyDelegate {
                                    delegate.stringToBeCopied(stringValue: walletAmount)
                                    
                                }
                                
//                                self.walletBalLabel.text = walletAmount
                                
                                print("defaults savedString: \(walletAmount)")
                            }
                            
                            self.addAmountTextField.text! = ""
                            self.addPromoTextFiled.text! = ""
                            
                            self.hCountInt = 0
                            self.fCountInt = 0
                            self.tCountInt = 0
                            self.addedamount = 0
                            
                            self.appDelegate.window?.makeToast(successMsg!, duration:kToastDuration, position:CSToastPositionCenter)
                            
                            
                        }
                        else if statusCode == false{
                            
                            let failMsg = respVO.ValidationErrors?[0].Description
                            
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
                                
                                self.postWalletMoneyService()
                                
                        }
                    }, failureHandler:  {(error) in
                        
                        DispatchQueue.main.async()
                            {
                                
                                let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                                
                                let viewController = mainStoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                                appDelegate.window?.rootViewController = viewController
                                
                        }
                        
                        
                    })
                }
                
            })
        }
        
        
    }

    
    

}
