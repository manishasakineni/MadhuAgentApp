//
//  ElectricityViewController.swift
//  PayZan
//
//  Created by CalibrageMac02 on 13/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit
import AMPFloatingTextField

class ElectricityViewController: BaseViewController,UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    //MARK:- OutLets

    
    @IBOutlet weak var districtsFiled: AMPFloatingTextField!
    
    @IBOutlet weak var serviceNumField: AMPFloatingTextField!

    @IBOutlet weak var amountField: AMPFloatingTextField!
    
    @IBOutlet weak var payNowBtn: UIButton!
    
    @IBOutlet weak var offersView: UIView!
    
    @IBOutlet weak var distImg: UIImageView!
    
    
    @IBOutlet weak var headerImgHeight: NSLayoutConstraint!
    
    @IBOutlet weak var headerViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var districtFieldHeight: NSLayoutConstraint!
    
    @IBOutlet weak var serviceNoFieldHeight: NSLayoutConstraint!
    
    @IBOutlet weak var amountFiledHeight: NSLayoutConstraint!
    
    @IBOutlet weak var payBtnHeight: NSLayoutConstraint!
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var backLabel: UILabel!
    
    @IBOutlet weak var dropDownBtn: UIImageView!
    
    
    
    //MARK:- Variables

    
    var serviceController = ServiceController()
    
    var myPickerView : UIPickerView!
    
    var selectedTextField:Int!
    var pickerList = [String]()
    
    var toolBar = UIToolbar()
    
    var userId:String?
    var walletId:String?

    
    var pickerData = ["District1" , "District2" , "District3" , "District4"]
    
    var operatorList = [String]()
    
    var totalEnteredAmount:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        placeHolderCode()
        
        //MARK:- TextField Colors

        
