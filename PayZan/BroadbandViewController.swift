//
//  BroadbandViewController.swift
//  PayZan
//
//  Created by Ram on 26/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit
import AMPFloatingTextField

class BroadbandViewController: BaseViewController,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource{
    
    //MARK:- OutLets

    
    @IBOutlet weak var selectOperatorTextField: AMPFloatingTextField!
    
    @IBOutlet weak var serviceNumberTextFileld: AMPFloatingTextField!
    
    @IBOutlet weak var amountTextField: AMPFloatingTextField!
    
    @IBOutlet weak var payNowButtonOutLet: UIButton!
    
    
    @IBOutlet weak var headerImgHeight: NSLayoutConstraint!
    
    @IBOutlet weak var headerViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var operatorFieldHeight: NSLayoutConstraint!
    
    @IBOutlet weak var serviceNoHeight: NSLayoutConstraint!
    
    @IBOutlet weak var amountFiledHeight: NSLayoutConstraint!
    
    @IBOutlet weak var payBtnHeight: NSLayoutConstraint!
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var backLabel: UILabel!
    
    @IBOutlet weak var dropDownImg: UIImageView!
    
    
    
    let serviceController = ServiceController()
    
   
    
    //MARK:- Variables

    var myPickerView : UIPickerView!
    var toolBar = UIToolbar()
    var userId:String?
    var walletId:String?
    
    var selectedTextField:Int!
    
    
    var operatorList = [String]()
    
    var pickerList = [String]()
    
    
    var totalEnteredAmount:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK:- TextField Colors

        placeHolderCode()
        
//        selectOperatorTextField.layer.borderWidth = 0.5
//        selectOperatorTextField.layer.borderColor = UIColor.lightGray.cgColor
//        selectOperatorTextField.layer.cornerRadius = 3
//        selectOperatorTextField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
//        
//        serviceNumberTextFileld.layer.borderWidth = 0.5
//        serviceNumberTextFileld.layer.borderColor = UIColor.lightGray.cgColor
//        serviceNumberTextFileld.layer.cornerRadius = 3
//        serviceNumberTextFileld.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
//        
//        amountTextField.layer.borderWidth = 0.5
//        amountTextField.layer.borderColor = UIColor.lightGray.cgColor
//        amountTextField.layer.cornerRadius = 3
//        amountTextField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
//        
        selectOperatorTextField.delegate = self
        serviceNumberTextFileld.delegate = self
        amountTextField.delegate = self
        
        amountTextField.keyboardType = .decimalPad
        serviceNumberTextFileld.keyboardType = .numberPad
        amountTextField.maxLengthTextField = 7
        serviceNumberTextFileld.maxLengthTextField = 40
        
        selectOperatorTextField.setLeftPaddingPoints(4)
        serviceNumberTextFileld.setLeftPaddingPoints(4)
        amountTextField.setLeftPaddingPoints(4)
        
        amountTextField.delegate = self
        
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
            
            operatorFieldHeight.constant = 90
            serviceNumberTextFileld.updateBorder()
            serviceNoHeight.constant = 90
            amountFiledHeight.constant = 90
            payBtnHeight.constant = 60
            
            headerViewHeight.constant = 50
            
            selectOperatorTextField.font = UIFont.systemFont(ofSize: 20)
            selectOperatorTextField.placeholderFont = UIFont.systemFont(ofSize: 20)
            selectOperatorTextField.titleFont = UIFont.systemFont(ofSize: 20)
            selectOperatorTextField.errorLabel.font = UIFont.systemFont(ofSize: 14)
            
            serviceNumberTextFileld.font = UIFont.systemFont(ofSize: 20)
            serviceNumberTextFileld.placeholderFont = UIFont.systemFont(ofSize: 20)
            serviceNumberTextFileld.titleFont = UIFont.systemFont(ofSize: 20)
            serviceNumberTextFileld.errorLabel.font = UIFont.systemFont(ofSize: 14)
            
            amountTextField.font = UIFont.systemFont(ofSize: 20)
            amountTextField.placeholderFont = UIFont.systemFont(ofSize: 20)
            amountTextField.titleFont = UIFont.systemFont(ofSize: 20)
            amountTextField.errorLabel.font = UIFont.systemFont(ofSize: 14)
            
