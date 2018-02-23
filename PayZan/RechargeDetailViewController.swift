//
//  RechargeDetailViewController.swift
//  PayZan
//
//  Created by CalibrageMac02 on 12/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit
import ContactsUI

class RechargeDetailViewController: BaseViewController,UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate, CNContactPickerDelegate {
    
    //MARK:- OutLets


    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var offersView: UIView!
    
    @IBOutlet weak var postPaidView: UIView!
    
    @IBOutlet weak var prepaidView: UIView!
    
    @IBOutlet weak var mobileField: UITextField!
    
    @IBOutlet weak var networkField: UITextField!
    
    @IBOutlet weak var planField: UITextField!
    
    @IBOutlet weak var addressBookBtn: UIButton!
    
    @IBOutlet weak var changeNetworkBtn: UIButton!
    
    @IBOutlet weak var browsePlanBtn: UIButton!
    
    @IBOutlet weak var searchBtn: UIButton!
   
    @IBOutlet weak var notificationBtn: UIButton!
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    
    @IBOutlet weak var prepaidChecbox: UIButton!
    
    @IBOutlet weak var postpaidCheckbox: UIButton!
    
    @IBOutlet weak var rechargBtn: UIButton!
    
    @IBOutlet weak var headerImgHeight: NSLayoutConstraint!
    
    //MARK:- Variables

    
    var myPickerView : UIPickerView!
    
    var toolBar = UIToolbar()
    
    var pickerData = ["Hitesh Modi" , "Kirit Modi" , "Ganesh Modi" , "Paresh Modi"]
    
    var pickerData1 = ["madhu" , "babu" , "mani" , "naveen"]
    
    var pickerSample = Array<String>()
    
    var selectedTextField:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segmentControl.setTitle("app.TalktimeTopup".localize(), forSegmentAt: 0)
        segmentControl.setTitle("app.SpecialRecharge".localize(), forSegmentAt: 1)

        
//        self.tabBarController?.tabBar.isHidden = true
        
        mobileField.delegate = self
        
        networkField.delegate = self
        
        planField.delegate = self
        
        networkField.tag = 1
        planField.tag = 2
        
