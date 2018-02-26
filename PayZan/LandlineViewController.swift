//
//  LandlineViewController.swift
//  PayZan
//
//  Created by CalibrageMac02 on 13/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit
import ContactsUI
import AMPFloatingTextField

class LandlineViewController: BaseViewController,UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate,CNContactPickerDelegate {
    
    //MARK:- OutLets

    
    @IBOutlet weak var operatorField: AMPFloatingTextField!
    
    @IBOutlet weak var stdNumField: AMPFloatingTextField!
    
    @IBOutlet weak var circleField: AMPFloatingTextField!
    
    @IBOutlet weak var amountField: AMPFloatingTextField!
    
    @IBOutlet weak var addressBookBtn: UIButton!

    @IBOutlet weak var rechargeBtn: UIButton!
    
    @IBOutlet weak var offersView: UIView!
    
    @IBOutlet weak var headerImgHeight: NSLayoutConstraint!
    
    @IBOutlet weak var headerViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var operatorFiledHeight: NSLayoutConstraint!
    
    @IBOutlet weak var stdNoFieldHeight: NSLayoutConstraint!
    
    @IBOutlet weak var circleFiledHeight: NSLayoutConstraint!
    
    @IBOutlet weak var amountFiledHeight: NSLayoutConstraint!
    
    @IBOutlet weak var payBtnHeight: NSLayoutConstraint!
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var backLabel: UILabel!
    
    @IBOutlet weak var dropDownImg: UIImageView!
    
    @IBOutlet weak var browseBtn: UIButton!
    
    
    
    let serviceController = ServiceController()
    
    var totalEnteredAmount:Int = 0

    
    //MARK:- Variables

    var myPickerView : UIPickerView!
    
    var toolBar = UIToolbar()
    
    var pickerData = ["Operator1" , "Operator2" , "Operator3" , "Operator4"]
    
    
    var operatorList = [String]()
    
    var pickerList = [String]()
    
    var selectedTextField:Int!
    
    var userId:String?
    var walletId:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        addressBookBtn.isHidden = true
        
        
        placeHolderCode()
        
        //MARK:- TextField Colors

        stdNumField.delegate = self
        

        
        amountField.delegate = self

        
        operatorField.delegate = self
        circleField.delegate = self
        
        stdNumField.keyboardType = .phonePad
        amountField.keyboardType = .numberPad
        amountField.maxLengthTextField = 7
        stdNumField.maxLengthTextField = 13
        circleField.maxLengthTextField = 40
        
        stdNumField.setLeftPaddingPoints(4)
        operatorField.setLeftPaddingPoints(4)
        amountField.setLeftPaddingPoints(4)
        circleField.setLeftPaddingPoints(4)
        
        let defaults = UserDefaults.standard
        
        if let userid = defaults.string(forKey: userIDD) {
            
            userId = userid
            
            print("defaults savedString: \(userid)")
        }
        if let walletid = defaults.string(forKey: walletIDD) {
            
            walletId = walletid
            
            print("defaults savedString: \(walletid)")
            
        }
        
        getOperatorList()
        
        //MARK:- headerImgHeight For iphone and ipad

        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
            headerImgHeight.constant = 150
            
            stdNoFieldHeight.constant = 90
            stdNumField.updateBorder()
            operatorFiledHeight.constant = 90
            amountFiledHeight.constant = 90
            circleFiledHeight.constant = 90
            payBtnHeight.constant = 60
            
            headerViewHeight.constant = 50
            
            stdNumField.font = UIFont.systemFont(ofSize: 20)
            stdNumField.placeholderFont = UIFont.systemFont(ofSize: 20)
            stdNumField.titleFont = UIFont.systemFont(ofSize: 20)
            stdNumField.errorLabel.font = UIFont.systemFont(ofSize: 14)
            
            operatorField.font = UIFont.systemFont(ofSize: 20)
            operatorField.placeholderFont = UIFont.systemFont(ofSize: 20)
            operatorField.titleFont = UIFont.systemFont(ofSize: 20)
            operatorField.errorLabel.font = UIFont.systemFont(ofSize: 14)
            