//        districtsFiled.layer.borderWidth = 0.5
//        districtsFiled.layer.borderColor = UIColor.lightGray.cgColor
//        districtsFiled.layer.cornerRadius = 3
//        districtsFiled.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
//        
//        serviceNumField.layer.borderWidth = 0.5
//        serviceNumField.layer.borderColor = UIColor.lightGray.cgColor
//        serviceNumField.layer.cornerRadius = 3
//        serviceNumField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
//        
//        amountField.layer.borderWidth = 0.5
//        amountField.layer.borderColor = UIColor.lightGray.cgColor
//        amountField.layer.cornerRadius = 3
//        amountField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        
        serviceNumField.keyboardType = .numberPad
        amountField.maxLengthTextField = 7
        amountField.keyboardType = .numberPad
        
        districtsFiled.delegate = self
        amountField.delegate = self
        
        let five = PayZanServices.AgentType
        print(five.rawValue)
        
        
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
            
            districtFieldHeight.constant = 90
            districtsFiled.updateBorder()
            serviceNoFieldHeight.constant = 90
            amountFiledHeight.constant = 90
            payBtnHeight.constant = 60
            
            headerViewHeight.constant = 50
            
            districtsFiled.font = UIFont.systemFont(ofSize: 20)
            districtsFiled.placeholderFont = UIFont.systemFont(ofSize: 20)
            districtsFiled.titleFont = UIFont.systemFont(ofSize: 20)
            districtsFiled.errorLabel.font = UIFont.systemFont(ofSize: 14)
            
            serviceNumField.font = UIFont.systemFont(ofSize: 20)
            serviceNumField.placeholderFont = UIFont.systemFont(ofSize: 20)
            serviceNumField.titleFont = UIFont.systemFont(ofSize: 20)
            serviceNumField.errorLabel.font = UIFont.systemFont(ofSize: 14)
            
            amountField.font = UIFont.systemFont(ofSize: 20)
            amountField.placeholderFont = UIFont.systemFont(ofSize: 20)
            amountField.titleFont = UIFont.systemFont(ofSize: 20)
            amountField.errorLabel.font = UIFont.systemFont(ofSize: 14)
            
            payNowBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            
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
        
        
        districtsFiled.placeholder = "app.SelectDistrict".localize()
        districtsFiled.selectedTitle = "app.SelectDistrict".localize()
        districtsFiled.title = "app.SelectDistrict".localize()
        
        
        serviceNumField.placeholder = "app.ServiceNumber".localize()
        serviceNumField.selectedTitle = "app.ServiceNumber".localize()
        serviceNumField.title = "app.ServiceNumber".localize()
        
        amountField.placeholder = "app.Amount".localize()
        amountField.selectedTitle = "app.Amount".localize()
        amountField.title = "app.Amount".localize()
        
        amountField.maxLengthTextField = 7
        serviceNumField.setLeftPaddingPoints(4)
        districtsFiled.setLeftPaddingPoints(4)
        amountField.setLeftPaddingPoints(4)

        
        applySkyscannerTheme(textField: districtsFiled)
        applySkyscannerTheme(textField: serviceNumField)
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
//            districtsFiled.text = "No Boards"
//            districtsFiled.textColor = UIColor.red
//            districtsFiled.isUserInteractionEnabled = false
//            
//        }else {
        
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
        
        if(districtsFiled.text == "" && self.operatorList.count > 0){
            self.districtsFiled.text = self.operatorList[0]
        }

        
        districtsFiled.resignFirstResponder()
    }
    func cancelClick() {
        districtsFiled.resignFirstResponder()
    }
    
     //MARK:- TextFiled Delegate
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let newString = NSString(string: textField.text!).replacingCharacters(in: range, with: string)
        
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
        
        
        if textField == districtsFiled{
            
            pickerList.removeAll()
            
            self.pickUp(districtsFiled)
            
            pickerList = operatorList
            
            districtsFiled = textField as! AMPFloatingTextField
            
            districtsFiled.tag = 1
            
            myPickerView.reloadAllComponents()
            myPickerView.selectRow(0, inComponent: 0, animated: false)
            
            
        }
        else  if textField == serviceNumField {
            
            pickerList.removeAll()
            districtsFiled.tag = 2
            
        }
            
        else if textField == amountField {
            
            pickerList.removeAll()
            districtsFiled.tag = 3
            
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
            
            self.districtsFiled.text = operatorList[row]
            
        }
    }
    
    func getOperatorList(){
        
        if(appDelegate.checkInternetConnectivity()){
            
            let strUrl = electricityUrl
            
            
            serviceController.requestGETURL(strURL:strUrl, success:{(result) in
                DispatchQueue.main.async()
                    {
                        
                        let respVO:OperatorVo = Mapper().map(JSONObject: result)!
                        
                        
                        
                        let isActive = respVO.IsSuccess
                        
                        
                        
                        if(isActive == true){
                            
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
            
            self.districtsFiled.isUserInteractionEnabled = false
            appDelegate.window?.makeToast(kNetworkStatusMessage, duration:kToastDuration, position:CSToastPositionCenter)
            return
            
        }
    }
    
    
    func validateAllFields() -> Bool
    {
        districtsFiled.text=districtsFiled.text!.trimmingCharacters(in: CharacterSet.whitespaces)
        serviceNumField.text=serviceNumField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
        amountField.text = amountField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
        
        
                let dictField:NSString = districtsFiled.text! as NSString
                let serField:NSString = serviceNumField.text! as NSString
                let amField:NSString = amountField.text! as NSString
        
        if !(amountField.text?.isEmpty)! {
            
            totalEnteredAmount = Int(amountField.text!)!
            
        }
        
                var errorMessage:NSString?
        
                if (dictField.length<=0) {
                    errorMessage=GlobalSupportingClass.blankDistrictErrorMessage() as String as String as NSString?
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
            
            if (dictField.length<=0) {
                
                districtsFiled.errorMessage = errorMsg as String
                districtsFiled.errorLabel.textColor = .red
            }
            else if (serField.length<=0) {
                
                serviceNumField.errorMessage = errorMsg as String
                serviceNumField.errorLabel.textColor = .red
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
    
//    func validateAllFields() -> Bool
//    {
//        districtsFiled.text=districtsFiled.text!.trimmingCharacters(in: CharacterSet.whitespaces)
//        serviceNumField.text=serviceNumField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
//        amountField.text = amountField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
//        
//        
//        let dictField:NSString = districtsFiled.text! as NSString
//        let serField:NSString = serviceNumField.text! as NSString
//        let amField:NSString = amountField.text! as NSString
//        
//        
//        var errorMessage:NSString?
//        
//        if (dictField.length<=0) {
//            errorMessage=GlobalSupportingClass.blankDistrictErrorMessage() as String as String as NSString?
//        }
//        else if (serField.length<=0) {
//            errorMessage=GlobalSupportingClass.blankServiceNumberErrorMessage() as String as String as NSString?
//        }
//            
//        else if (amField.length<=0) {
//            errorMessage=GlobalSupportingClass.blankAmountErrorMessage() as String as String as NSString?
//        }
//        
//        
//        if let errorMsg = errorMessage{
//            
//            self.showAlertViewWithTitle("app.Alert".localize(), message: errorMsg as String, buttonTitle: "app.Retry".localize())
//            return false;
//        }
//        return true
//    }
    
    //MARK:- Button Actions

    
    @IBAction func backAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func searchAction(_ sender: Any) {
    }
    
    @IBAction func notificationAction(_ sender: Any) {
    }

    @IBAction func payNowAction(_ sender: Any) {
        
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
