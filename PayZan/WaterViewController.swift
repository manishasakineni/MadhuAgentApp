//
//  WaterViewController.swift
//  PayZan
//
//  Created by Ram on 26/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit
import AMPFloatingTextField

class WaterViewController: BaseViewController,UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate {
    
    //MARK:- OutLets
    
    @IBOutlet weak var selectBoardTextField: AMPFloatingTextField!
    @IBOutlet weak var consumerNumberTextField: AMPFloatingTextField!
    @IBOutlet weak var amountTextField: AMPFloatingTextField!
    
    @IBOutlet weak var proceedToPayButtonOutLet: UIButton!
    
    @IBOutlet weak var headerImgHeight: NSLayoutConstraint!
    
    let serviceController = ServiceController()

    @IBOutlet weak var waterView: UIView!
    
    @IBOutlet weak var headerViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var boardFiledHeight: NSLayoutConstraint!
    
    @IBOutlet weak var amountFieldHeight: NSLayoutConstraint!
    
    @IBOutlet weak var payBtnHeight: NSLayoutConstraint!
    
    @IBOutlet weak var consumerFieldHeight: NSLayoutConstraint!
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var backLabel: UILabel!
    
    @IBOutlet weak var dropDownImg: UIImageView!
    
    //MARK:- Variables

    var myPickerView : UIPickerView!
    
    var toolBar = UIToolbar()
    
    var userId:String?
    var walletId:String?
    
     var selectedTextField:Int!
    
    
    var operatorList = [String]()
    
    var pickerList = [String]()
    
    var totalEnteredAmount:Int = 0
    
//    let emailField = AMPFloatingTextField(frame: CGRect(x: 10, y: 100, width: 400, height: 60))
    