        //MARK:- TextField Colors

        
        mobileField.layer.borderWidth = 0.5
        mobileField.layer.borderColor = UIColor.lightGray.cgColor
        mobileField.layer.cornerRadius = 3
        mobileField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        
        networkField.layer.borderWidth = 0.5
        networkField.layer.borderColor = UIColor.lightGray.cgColor
        networkField.layer.cornerRadius = 3
        networkField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        
        planField.layer.borderWidth = 0.5
        planField.layer.borderColor = UIColor.lightGray.cgColor
        planField.layer.cornerRadius = 3
        planField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        
        planField.keyboardType = .decimalPad
        planField.maxLengthTextField = 7
        
        
        //MARK:- headerImgHeight For iphone and ipad

        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
            headerImgHeight.constant = 150
        }
        else {
            
            headerImgHeight.constant = 79
            
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        //        headerView.isHidden = false
        
//        self.tabBarController?.tabBar.isHidden = true
        
        super.viewDidAppear(true)
    }
    
    //MARK:- UIPickerView

    
    func pickUp(_ textField : UITextField){
        
       
        self.myPickerView = UIPickerView(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        self.myPickerView.delegate = self
        self.myPickerView.dataSource = self
        self.myPickerView.backgroundColor = UIColor.white
        textField.inputView = self.myPickerView
        
        // MARK:-ToolBar
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
        networkField.resignFirstResponder()
        planField.resignFirstResponder()
    }
    
  //  MARK:-cancelClick
    
    func cancelClick() {
        networkField.resignFirstResponder()
        planField.resignFirstResponder()
    }
    
    //MARK:- TextFiled Delegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        selectedTextField = textField.tag
        
        if textField == networkField{
            
            pickerSample = pickerData
            
            networkField.tag = 1
            
            self.pickUp(networkField)
            
            myPickerView.reloadAllComponents()
            myPickerView.selectRow(0, inComponent: 0, animated: false)
            
            
        }
            
        else if textField == planField {
            
            pickerSample = pickerData1
            
            planField.tag = 2
            
            self.pickUp(planField)
            
            myPickerView.reloadAllComponents()
            myPickerView.selectRow(0, inComponent: 0, animated: false)
        }
        
        
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        /// 1. replacementString is NOT empty means we are entering text or pasting text: perform the logic
        /// 2. replacementString is empty means we are deleting text: return true
        
        
        
        if textField == mobileField{
            
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
        
        if textField == planField{
            
            if string.characters.count > 0 {
                
                let currentCharacterCount = textField.text?.characters.count ?? 0
                if (range.length + range.location > currentCharacterCount){
                    return false
                }
                let newLength = currentCharacterCount + string.characters.count - range.length
                
                let allowedCharacters = CharacterSet.decimalDigits
                
                let unwantedStr = string.trimmingCharacters(in: allowedCharacters)
                
                return unwantedStr.characters.count == 0
                
            }
            
        }
        
        return true
    }
    
    //MARK:- PickerView Delegate & DataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return pickerSample.count
        
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
       
        return pickerSample[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        if (selectedTextField == 1){
            
            self.networkField.text = pickerSample[row]
            
        }else if(selectedTextField == 2){
            
            self.planField.text = pickerSample[row]
        }
        
    }
    
    //MARK:- validateAllFields
    
    
    func validateAllFields() -> Bool
    {
        mobileField.text=mobileField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
        networkField.text=networkField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
        planField.text=planField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
        
        
        let mnumb:NSString = mobileField.text! as NSString
        let nField:NSString = networkField.text! as NSString
        let amountField:NSString = planField.text! as NSString
        
        
        var errorMessage:NSString?
        
        if (mnumb.length<=0) {
            errorMessage=GlobalSupportingClass.blankPhoneNumberErrorMessage() as String as String as NSString?
        }
        else if (mnumb.length<=9) {
            errorMessage=GlobalSupportingClass.invalidPhoneNumberErrorMessage() as String as String as NSString?
        }
            
        else if (nField.length<=0) {
            errorMessage=GlobalSupportingClass.blankNetworkErrorMessage() as String as String as NSString?
        }
        else if (amountField.length<=0) {
            errorMessage=GlobalSupportingClass.blankAmountErrorMessage() as String as String as NSString?
        }
        
        
        if let errorMsg = errorMessage{
            
            self.showAlertViewWithTitle("app.Alert".localize(), message: errorMsg as String, buttonTitle: "app.Retry".localize())
            return false;
        }
        return true
    }
    
    //MARK:- Button Actions
    
    @IBAction func rechargeAction(_ sender: Any) {
        
        if(appDelegate.checkInternetConnectivity()){
            
            if validateAllFields(){
                
                let rechargedViewController = self.storyboard?.instantiateViewController(withIdentifier: "PayzAppViewController") as! PayzAppViewController
                
               
                
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
           // postPaidView.isHidden = true
            prepaidView.isHidden = false
        case 1:
          //  postPaidView.isHidden = false
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
            
            postpaidCheckbox.isSelected = false
        }
        else
        {
            postpaidCheckbox.setBackgroundImage(UIImage(named: "selectedBox"), for: UIControlState.normal)
            prepaidChecbox.setBackgroundImage(UIImage(named: "unselectedBox"), for: UIControlState.normal)
            
            
            postpaidCheckbox.isSelected = true
        }
        
    }
    
    @IBAction func postpiadChecboxAction(_ sender: UIButton) {
        
        
        if (postpaidCheckbox.isSelected == true)
        {
            postpaidCheckbox.setBackgroundImage(UIImage(named: "unselectedBox"), for: UIControlState.normal)
            prepaidChecbox.setBackgroundImage(UIImage(named: "selectedBox"), for: UIControlState.normal)
            
            postpaidCheckbox.isSelected = false
        }
        else
        {
            postpaidCheckbox.setBackgroundImage(UIImage(named: "selectedBox"), for: UIControlState.normal)
            prepaidChecbox.setBackgroundImage(UIImage(named: "unselectedBox"), for: UIControlState.normal)
            
            
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
    
    @available(iOS 9.0, *)
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contacts: [CNContact]) {
        contacts.forEach { contact in
            for number in contact.phoneNumbers {
                let phoneNumber = number.value
                print("number is = \(phoneNumber)")
                
                mobileField.text = phoneNumber.stringValue
                
                
            }
            
            if #available(iOS 9.0, *) {
                let cnContacts = [CNContact]()
                for contact in cnContacts {
                    let fullName = CNContactFormatter.string(from: contact, style: .fullName) ?? "No Name"
                    print("\(fullName): \(contact.phoneNumbers.description)")
                }
            } else {
                // Fallback on earlier versions
            }
            
            
        }
    }

    


}


