//
//  DTHViewController.swift
//  PayZan
//
//  Created by CalibrageMac02 on 13/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit
import AMPFloatingTextField

class DTHViewController: BaseViewController,UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    //MARK:- OutLets

    
    @IBOutlet weak var subsriberIdField: AMPFloatingTextField!
    
//    @IBOutlet weak var subField: AkiraTextField!
    
    @IBOutlet weak var operatorField: AMPFloatingTextField!

    @IBOutlet weak var amountField: AMPFloatingTextField!
    
    @IBOutlet weak var rechargeBtn: UIButton!
    
    @IBOutlet weak var offersView: UIView!
    
    
    @IBOutlet weak var headerImgHeight: NSLayoutConstraint!
    
    @IBOutlet weak var headerViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var subscriberFiledHeight: NSLayoutConstraint!
    
    @IBOutlet weak var operatorFiledHeight: NSLayoutConstraint!
    
    @IBOutlet weak var amountFiledHeight: NSLayoutConstraint!
    
    @IBOutlet weak var payBtnHeight: NSLayoutConstraint!
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var backLabel: UILabel!
    
    @IBOutlet weak var dropDownImg: UIImageView!
    
    @IBOutlet weak var browseBtn: UIButton!
    
    let serviceController = ServiceController()

    
    //MARK:- Variables

    var myPickerView : UIPickerView!
    
    var toolBar = UIToolbar()
    
    var userId:String?
    var walletId:String?
    
    var selectedTextField:Int!
    var pickerList = [String]()
    
    
    var pickerData = ["Operator1" , "Operator2" , "Operator3" , "Operator4"]
    
    
   var operatorList = [String]()
    
    var totalEnteredAmount:Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        placeHolderCode()
        
        //MARK:- TextField Colors

        