            payNowButtonOutLet.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            
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
    
    func placeHolderCode(){
        
        //        selectBoardTextField.borderSize.formSquareRoot()
        //        selectBoardTextField.rightView?.isHidden = true
        
        //        selectBoardTextField.rightViewMode = UITextFieldViewMode(rawValue: 10)!
        //
        //        if #available(iOS 9.0, *) {
        //            selectBoardTextField.rightAnchor.accessibilityActivate()
        //        } else {
        //            // Fallback on earlier versions
        //        }
        
        selectOperatorTextField.placeholder = "app.SelectOperator".localize()
        selectOperatorTextField.selectedTitle = "app.SelectOperator".localize()
        selectOperatorTextField.title = "app.SelectOperator".localize()
        
        //        waterView.addSubview(selectBoardTextField)
        applySkyscannerTheme(textField: selectOperatorTextField)
        
        serviceNumberTextFileld.placeholder = "app.ServiceNumber".localize()

        serviceNumberTextFileld.selectedTitle = "app.ServiceNumber".localize()
        serviceNumberTextFileld.title = "app.ServiceNumber".localize()
        
        //                waterView.addSubview(consumerNumberTextField)
        applySkyscannerTheme(textField: serviceNumberTextFileld)
        
        
        amountTextField.placeholder = "app.Amount".localize()
        amountTextField.selectedTitle = "app.Amount".localize()
        amountTextField.title = "app.Amount".localize()
        
        amountTextField.maxLengthTextField = 7
        
        amountTextField.keyboardType = .numberPad
        
        
        //        amountTextField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        
        
        //        waterView.addSubview(amountTextField)
        applySkyscannerTheme(textField: amountTextField)
    }
    
    func applySkyscannerTheme(textField: AMPFloatingTextField) {
        
        textField.tintColor = .black
        
        textField.textColor = .black
        textField.errorLabel.textColor = .red
        //        textField.layer.cornerRadius = 10
        textField.borderSize.formSquareRoot()
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
    
    //MARK:- UIPickerView
    
    func pickUp(_ textField : UITextField){
        
        
        self.myPickerView = UIPickerView(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        self.myPickerView.delegate = self
        self.myPickerView.dataSource = self
        self.myPickerView.backgroundColor = UIColor.white
//        if operatorList.isEmpty {
//            
//            self.myPickerView.isHidden = true
//            
//            selectOperatorTextField.text = "No Operators"
//            selectOperatorTextField.textColor = UIColor.red
//            selectOperatorTextField.isUserInteractionEnabled = false
//            
//        }else {
//            selectOperatorTextField.isUserInteractionEnabled = true
            textField.inputView = self.myPickerView
//        }
        
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
        if(selectOperatorTextField.text == "" && self.operatorList.count > 0){
            self.selectOperatorTextField.text = self.operatorList[0]
        }
        selectOperatorTextField.resignFirstResponder()
    }
    func cancelClick() {
        selectOperatorTextField.resignFirstResponder()
    }
    
    //MARK:- TextFiled Delegate
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
//        let newString = NSString(string: textField.text!).replacingCharacters(in: range, with: string)
        
        if(textField==self.amountTextField&&range.location==0)
        {
            if (string.hasPrefix("0") || string.hasPrefix("."))
            {
                return false
            }
        }
        
        
        return true
    }

    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        
        
        self.currentjumpOrder = textField.jumpOrder
        
        selectedTextField = textField.tag
        
        if textField == selectOperatorTextField{
            
            pickerList.removeAll()
            
            self.pickUp(selectOperatorTextField)
            
            pickerList = operatorList
            
            selectOperatorTextField = textField as! AMPFloatingTextField
            
            selectOperatorTextField.tag = 1
            
            myPickerView.reloadAllComponents()
            myPickerView.selectRow(0, inComponent: 0, animated: false)
            
            
        }
        else if textField == serviceNumberTextFileld {
            
            pickerList.removeAll()
            selectOperatorTextField.tag = 2
            
            //             myPickerView.reloadAllComponents()
        }
            
        else if textField == amountTextField {
            
            pickerList.removeAll()
            selectOperatorTextField.tag = 3
            
            //             myPickerView.reloadAllComponents()
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
        self.selectOperatorTextField.text = operatorList[row]
        }
    }
    