            circleField.font = UIFont.systemFont(ofSize: 20)
            circleField.placeholderFont = UIFont.systemFont(ofSize: 20)
            circleField.titleFont = UIFont.systemFont(ofSize: 20)
            circleField.errorLabel.font = UIFont.systemFont(ofSize: 14)
            
            amountField.font = UIFont.systemFont(ofSize: 20)
            amountField.placeholderFont = UIFont.systemFont(ofSize: 20)
            amountField.titleFont = UIFont.systemFont(ofSize: 20)
            amountField.errorLabel.font = UIFont.systemFont(ofSize: 14)
            
            rechargeBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            
            backLabel.font = UIFont.systemFont(ofSize: 16)
        }
        else {
            
            headerImgHeight.constant = 79
            
            backLabel.font = UIFont.systemFont(ofSize: 12)
            
            stdNumField.errorLabel.font = UIFont.systemFont(ofSize: 10)
            operatorField.errorLabel.font = UIFont.systemFont(ofSize: 10)
            circleField.errorLabel.font = UIFont.systemFont(ofSize: 10)
            amountField.errorLabel.font = UIFont.systemFont(ofSize: 10)

            
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
    
    
    func placeHolderCode(){
        
        
        stdNumField.placeholder = "app.NumberwithSTDCode".localize()
        stdNumField.selectedTitle = "app.NumberwithSTDCode".localize()
        stdNumField.title = "app.NumberwithSTDCode".localize()
        
        circleField.placeholder = "app.SelectCircle".localize()
        circleField.selectedTitle = "app.SelectCircle".localize()
        circleField.title = "app.SelectCircle".localize()
        
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "prepaid_contacts_icon"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsetsMake(0, -16, 0, 0)
        button.frame = CGRect(x: CGFloat(stdNumField.frame.size.width - 25), y: CGFloat(5), width: CGFloat(20), height: CGFloat(25))
        button.addTarget(self, action: #selector(self.stdNumBtnAction), for: .touchUpInside)
        stdNumField.rightView = button
        stdNumField.rightViewMode = .always
        
        
        let amButton = UIButton(type: .roundedRect)
        amButton.setTitle("app.BrowsePlans".localize(), for: .normal)
        amButton.frame = CGRect(x: CGFloat(0), y: CGFloat(5), width: CGFloat(80), height: CGFloat(30))
        amButton.setTitleColor(#colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1), for: .normal)
        amButton.addTarget(self, action: #selector(self.browseBtnAction), for: .touchUpInside)
        amButton.titleLabel?.font = amButton.titleLabel?.font.withSize(10)
        amountField.rightView = amButton
        amountField.rightViewMode = .always
        
        
        
        operatorField.placeholder = "app.SelectOperator".localize()
        operatorField.selectedTitle = "app.SelectOperator".localize()
        operatorField.title = "app.SelectOperator".localize()
        
        amountField.placeholder = "app.Amount".localize()
        amountField.selectedTitle = "app.Amount".localize()
        amountField.title = "app.Amount".localize()
        
        amountField.maxLengthTextField = 7
        
        applySkyscannerTheme(textField: stdNumField)
        applySkyscannerTheme(textField: operatorField)
        applySkyscannerTheme(textField: amountField)
        applySkyscannerTheme(textField: circleField)
    }
    
    @IBAction func stdNumBtnAction(_ sender: Any) {
        
        if #available(iOS 9.0, *) {
            let cnPicker = CNContactPickerViewController()
            
            cnPicker.delegate = self
            self.present(cnPicker, animated: true, completion: nil)
            
        } else {
            
            
        }
    }
    
    @IBAction func browseBtnAction(_ sender: Any) {
        
        print("clicked")
    }
    
    func applySkyscannerTheme(textField: AMPFloatingTextField) {
        
        textField.tintColor = .black
        
        textField.textColor = .black
        textField.errorLabel.textColor = .red
        
        
        
        textField.errorBackGroundColor = UIColor.lightGray.withAlphaComponent(0.1)
        textField.placeholderColor = UIColor.lightGray
        textField.lineColor = UIColor.white
        textField.selectedTitleColor = #colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1)
        
           }
    
    //MARK:- UIPickerView

    func pickUp(_ textField : UITextField){
        
        
        self.myPickerView = UIPickerView(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        self.myPickerView.delegate = self
        self.myPickerView.dataSource = self
        self.myPickerView.backgroundColor = UIColor.white
        
        
        
        
            textField.inputView = self.myPickerView
        
        //MARK:- ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = #colorLiteral(red: 0.4438641369, green: 0.09910114855, blue: 0.1335680187, alpha: 1)
        toolBar.sizeToFit()
        
        //MARK:- Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(RechargeViewController.doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(RechargeViewController.cancelClick))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
        
    }
    
    //MARK:- Button
    func doneClick() {
        
        if(operatorField.text == "" && self.operatorList.count > 0){
            self.operatorField.text = self.operatorList[0]
        }
        operatorField.resignFirstResponder()
    }
    func cancelClick() {
        operatorField.resignFirstResponder()
    }
    
    //MARK:- TextFiled Delegates
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        
        if textField == circleField {
            
            if !string.canBeConverted(to: String.Encoding.ascii){
                return false
            }
            
        }
        
        
        
        if(textField==self.amountField&&range.location==0)
        {
            if (string.hasPrefix("0") || string.hasPrefix("."))
            {
                return false
            }
        }
        
        if textField == stdNumField {
            
            if string.characters.count > 0 {
                
                let currentCharacterCount = textField.text?.characters.count ?? 0
                if (range.length + range.location > currentCharacterCount){
                    return false
                }
                let newLength = currentCharacterCount + string.characters.count - range.length
                
                let allowedCharacters = CharacterSet.decimalDigits
                
                let unwantedStr = string.trimmingCharacters(in: allowedCharacters)
                
                return newLength <= 12 && unwantedStr.characters.count == 0
                
            }
            
        }
        
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        self.currentjumpOrder = textField.jumpOrder
        
        selectedTextField = textField.tag
        
        
        if textField == operatorField{
            
            pickerList.removeAll()
            
            self.pickUp(operatorField)
            
            pickerList = operatorList
            
            operatorField = textField as! AMPFloatingTextField
            
            operatorField.tag = 1
            
            myPickerView.reloadAllComponents()
            myPickerView.selectRow(0, inComponent: 0, animated: false)
            
            
        }
        else  if textField == stdNumField {
            
            pickerList.removeAll()
            operatorField.tag = 2
            
        }
        else  if textField == circleField {
            
            pickerList.removeAll()
            operatorField.tag = 3
            
        }
            
        else if textField == amountField {
            
            pickerList.removeAll()
            operatorField.tag = 4
            
        }
        
    }

    
    //MARK:- PickerView Delegate & DataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return operatorList.count
        
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return operatorList[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if operatorList.count > row {
        
        self.operatorField.text = operatorList[row]
            
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
        
        stdNumField.text = last10!
        
        
    }
    
    //MARK:- getOperatorList

    
    func getOperatorList(){
        
        
        if(appDelegate.checkInternetConnectivity()){
        
        let strUrl = landlineUrl
        
        
        serviceController.requestGETURL(strURL:strUrl, success:{(result) in
            DispatchQueue.main.async()
                {
                    
                    let respVO:OperatorVo = Mapper().map(JSONObject: result)!
                    
                    
                    let isActive = respVO.IsSuccess
                    
                    
                    if(isActive == true){
                        
                        self.operatorField.isUserInteractionEnabled = true
                        
                        let operatorObj = respVO.ListResult
                        
                        
                        for(index,element) in (operatorObj?.enumerated())! {
                            
                            print("index:\(index)")
                            
                            self.operatorList.append(element.Name!)
                            
                        }
                        
                        
                    }else if(isActive == false) {
                    
                        
                        self.view.makeToast("Service not found", duration:kToastDuration, position:CSToastPositionCenter)
                        
                    }

            }
        }, failure:  {(error) in
        })
            
        }
        else {
            
            self.operatorField.isUserInteractionEnabled = false
            
            appDelegate.window?.makeToast(kNetworkStatusMessage, duration:kToastDuration, position:CSToastPositionCenter)
            return
        }
    }
    
    //MARK:- Button Actions

    
    @IBAction func addressBookAction(_ sender: Any) {
        
        if #available(iOS 9.0, *) {
            let cnPicker = CNContactPickerViewController()
            
            cnPicker.delegate = self
            self.present(cnPicker, animated: true, completion: nil)
            
        } else {
            
            
        }
        
    }
    
    func validateAllFields() -> Bool
    {
        operatorField.text=operatorField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
        stdNumField.text=stdNumField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
        circleField.text=circleField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
        amountField.text = amountField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
        
        
        let operatField:NSString = operatorField.text! as NSString
        let stdField:NSString = stdNumField.text! as NSString
        let cirField:NSString = circleField.text! as NSString
        let amField:NSString = amountField.text! as NSString
        
        if !(amountField.text?.isEmpty)! {
            
            totalEnteredAmount = Int(amountField.text!)!
        }
        
        
        var errorMessage:NSString?
        
        if (operatField.length<=0) {
            errorMessage=GlobalSupportingClass.blankOperatorErrorMessage() as String as String as NSString?
        }
        else if (stdField.length<=0) {
            errorMessage=GlobalSupportingClass.blankStdNumberErrorMessage() as String as String as NSString?
        }
            
        else if (cirField.length<=0) {
            errorMessage=GlobalSupportingClass.blankCircleErrorMessage() as String as String as NSString?
        }
        else if (amField.length<=0) {
            errorMessage=GlobalSupportingClass.blankAmountErrorMessage() as String as String as NSString?
        }
        else if (totalEnteredAmount >= 5000) {
            
            errorMessage=GlobalSupportingClass.AmountErrorMessage() as String as String as NSString?
        }
        
        
        if let errorMsg = errorMessage{
            
            if (operatField.length<=0) {
                
                operatorField.errorMessage = errorMsg as String
                operatorField.errorLabel.textColor = .red
            }
            else if (stdField.length<=0) {
                
                stdNumField.errorMessage = errorMsg as String
                stdNumField.errorLabel.textColor = .red
            }
            else if (cirField.length<=0) {
                
                circleField.errorMessage = errorMsg as String
                circleField.errorLabel.textColor = .red
            }
            else if (amField.length<=0) {
                
                amountField.errorMessage = errorMsg as String
                amountField.errorLabel.textColor = .red
            }
            else if (totalEnteredAmount >= 5000) {
                
                amountField.errorMessage = errorMsg as String
                amountField.errorLabel.textColor = .red
            }
            
            return false
        }
        

        
        
        return true
    }
 
  
    @IBAction func rechargeAction(_ sender: Any) {
        
        
        
        if(appDelegate.checkInternetConnectivity()){
            
           if validateAllFields(){
            
            if walletId != nil && userId != nil {
                
                print("success")
                
                let rechargedViewController = self.storyboard?.instantiateViewController(withIdentifier: "PayzAppViewController") as! PayzAppViewController
                
                 rechargedViewController.totalAmountStr = amountField.text!
                
                self.navigationController?.pushViewController(rechargedViewController, animated: true)
                
                
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
            
            self.appDelegate.window?.makeToast(kNetworkStatusMessage, duration:kToastDuration, position:CSToastPositionCenter)
            return
            
        }
        
    }
   
    @IBAction func backAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func searchAction(_ sender: Any) {
    }
    
    @IBAction func notificationAction(_ sender: Any) {
    }
    

}