//        subsriberIdField.layer.borderWidth = 0.5
//        subsriberIdField.layer.borderColor = UIColor.lightGray.cgColor
//        subsriberIdField.layer.cornerRadius = 3
//        subsriberIdField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        
//        operatorField.layer.borderWidth = 0.5
//        operatorField.layer.borderColor = UIColor.lightGray.cgColor
//        operatorField.layer.cornerRadius = 3
//        operatorField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
//        
//        amountField.layer.borderWidth = 0.5
//        amountField.layer.borderColor = UIColor.lightGray.cgColor
//        amountField.layer.cornerRadius = 3
//        amountField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        
        operatorField.delegate = self
        
        amountField.delegate = self
        
        amountField.keyboardType = .numberPad
        
        amountField.maxLengthTextField = 7
        subsriberIdField.maxLengthTextField = 40
        
        subsriberIdField.setLeftPaddingPoints(4)
        operatorField.setLeftPaddingPoints(4)
        amountField.setLeftPaddingPoints(4)
        
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
            
            subscriberFiledHeight.constant = 90
            subsriberIdField.updateBorder()
            operatorFiledHeight.constant = 90
            amountFiledHeight.constant = 90
            payBtnHeight.constant = 60
            
            headerViewHeight.constant = 50
            
            subsriberIdField.font = UIFont.systemFont(ofSize: 20)
            subsriberIdField.placeholderFont = UIFont.systemFont(ofSize: 20)
            subsriberIdField.titleFont = UIFont.systemFont(ofSize: 20)
            subsriberIdField.errorLabel.font = UIFont.systemFont(ofSize: 14)
            
            operatorField.font = UIFont.systemFont(ofSize: 20)
            operatorField.placeholderFont = UIFont.systemFont(ofSize: 20)
            operatorField.titleFont = UIFont.systemFont(ofSize: 20)
            operatorField.errorLabel.font = UIFont.systemFont(ofSize: 14)
            
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
        
        
        subsriberIdField.placeholder = "app.SubscriberID".localize()
        subsriberIdField.selectedTitle = "app.SubscriberID".localize()
        subsriberIdField.title = "app.SubscriberID".localize()
        
        
        operatorField.placeholder = "app.SelectOperator".localize()
        operatorField.selectedTitle = "app.SelectOperator".localize()
        operatorField.title = "app.SelectOperator".localize()
        
        amountField.placeholder = "app.Amount".localize()
        amountField.selectedTitle = "app.Amount".localize()
        amountField.title = "app.Amount".localize()
        
        amountField.maxLengthTextField = 7
        
        applySkyscannerTheme(textField: subsriberIdField)
        applySkyscannerTheme(textField: operatorField)
        applySkyscannerTheme(textField: amountField)
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
//            operatorField.text = "No Operators"
//            operatorField.textColor = UIColor.red
//            operatorField.isUserInteractionEnabled = false
//            
//        }else {
//            operatorField.isUserInteractionEnabled = true
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
        if(operatorField.text == "" && self.operatorList.count > 0){
            self.operatorField.text = self.operatorList[0]
        }
        operatorField.resignFirstResponder()
    }
    func cancelClick() {
        operatorField.resignFirstResponder()
    }
    
    //MARK:- TextFiled Delegate
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
//        let newString = NSString(string: textField.text!).replacingCharacters(in: range, with: string)
        
        if(textField==self.amountField&&range.location==0)
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
        
         if textField == subsriberIdField {
            
            pickerList.removeAll()
            operatorField.tag = 2
            
        }
        else if textField == operatorField{
            
            pickerList.removeAll()
            
            self.pickUp(operatorField)
            
            pickerList = operatorList
            
            operatorField = textField as! AMPFloatingTextField
            
            operatorField.tag = 1
            
            myPickerView.reloadAllComponents()
            myPickerView.selectRow(0, inComponent: 0, animated: false)
            
            
        }
            
        else if textField == amountField {
            
            pickerList.removeAll()
            operatorField.tag = 3
            
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
        self.operatorField.text = operatorList[row]
        }
    }
    
    func getOperatorList(){
        
        if(appDelegate.checkInternetConnectivity()){
        
        let strUrl = dthUrl
        
        
        serviceController.requestGETURL(strURL:strUrl, success:{(result) in
            DispatchQueue.main.async()
                {
                    
                    let respVO:OperatorVo = Mapper().map(JSONObject: result)!
                    
                    
                    
                    let isActive = respVO.IsSuccess
                    
                    
//                    let status = result["status"] as! String
                    
                    if(isActive == true){
                        
                        let operatorObj = respVO.ListResult
                        
                        
                        for(_,element) in (operatorObj?.enumerated())! {
                            
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
    
    func validateAllFields() -> Bool
    {
        subsriberIdField.text=subsriberIdField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
        operatorField.text=operatorField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
        amountField.text = amountField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
        
        
        let subbField:NSString = subsriberIdField.text! as NSString
        let operField:NSString = operatorField.text! as NSString
        let amField:NSString = amountField.text! as NSString
        
        if !(amountField.text?.isEmpty)! {
            
            totalEnteredAmount = Int(amountField.text!)!
            
        }
        
        
        
        var errorMessage:NSString?
        
        if (subbField.length<=0) {
            errorMessage=GlobalSupportingClass.blankSubscriberErrorMessage() as String as String as NSString?
        }
        else if (operField.length<=0) {
            errorMessage=GlobalSupportingClass.blankOperatorErrorMessage() as String as String as NSString?
        }
        else if (amField.length<=0) {
            errorMessage=GlobalSupportingClass.blankAmountErrorMessage() as String as String as NSString?
        }
        else if (totalEnteredAmount >= 5000) {
            errorMessage=GlobalSupportingClass.AmountErrorMessage() as String as String as NSString?
        }
        
        
        if let errorMsg = errorMessage{
            
            if (subbField.length<=0) {
                
                subsriberIdField.errorMessage = errorMsg as String
                subsriberIdField.errorLabel.textColor = .red
            }
            else if (operField.length<=0) {
                
                operatorField.errorMessage = errorMsg as String
                operatorField.errorLabel.textColor = .red
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
        
//        if let errorMsg = errorMessage{
//            
//            self.showAlertViewWithTitle("app.Alert".localize(), message: errorMsg as String, buttonTitle: "app.Retry".localize())
//            return false;
//        }
        return true
    }
    
    //MARK:- Button Actions

    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func searchAction(_ sender: Any) {
    }
    
    @IBAction func notificationAction(_ sender: Any) {
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

        

    
    

}