    //MARK:- getOperatorList

    
    func getOperatorList(){
        
        if(appDelegate.checkInternetConnectivity()){
            
            let strUrl = broadbandUrl
            
            
            serviceController.requestGETURL(strURL:strUrl, success:{(result) in
                DispatchQueue.main.async()
                    {
                        
                        let respVO:OperatorVo = Mapper().map(JSONObject: result)!
                        
                        
                        
                        let isActive = respVO.IsSuccess
                        
                        
                        
                        if(isActive == true){
                            
                            let operatorObj = respVO.ListResult
                            
                            
                            for(_,element) in (operatorObj?.enumerated())! {
                                
                                self.operatorList.append(element.Name!)
                                
                            }
                            
                            
                        }else if(isActive == false) {
                            
                            self.view.makeToast("Service not found", duration:kToastDuration, position:CSToastPositionCenter)
                            
                        }
                }
                
            },
                                            
             failure:  {(error) in
                
            })
            
        }
        else {
             self.selectOperatorTextField.isUserInteractionEnabled = false
            appDelegate.window?.makeToast(kNetworkStatusMessage, duration:kToastDuration, position:CSToastPositionCenter)
            return
        }
    }
    
    func validateAllFields() -> Bool
    {
        selectOperatorTextField.text=selectOperatorTextField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
        serviceNumberTextFileld.text=serviceNumberTextFileld.text!.trimmingCharacters(in: CharacterSet.whitespaces)
        amountTextField.text = amountTextField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
        
        
        let operatField:NSString = selectOperatorTextField.text! as NSString
        let serField:NSString = serviceNumberTextFileld.text! as NSString
        let amField:NSString = amountTextField.text! as NSString
        
        if !(amountTextField.text?.isEmpty)! {
            
            totalEnteredAmount = Int(amountTextField.text!)!
            
        }
        
        
        
        var errorMessage:NSString?
        
        if (operatField.length<=0) {
            errorMessage=GlobalSupportingClass.blankOperatorErrorMessage() as String as String as NSString?
        }
        else if (serField.length<=0) {
            errorMessage=GlobalSupportingClass.blankServiceNumberErrorMessage() as String as String as NSString?
        }
            
        else if (amField.length<=0) {
            errorMessage=GlobalSupportingClass.blankAmountErrorMessage() as String as String as NSString?
        }
        else if (totalEnteredAmount >= 5000) {
            errorMessage=GlobalSupportingClass.AmountErrorMessage() as String as String as NSString?
        }
       
        
        if let errorMsg = errorMessage{
            
            if (operatField.length<=0) {
                
                selectOperatorTextField.errorMessage = errorMsg as String
                selectOperatorTextField.errorLabel.textColor = .red
            }
            else if (serField.length<=0) {
                
                serviceNumberTextFileld.errorMessage = errorMsg as String
                serviceNumberTextFileld.errorLabel.textColor = .red
            }
            else if (amField.length<=0) {
                
                amountTextField.errorMessage = errorMsg as String
                amountTextField.errorLabel.textColor = .red
            }
            else if (totalEnteredAmount >= 5000) {
                
                amountTextField.errorMessage = errorMsg as String
                amountTextField.errorLabel.textColor = .red
            }
            
        return false
        }
//        if let errorMsg = errorMessage{
//            
//            self.showAlertViewWithTitle("app.Alert".localize(), message: errorMsg as String, buttonTitle: "app.Retry".localize())
//            return false;
//        }
        return true
    }
    
    //MARK:- Button Actions
    
    @IBAction func payNowButtonAction(_ sender: Any) {
        
        if(appDelegate.checkInternetConnectivity()){
            
            if validateAllFields(){
                
                if walletId != nil && userId != nil {
                    
                    print("success")
                    
                    let rechargedViewController = self.storyboard?.instantiateViewController(withIdentifier: "PayzAppViewController") as! PayzAppViewController
                    
                    rechargedViewController.totalAmountStr = amountTextField.text!
                    
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
    
    
    
    @IBAction func backButtonAction(_ sender: Any) {
        
        
        self.navigationController?.popViewController(animated: true)

    }
    
    

}









