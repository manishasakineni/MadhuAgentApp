//
//  RechargeViewController.swift
//  PayZan
//
//  Created by CalibrageMac02 on 11/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit
import ContactsUI
import AMPFloatingTextField

class RechargeViewController: BaseViewController,UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate, CNContactPickerDelegate {
    
    //MARK:- OutLets
 

    @IBOutlet weak var backArrowOutLet: NSLayoutConstraint!
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var offersView: UIView!
    
    @IBOutlet weak var postPaidView: UIView!
    
    @IBOutlet weak var prepaidView: UIView!
    
    @IBOutlet weak var mobileField: AMPFloatingTextField!
    
    @IBOutlet weak var networkField: AMPFloatingTextField!
    
    @IBOutlet weak var planField: AMPFloatingTextField!
    
    @IBOutlet weak var addressBookBtn: UIButton!
    
    @IBOutlet weak var changeNetworkBtn: UIButton!
    
    @IBOutlet weak var browsePlanBtn: UIButton!
    
    @IBOutlet weak var searchAction: UIButton!
    
    @IBOutlet weak var notificationAction: UIButton!
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBOutlet weak var prepaidLabel: UILabel!
    
    @IBOutlet weak var postPaidLabel: UILabel!
    
    @IBOutlet weak var prepaidChecbox: UIButton!
    
    @IBOutlet weak var postpaidCheckbox: UIButton!
    
    @IBOutlet weak var rechargeBtn: UIButton!
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var backLabel: UILabel!
    
    @IBOutlet weak var updatesBtn: UIButton!
    
    @IBOutlet weak var browseBtn: UIButton!
    
    @IBOutlet weak var headerImgHeight: NSLayoutConstraint!
    
    @IBOutlet weak var mobileHeight: NSLayoutConstraint!
    
    @IBOutlet weak var networkHeight: NSLayoutConstraint!
    
    @IBOutlet weak var amountHeight: NSLayoutConstraint!
    
    @IBOutlet weak var segmentHeight: NSLayoutConstraint!
    
    @IBOutlet weak var payBtnHeight: NSLayoutConstraint!
    
    
    @IBOutlet weak var offerLblHeight: NSLayoutConstraint!
    
    @IBOutlet weak var contactsBtnHeight: NSLayoutConstraint!
    
    @IBOutlet weak var contactsBtnWidth: NSLayoutConstraint!
    
    @IBOutlet weak var headerViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var headerLbleHeight: NSLayoutConstraint!
    
    @IBOutlet weak var backBtnHeight: NSLayoutConstraint!
    
    @IBOutlet weak var bellBtnHeight: NSLayoutConstraint!
    
    @IBOutlet weak var bellBtnWidth: NSLayoutConstraint!
    
    @IBOutlet weak var prepaidCheckboxHeight: NSLayoutConstraint!
    
    @IBOutlet weak var prepaidCheckBoxWidth: NSLayoutConstraint!
    
    @IBOutlet weak var prepaidLblWidth: NSLayoutConstraint!
    
    @IBOutlet weak var prepaidLblHeight: NSLayoutConstraint!
    
    @IBOutlet weak var postPaidCheckHeight: NSLayoutConstraint!
    
    @IBOutlet weak var postPaidCheckWidth: NSLayoutConstraint!
    
    @IBOutlet weak var postPiadLblWidth: NSLayoutConstraint!
    
    @IBOutlet weak var postPaidLblHeight: NSLayoutConstraint!
    
    @IBOutlet weak var updateOperatorHeight: NSLayoutConstraint!
    
    @IBOutlet weak var updateOperatorWidth: NSLayoutConstraint!
    
    @IBOutlet weak var browseHeight: NSLayoutConstraint!
    
    @IBOutlet weak var browseWidth: NSLayoutConstraint!
    
    //MARK:- Variables

    
    var serviceController = ServiceController()
    
    var operatorList = [String]()
    
    var pickerList = [String]()
    
    var myPickerView : UIPickerView!
    
     var toolBar = UIToolbar()
    
    var pickerData = ["Network1" , "Network2" , "Network3" , "Network3"]
    