    let lightGreyColor: UIColor = UIColor(red: 197 / 255, green: 205 / 255, blue: 205 / 255, alpha: 1.0)
    let darkGreyColor: UIColor = UIColor(red: 52 / 255, green: 42 / 255, blue: 61 / 255, alpha: 1.0)
    let overcastBlueColor: UIColor = UIColor(red: 0, green: 187 / 255, blue: 204 / 255, alpha: 1.0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        
        
        selectBoardTextField.delegate = self
        consumerNumberTextField.delegate = self
        amountTextField.delegate = self
        
        amountTextField.keyboardType = .numberPad
        amountTextField.maxLengthTextField = 7
        consumerNumberTextField.maxLengthTextField = 40
        
        
//        amountTextField.editingBegin()
        
         placeHolderCode()
        
       
        
//        amountTextField.updateBorder()
        
        //        fnameField.layer.cornerRadius = 5
        
//        selectBoardTextField.rightView?.isHidden = true
//        
//        selectBoardTextField.rightViewMode = UITextFieldViewMode(rawValue: 10)!
//        
//        if #available(iOS 9.0, *) {
//            selectBoardTextField.rightAnchor.accessibilityActivate()
//        } else {
//            // Fallback on earlier versions
//        }
//        
//        selectBoardTextField.placeholder = NSLocalizedString(
//            "Select Operator",
//            tableName: "AMPFloatingTextField",
//            comment: "placeholder for Email field"
//        )
//        selectBoardTextField.selectedTitle = NSLocalizedString(
//            "Select Operator",
//            tableName: "AMPFloatingTextField",
//            comment: "selected Operator field"
//        )
//        selectBoardTextField.title = NSLocalizedString(
//            "Select Operator",
//            tableName: "AMPFloatingTextField",
//            comment: "title Operator field"
//        )
////        waterView.addSubview(selectBoardTextField)
//        applySkyscannerTheme(textField: selectBoardTextField)
//        
//        consumerNumberTextField.placeholder = NSLocalizedString(
//            "Consumer Number",
//            tableName: "AMPFloatingTextField",
//            comment: "placeholder for Consumer Number field"
//        )
//        consumerNumberTextField.selectedTitle = NSLocalizedString(
//            "Consumer Number",
//            tableName: "AMPFloatingTextField",
//            comment: "selected title for Consumer Number field"
//        )
//        consumerNumberTextField.title = NSLocalizedString(
//            "Select Operator",
//            tableName: "AMPFloatingTextField",
//            comment: "title for Consumer Number field"
//        )
//        
////        waterView.addSubview(consumerNumberTextField)
//        applySkyscannerTheme(textField: consumerNumberTextField)
        
        //MARK:- TextField Colors

        
//        selectBoardTextField.layer.borderWidth = 0.5
//        selectBoardTextField.layer.borderColor = UIColor.lightGray.cgColor
//        selectBoardTextField.layer.cornerRadius = 3
//        selectBoardTextField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
//        
//        consumerNumberTextField.layer.borderWidth = 0.5
//        consumerNumberTextField.layer.borderColor = UIColor.lightGray.cgColor
//        consumerNumberTextField.layer.cornerRadius = 3
//        
//        
//        consumerNumberTextField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
//        
//        amountTextField.layer.borderWidth = 0.5
//        amountTextField.layer.borderColor = UIColor.lightGray.cgColor
//        amountTextField.layer.cornerRadius = 3
//        amountTextField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
//        
//        selectBoardTextField.delegate = self
//        
//        amountTextField.keyboardType = .decimalPad
//        consumerNumberTextField.keyboardType = .numberPad
//        amountTextField.maxLengthTextField = 7
        
        
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
            
            boardFiledHeight.constant = 90
            selectBoardTextField.updateBorder()
//            consumerFieldHeight.constant = 90
            amountFieldHeight.constant = 90
            consumerFieldHeight.constant = 90
            payBtnHeight.constant = 60
            
            headerViewHeight.constant = 50
            
            selectBoardTextField.font = UIFont.systemFont(ofSize: 20)
            selectBoardTextField.placeholderFont = UIFont.systemFont(ofSize: 20)
            selectBoardTextField.titleFont = UIFont.systemFont(ofSize: 20)
            selectBoardTextField.errorLabel.font = UIFont.systemFont(ofSize: 14)
            
            consumerNumberTextField.font = UIFont.systemFont(ofSize: 20)
            consumerNumberTextField.placeholderFont = UIFont.systemFont(ofSize: 20)
            consumerNumberTextField.titleFont = UIFont.systemFont(ofSize: 20)
            consumerNumberTextField.errorLabel.font = UIFont.systemFont(ofSize: 14)
            
            amountTextField.font = UIFont.systemFont(ofSize: 20)
            amountTextField.placeholderFont = UIFont.systemFont(ofSize: 20)
            amountTextField.titleFont = UIFont.systemFont(ofSize: 20)
            amountTextField.errorLabel.font = UIFont.systemFont(ofSize: 14)
            
            proceedToPayButtonOutLet.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            
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
        
//         placeHolderCode()
        
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
        
        selectBoardTextField.placeholder = "app.SelectOperator".localize()
        selectBoardTextField.selectedTitle = "app.SelectOperator".localize()
        selectBoardTextField.title = "app.SelectOperator".localize()
                
//        view.addSubview(selectBoardTextField)
       
        
        consumerNumberTextField.placeholder = "app.ConsumerNumber".localize()
//        NSLocalizedString(
//            "Consumer Number",
//            tableName: "",
//            comment: "placeholder for Consumer Number field"
//        )
        consumerNumberTextField.selectedTitle = "app.ConsumerNumber".localize()
        consumerNumberTextField.title = "app.ConsumerNumber".localize()
                
//               view.addSubview(consumerNumberTextField)
        
        
        
        amountTextField.placeholder = "app.Amount".localize()
        amountTextField.selectedTitle = "app.Amount".localize()
        amountTextField.title = "app.Amount".localize()
        
        amountTextField.maxLengthTextField = 7
        
        amountTextField.setLeftPaddingPoints(4)
        consumerNumberTextField.setLeftPaddingPoints(4)
        selectBoardTextField.setLeftPaddingPoints(4)
        
        
//        amountTextField.borderLayer.frame = CGRect( x: UIScreen.main.bounds.origin.x, y: 15, width: UIScreen.main.bounds.size.width-10,
//                                                    height: UIScreen.main.bounds.size.height - 15 * 2 - 0.2)
//        
//        amountTextField.updateBorder()
        
//        amountTextField.keyboardType = .decimalPad
        
        
//        amountTextField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)

//        view.addSubview(amountTextField)
         applySkyscannerTheme(textField: selectBoardTextField)
        applySkyscannerTheme(textField: consumerNumberTextField)
        applySkyscannerTheme(textField: amountTextField)
    }
    