    var pickerData1 = ["Plan1" , "Plan2" , "Plan3" , "Plan4"]
    
    var pickerSample = Array<String>()
    
    
    var selectedTextField:Int!
    
    var lblRight = UILabel()
    
    var totalEnteredAmount:Int = 0
    
    var numeroADiscar: String = ""
    var userImage: UIImage? = nil
    var nameToSave = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
       
        
        addressBookBtn.isHidden = true
        
        placeHolderCode()
        
        let mbutton = UIButton(type: .custom)
        mbutton.setImage(UIImage(named: "prepaid_contacts_icon"), for: .normal)
        mbutton.imageEdgeInsets = UIEdgeInsetsMake(0, -16, 0, 0)
        mbutton.frame = CGRect(x: CGFloat(mobileField.frame.size.width - 25), y: CGFloat(5), width: CGFloat(20), height: CGFloat(25))
        mbutton.addTarget(self, action: #selector(self.mobileFieldBtnAction), for: .touchUpInside)
        mobileField.rightView = mbutton
        mobileField.rightViewMode = .always
        
        
        let planButton = UIButton(type: .roundedRect)
        planButton.setTitle("app.BrowsePlans".localize(), for: .normal)
        planButton.frame = CGRect(x: CGFloat(0), y: CGFloat(5), width: CGFloat(80), height: CGFloat(30))
        planButton.setTitleColor(#colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1), for: .normal)
        planButton.addTarget(self, action: #selector(self.browseBtnAction), for: .touchUpInside)
        planButton.titleLabel?.font = planButton.titleLabel?.font.withSize(10)
        planField.rightView = planButton
        planField.rightViewMode = .always
        
        segmentControl.setTitle("app.TalktimeTopup".localize(), forSegmentAt: 0)
        segmentControl.setTitle("app.SpecialRecharge".localize(), forSegmentAt: 1)
        
        
        networkField.delegate = self
        mobileField.delegate = self
        planField.delegate = self

        
        //MARK:- TextField Colors
        
        
        mobileField.keyboardType = .phonePad
        mobileField.maxLengthTextField = 13
        planField.maxLengthTextField = 7
        planField.keyboardType = .numberPad
        
        planField.setLeftPaddingPoints(4)
        mobileField.setLeftPaddingPoints(4)
        networkField.setLeftPaddingPoints(4)
        
        
        networkField.tag = 1
        planField.tag = 2
        
        getPrepaidList()
        getPostpaidList()
        //MARK:- headerImgHeight For iphone and ipad

        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
            headerImgHeight.constant = 150
            
            mobileHeight.constant = 90
            mobileField.updateBorder()
            networkHeight.constant = 90
            amountHeight.constant = 90
            segmentHeight.constant = 50
            payBtnHeight.constant = 60
            contactsBtnHeight.constant = 60
            contactsBtnWidth.constant = 60
            
            headerViewHeight.constant = 50
            browseHeight.constant = 30
            browseWidth.constant = 50
            
            mobileField.font = UIFont.systemFont(ofSize: 20)
            mobileField.placeholderFont = UIFont.systemFont(ofSize: 20)
            mobileField.titleFont = UIFont.systemFont(ofSize: 20)
            mobileField.errorLabel.font = UIFont.systemFont(ofSize: 14)
            
            networkField.font = UIFont.systemFont(ofSize: 20)
            networkField.placeholderFont = UIFont.systemFont(ofSize: 20)
            networkField.titleFont = UIFont.systemFont(ofSize: 20)
            networkField.errorLabel.font = UIFont.systemFont(ofSize: 14)
            
            networkField.font = UIFont.systemFont(ofSize: 20)
            networkField.placeholderFont = UIFont.systemFont(ofSize: 20)
            networkField.titleFont = UIFont.systemFont(ofSize: 20)
            networkField.errorLabel.font = UIFont.systemFont(ofSize: 14)
            
            planField.font = UIFont.systemFont(ofSize: 20)
            planField.placeholderFont = UIFont.systemFont(ofSize: 20)
            planField.titleFont = UIFont.systemFont(ofSize: 20)
            planField.errorLabel.font = UIFont.systemFont(ofSize: 14)
            
            rechargeBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            
            backLabel.font = UIFont.systemFont(ofSize: 17)
            
            browseBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
            
            let font = UIFont.systemFont(ofSize: 18)
            segmentControl.setTitleTextAttributes([NSFontAttributeName: font],
                                                  for: .normal)
            
        }
        else {
            
            headerImgHeight.constant = 79
            
            backLabel.font = UIFont.systemFont(ofSize: 11)
            
         planField.errorLabel.font = UIFont.systemFont(ofSize: 10)
            mobileField.errorLabel.font = UIFont.systemFont(ofSize: 10)
            
            networkField.errorLabel.font = UIFont.systemFont(ofSize: 10)
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(true)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.isHidden = true
        
    }
    
    func placeHolderCode(){
        
        // textfield effect
        
        
        
        mobileField.placeholder = "app.MobileNumber".localize()
        mobileField.selectedTitle = "app.MobileNumber".localize()
        mobileField.title = "app.MobileNumber".localize()
        
        
        networkField.placeholder = "app.SelectNetwork".localize()
        networkField.selectedTitle = "app.SelectNetwork".localize()
        networkField.title = "app.SelectNetwork".localize()
        
        planField.placeholder = "app.Amount".localize()
        planField.selectedTitle = "app.Amount".localize()
        planField.title = "app.Amount".localize()
        

                
        applySkyscannerTheme(textField: mobileField)
        applySkyscannerTheme(textField: networkField)
        applySkyscannerTheme(textField: planField)
    }
    
    @IBAction func browseBtnAction(_ sender: Any) {
        
        print("clicked")
    }
    
    @IBAction func mobileFieldBtnAction(_ sender: Any) {
        
        if #available(iOS 9.0, *) {
            let cnPicker = CNContactPickerViewController()
            
            cnPicker.delegate = self
            self.present(cnPicker, animated: true, completion: nil)
            
        } else {
            
            
        }
    }
    
    func applySkyscannerTheme(textField: AMPFloatingTextField) {
        
        textField.tintColor = .black
        
        textField.textColor = .black
        textField.errorLabel.textColor = .red
        textField.updateBorder()
        
        textField.rightView?.isHidden = true
        textField.errorBackGroundColor = UIColor.lightGray.withAlphaComponent(0.1)
        textField.placeholderColor = UIColor.lightGray
        textField.lineColor = UIColor.white
        textField.selectedTitleColor = #colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1)
        
                textField.titleLabel.font = UIFont.systemFont(ofSize: 12)
                textField.placeholderFont = UIFont.systemFont(ofSize: 12)
    }
    
    func validateAllFields() -> Bool
    {
        mobileField.text=mobileField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
        networkField.text=networkField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
        planField.text = planField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
        
        
        let phoneField:NSString = mobileField.text! as NSString
        let nwField:NSString = networkField.text! as NSString
        let amField:NSString = planField.text! as NSString
        
        if !(planField.text?.isEmpty)! {
            
            totalEnteredAmount = Int(planField.text!)!
            
        }

        
        var errorMessage:NSString?
        
        if (phoneField.length<=0) {
            errorMessage=GlobalSupportingClass.blankPhoneNumberErrorMessage() as String as String as NSString?
            
        }
        else if (phoneField.length<=9) {
            errorMessage=GlobalSupportingClass.invalidPhoneNumberErrorMessage() as String as String as NSString?
        }
        else if (nwField.length<=0) {
            errorMessage=GlobalSupportingClass.blankNetworkErrorMessage() as String as String as NSString?
        }
            
        else if (amField.length<=0) {
            errorMessage=GlobalSupportingClass.blankAmountErrorMessage() as String as String as NSString?
        }
        else if (totalEnteredAmount >= 5000) {
            errorMessage=GlobalSupportingClass.AmountErrorMessage() as String as String as NSString?
        }
        
        
        if let errorMsg = errorMessage{
            
            if (phoneField.length<=0) {
                
                mobileField.errorMessage = errorMsg as String
                
                mobileField.errorLabel.textColor = .red
                
            }
            else if (phoneField.length<=9) {
                
                mobileField.errorMessage = errorMsg as String
                mobileField.errorLabel.textColor = .red
            }
            else if (nwField.length<=0) {
                
                networkField.errorMessage = errorMsg as String
                networkField.errorLabel.textColor = .red
            }
                
            else if (amField.length<=0) {
                
                planField.errorMessage = errorMsg as String
                planField.errorLabel.textColor = .red
            }
            else if (totalEnteredAmount >= 5000) {
                
                planField.errorMessage = errorMsg as String
                planField.errorLabel.textColor = .red
            }
            
            
            
            
            return false;
        }
        return true
    }
    
    @IBAction func textChangeAction(_ textField: UITextField) {
        
        
        
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
        if(networkField.text == "" && self.operatorList.count > 0){
            self.networkField.text = self.operatorList[0] 
        }
       
        networkField.resignFirstResponder()
        planField.resignFirstResponder()
    }
    
    //MARK:- cancelClick
    
    func cancelClick() {
        networkField.resignFirstResponder()
        planField.resignFirstResponder()
    }
    
    //MARK:- TextFiled Delegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        self.currentjumpOrder = textField.jumpOrder

        selectedTextField = textField.tag
        
        planField.errorLabel.textColor = .red
        
        networkField.errorLabel.textColor = .red
        
        mobileField.errorLabel.textColor = .red
        
        if textField == networkField{
            
            pickerList.removeAll()
            
            self.pickUp(networkField)
            
            pickerList = operatorList
            
            networkField = textField as! AMPFloatingTextField
            
            networkField.tag = 1
            
            myPickerView.reloadAllComponents()
            myPickerView.selectRow(0, inComponent: 0, animated: false)

        
        }
        else  if textField == mobileField {
            
            pickerList.removeAll()
            networkField.tag = 2
            
        }
            
        else if textField == planField {
            
            pickerList.removeAll()
            networkField.tag = 3
            
        }
        
        
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        planField.errorLabel.textColor = .red
        
        networkField.errorLabel.textColor = .red
        
        mobileField.errorLabel.textColor = .red
        
        if textField == planField {
            
            if !string.canBeConverted(to: String.Encoding.ascii){
                return false
            }
            
        }
        
        
        if(textField==self.planField&&range.location==0)
        {
            if (string.hasPrefix("0") || string.hasPrefix("."))
            {
                return false
            }
        }
        
        if textField == mobileField{
            
            if string.characters.count > 0 {
                
                let currentCharacterCount = textField.text?.characters.count ?? 0
                if (range.length + range.location > currentCharacterCount){
                    return false
                }
                let newLength = currentCharacterCount + string.characters.count - range.length
                
                let allowedCharacters = CharacterSet.decimalDigits
                
                let unwantedStr = string.trimmingCharacters(in: allowedCharacters)
                
                return newLength <= 10 && unwantedStr.characters.count == 0
                
            }
            
        }
        
        
        return true
    }

    
    //MARK:- PickerView Delegate & DataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        
            return pickerList.count
            

    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
            return "\(pickerList[row])"
            
        
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
         if operatorList.count > row {
        
        self.networkField.text = pickerList[row]
            
        }
        
        
    }
    //MARK:- getPrepaidList
    
    func getPrepaidList(){
        
        if(appDelegate.checkInternetConnectivity()){
        
        let strUrl = prepaidUrl
        
        
        serviceController.requestGETURL(strURL:strUrl, success:{(result) in
            DispatchQueue.main.async()
                {
                    
                    let respVO:OperatorVo = Mapper().map(JSONObject: result)!
                    
                    let isActive = respVO.IsSuccess
                    
                    
                    if(isActive == true){
                        
                        let operatorObj = respVO.ListResult
                        
                        self.operatorList.removeAll()
                        
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
            self.networkField.isUserInteractionEnabled = false
            appDelegate.window?.makeToast(kNetworkStatusMessage, duration:kToastDuration, position:CSToastPositionCenter)
            return
        }
        
    }
    
    //MARK:- getPostpaidList
    
    func getPostpaidList(){
        
        if(appDelegate.checkInternetConnectivity()){
        
        let strUrl = postpaidUrl
        
        
        serviceController.requestGETURL(strURL:strUrl, success:{(result) in
            DispatchQueue.main.async()
                {
                    
                    let respVO:OperatorVo = Mapper().map(JSONObject: result)!
                    
                    
                    let isActive = respVO.IsSuccess
                    
                    
                    
                    if(isActive == true){
                        
                        let operatorObj = respVO.ListResult
                        
                        self.operatorList.removeAll()
                        
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
             self.networkField.isUserInteractionEnabled = false
            appDelegate.window?.makeToast(kNetworkStatusMessage, duration:kToastDuration, position:CSToastPositionCenter)
            return
        }
    }
    
    //MARK:- validateAllFields
    
    
    
    //MARK:- Button Actions
    
    @IBAction func rechargeAction(_ sender: Any) {
        
        
            
            if(appDelegate.checkInternetConnectivity()){
                
                if validateAllFields(){
                    
            let rechargedViewController = self.storyboard?.instantiateViewController(withIdentifier: "PayzAppViewController") as! PayzAppViewController
                    
                rechargedViewController.totalAmountStr = planField.text!
                    
            self.navigationController?.pushViewController(rechargedViewController, animated: true)
                
                    
                }
            }
            else {
                
                self.appDelegate.window?.makeToast(kNetworkStatusMessage, duration:kToastDuration, position:CSToastPositionCenter)
                return
                
            }
        
       

    }

    @IBAction func indexChage(_ sender: Any) {
        
        switch segmentControl.selectedSegmentIndex {
        case 0:
            prepaidView.isHidden = false
        case 1:
            prepaidView.isHidden = false
        default:
            break;
        }
        
    }
    @IBAction func backAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
   
    @IBAction func searchBtnAction(_ sender: Any) {
        
       
        
    }
    
    @IBAction func notificationBtnAction(_ sender: Any) {
        
        
    }
    
    @IBAction func prepaidCheckboxAction(_ sender: UIButton) {
        

        if (postpaidCheckbox.isSelected == true)
        {
            postpaidCheckbox.setBackgroundImage(UIImage(named: "unselectedBox"), for: UIControlState.normal)
            prepaidChecbox.setBackgroundImage(UIImage(named: "selectedBox"), for: UIControlState.normal)
            getPrepaidList()
            postpaidCheckbox.isSelected = false
        }
        else
        {
            postpaidCheckbox.setBackgroundImage(UIImage(named: "selectedBox"), for: UIControlState.normal)
            prepaidChecbox.setBackgroundImage(UIImage(named: "unselectedBox"), for: UIControlState.normal)
            
            getPostpaidList()
            postpaidCheckbox.isSelected = true
        }
        
    }
    
    @IBAction func postpiadChecboxAction(_ sender: UIButton) {
        
        
        if (postpaidCheckbox.isSelected == true)
        {
            postpaidCheckbox.setBackgroundImage(UIImage(named: "unselectedBox"), for: UIControlState.normal)
            prepaidChecbox.setBackgroundImage(UIImage(named: "selectedBox"), for: UIControlState.normal)
            getPrepaidList()
            postpaidCheckbox.isSelected = false
        }
        else
        {
            postpaidCheckbox.setBackgroundImage(UIImage(named: "selectedBox"), for: UIControlState.normal)
            prepaidChecbox.setBackgroundImage(UIImage(named: "unselectedBox"), for: UIControlState.normal)

            getPostpaidList()
            postpaidCheckbox.isSelected = true
        }

    }
    
    @IBAction func changeNetworkAction(_ sender: UIButton) {
        
        

        
    }
    
    @IBAction func browsePlanAction(_ sender: Any) {
                
    }
    
    
    
      @IBAction func phoneBookAction(_ sender: Any) {
        
        
        if #available(iOS 9.0, *) {
            let cnPicker = CNContactPickerViewController()
            cnPicker.delegate = self
            self.present(cnPicker, animated: true, completion: nil)
        } else {
            // Fallback on earlier versions
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
                        
        mobileField.text = last10!
        
        
    }
    


}