    func validateConsumerNumTextFieldWithText(consumer: String?) {
        guard let consNum = consumer else {
            consumerNumberTextField.errorMessage = nil
            consumerNumberTextField.rightView?.isHidden = true
            return
        }
        
        if consNum.characters.isEmpty {
            consumerNumberTextField.errorMessage = NSLocalizedString(
                "Please Enter Consumer Number",
                tableName: "AMPFloatingTextField",
                comment: " "
            )
            consumerNumberTextField.rightView?.isHidden = true
        }
            //        else if isOnlyNumbers(phone as NSString) {
            //            selectBoardTextField.errorMessage = NSLocalizedString(
            //                "please enter valid phone number",
            //                tableName: "AMPFloatingTextField",
            //                comment: " "
            //            )
            //        }
        else {
            consumerNumberTextField.errorMessage = nil
            consumerNumberTextField.rightView?.isHidden = true
        }
    }

    
    func validateOperatorTextFieldWithText(selectoperator: String?) {
        guard let soperator = selectoperator else {
            selectBoardTextField.errorMessage = nil
            selectBoardTextField.rightView?.isHidden = true
            return
        }
        
        if soperator.characters.isEmpty {
            selectBoardTextField.errorMessage = NSLocalizedString(
                "Please Select Operator",
                tableName: "AMPFloatingTextField",
                comment: " "
            )
            selectBoardTextField.rightView?.isHidden = true
        }
//        else if isOnlyNumbers(phone as NSString) {
//            selectBoardTextField.errorMessage = NSLocalizedString(
//                "please enter valid phone number",
//                tableName: "AMPFloatingTextField",
//                comment: " "
//            )
//        }
        else {
            selectBoardTextField.errorMessage = nil
            selectBoardTextField.rightView?.isHidden = true
        }
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
//            selectBoardTextField.text = "No Operators"
//            selectBoardTextField.textColor = UIColor.red
//            selectBoardTextField.isUserInteractionEnabled = false
//            
//        }else {
//            selectBoardTextField.isUserInteractionEnabled = true
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
        if(selectBoardTextField.text == "" && self.operatorList.count > 0){
            self.selectBoardTextField.text = self.operatorList[0]
        }
        selectBoardTextField.resignFirstResponder()
    }
    func cancelClick() {
        selectBoardTextField.resignFirstResponder()
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
        
        if textField == selectBoardTextField{
            
            pickerList.removeAll()
            
            self.pickUp(selectBoardTextField)
            
            pickerList = operatorList
            
            selectBoardTextField = textField as! AMPFloatingTextField
            
            selectBoardTextField.tag = 1
            
            myPickerView.reloadAllComponents()
            myPickerView.selectRow(0, inComponent: 0, animated: false)
            
            
        }
        else if textField == consumerNumberTextField {
            
            pickerList.removeAll()
            selectBoardTextField.tag = 2
            
//             myPickerView.reloadAllComponents()
        }
        
        else if textField == amountTextField {
            
            pickerList.removeAll()
            selectBoardTextField.tag = 3
            
            //             myPickerView.reloadAllComponents()
        }

        
//        self.pickUp(selectBoardTextField)
//        
//        selectBoardTextField = textField as! AMPFloatingTextField
//        
//        self.myPickerView.reloadAllComponents()
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
        self.selectBoardTextField.text = operatorList[row]
        }
    }
    
    //MARK:- getOperatorList

    
    func getOperatorList(){
        
        if(appDelegate.checkInternetConnectivity()){
            
            let strUrl = waterUrl
            
//            let url : NSURL = NSURL(string: strUrl)!
            
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
             self.selectBoardTextField.isUserInteractionEnabled = false
            appDelegate.window?.makeToast(kNetworkStatusMessage, duration:kToastDuration, position:CSToastPositionCenter)
            return
        }
    }
    
    
    func validateAllFields() -> Bool
    {
        selectBoardTextField.text=selectBoardTextField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
        consumerNumberTextField.text=consumerNumberTextField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
        amountTextField.text = amountTextField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
        
        
        let boardField:NSString = selectBoardTextField.text! as NSString
        let conField:NSString = consumerNumberTextField.text! as NSString
        let amField:NSString = amountTextField.text! as NSString
        
        if !(amountTextField.text?.isEmpty)! {
            
            totalEnteredAmount = Int(amountTextField.text!)!
            
        }
        
        
        
        var errorMessage:NSString?
        
        if (boardField.length<=0) {
            errorMessage=GlobalSupportingClass.blankOperatorErrorMessage() as String as String as NSString?
        }
        else if (conField.length<=0) {
            errorMessage=GlobalSupportingClass.blankConsumerNumberErrorMessage() as String as String as NSString?
        }
            
        else if (amField.length<=0) {
            errorMessage=GlobalSupportingClass.blankAmountErrorMessage() as String as String as NSString?
        }
        else if (totalEnteredAmount >= 5000) {
            errorMessage=GlobalSupportingClass.AmountErrorMessage() as String as String as NSString?
        }
        
        
        if let errorMsg = errorMessage{
            
            if (boardField.length<=0) {
                
                selectBoardTextField.errorMessage = errorMsg as String
                selectBoardTextField.errorLabel.textColor = .red
            }
            else if (conField.length<=0) {

                consumerNumberTextField.errorMessage = errorMsg as String
                consumerNumberTextField.errorLabel.textColor = .red
            }
                
            else if (amField.length<=0) {

                amountTextField.errorMessage = errorMsg as String
                amountTextField.errorLabel.textColor = .red
            
            }
            else if (totalEnteredAmount >= 5000) {
                
                amountTextField.errorMessage = errorMsg as String
                amountTextField.errorLabel.textColor = .red
            }

            
            
//             consumerNumberTextField.errorMessage = errorMsg as String
            
//            validateOperatorTextFieldWithText(selectoperator: errorMsg as String)
            
//            self.showAlertViewWithTitle("app.Alert".localize(), message: errorMsg as String, buttonTitle: "app.Retry".localize())
            return false;
        }
        return true
    }
    
      //MARK:- Button Actions
    
    @IBAction func proceedToPayButtonAction(_ sender: Any) {
        
        
//        validateOperatorTextFieldWithText(selectoperator: selectBoardTextField.text)
//        
//        validateConsumerNumTextFieldWithText(consumer: consumerNumberTextField.text)
        
        if validateAllFields(){
            
            let rechargedViewController = self.storyboard?.instantiateViewController(withIdentifier: "PayzAppViewController") as! PayzAppViewController
            
            rechargedViewController.totalAmountStr = amountTextField.text!
            
            self.navigationController?.pushViewController(rechargedViewController, animated: true)
            
        }
        
        
         placeHolderCode()
        
//        if(appDelegate.checkInternetConnectivity()){
//            
//            if validateAllFields(){
//                
//                if walletId != nil && userId != nil {
//                    
//                    print("success")
//                    
//                    //                sendMoneyToWalletService()
//                    
//                }
//                else {
//                    
//                    let alertController = UIAlertController(title: "app.Alert".localize(), message: "app.LoginAlert".localize(), preferredStyle: UIAlertControllerStyle.alert)
//                    
//                    
//                    let cancelAction = UIAlertAction(title: "app.Cancel".localize(), style: UIAlertActionStyle.cancel) { (result : UIAlertAction) -> Void in
//                        print("Cancel")
//                        
//                        
//                    }
//                    let okAction = UIAlertAction(title: "app.Ok".localize(), style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
//                        print("OK")
//                        
//                        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//                        
//                        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "LoginNav") as! UINavigationController
//                        //                    let navigationController = UINavigationController(rootViewController: viewController)
//                        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//                        appDelegate.window?.rootViewController = viewController
//                    }
//                    alertController.addAction(cancelAction)
//                    alertController.addAction(okAction)
//                    self.present(alertController, animated: true, completion: nil)
//                    
//                }
//                
//            }
//            
//        }
//        else {
//            
//            self.appDelegate.window?.makeToast(kNetworkStatusMessage, duration:kToastDuration, position:CSToastPositionCenter)
//            return
//            
//        }
        
    
    

        
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        
        
        self.navigationController?.popViewController(animated: true)

    }
    
   
    
    
}
