//
//  AddNewAddressViewController.swift
//  PayZan
//
//  Created by Manoj on 28/12/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit

class AddNewAddressViewController: BaseViewController,UITableViewDelegate, UITableViewDataSource,UIPickerViewDelegate, UIPickerViewDataSource,UITextFieldDelegate {
    
    @IBOutlet weak var addNewAddressTableView: UITableView!
    
    @IBOutlet weak var saveBtn: UIButton!
    
    @IBOutlet weak var headerImgHeight: NSLayoutConstraint!
    
    @IBOutlet weak var headerViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var addBtnHeight: NSLayoutConstraint!
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var backLabel: UILabel!
    
    var myPickerView = UIPickerView()
    
    var toolBar = UIToolbar()
    var activeTextField = UITextField()
    var pickerData : Array<String> = Array()
    

    var section1TitleArray = ["Name","AddressLine1","AddressLine2","LandMark","Mobile Number","Select Province","Select District","Select Mandal","Select Village","Select Pin Code"]
    
    var name    : String = ""
    var address1  : String = ""
    var address2     : String = ""
    var landmark       : String = ""
    var mobileNo   : String = ""
    var pinCode : String = ""
    var idd : Int = 0
    
    
    var addressResultListArr:[AddressUpdateResultVo]?
    
    var provinceListArr = Array<String>()
    //    var provinceIDArray = Array<Int>()
    var provinceIDArray:[AgentReqResultVo]?
    var districtIDArray:[AgentDistrictResultVo]?
    var mandalIDArray:[AgentMandalResultVo]?
    var villageIDArray:[AgentVillageResultVo]?
     var postalCodeAry = Array<String>()
    
    var districtsAry = Array<String>()
    var mandalsAry = Array<String>()
    var villagesAry = Array<String>()
    
    
    
    var selectedProvinceStr = ""
    var selectedDistrictStr = ""
    var selectedMandalStr   = ""
    var selectedVillageStr  = ""
    
    var provinceID     : Int    = 0
    var districtID     : Int    = 0
    var mandalID       : Int    = 0
    var villageID       : Int    = 0
    
    var userId:String? = ""
    
    var addressId:String = ""
    
    var saveBtnStr:String = "app.AddAddress".localize()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        self.saveBtn.setTitle(self.saveBtnStr,for: .normal)
        
        addNewAddressTableView.delegate = self
        addNewAddressTableView.dataSource = self
        
        section1TitleArray = ["app.SName".localize(value: "SName"),"app.AdsLine1".localize(value: "AdsLine1"),"app.AdsLine2".localize(value: "AdsLine2"),"app.LandMark".localize(value: "LandMark"),"app.MobileNumber".localize(value: "Mobile Number"),"app.SelectProvince".localize(value: "Select Province"),"app.SelectMandal".localize(value: "Select Mandal"),"app.SelectDistrict".localize(value: "Select District"),"app.SelectVillage".localize(value: "Select Village"),"app.PinCode".localize(value: "Pin Code")]
        
        
        
        let defaults = UserDefaults.standard
        
        if let uId = defaults.string(forKey: userIDD) {
            
            userId = uId
            
            print("userId: \(String(describing: userId))")
        }
        
        registerTableViewCells()
        
        getProvinceList()
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
            headerImgHeight.constant = 150
            
            headerViewHeight.constant = 50
            
            addBtnHeight.constant = 60
            
            saveBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            
            backLabel.font = UIFont.systemFont(ofSize: 16)
        }
        else {
            
            headerImgHeight.constant = 79
            
            addBtnHeight.constant = 40
            
            backLabel.font = UIFont.systemFont(ofSize: 12)
            
        }
        
        // Do any additional setup after loading the view.
    }
    
    
    private func registerTableViewCells() {
        
        let nibName  = UINib(nibName: "AddNewAddressTableViewCell" , bundle: nil)
        addNewAddressTableView.register(nibName, forCellReuseIdentifier: "AddNewAddressTableViewCell")
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getAddressByAddressIdAPIService()
        
        self.tabBarController?.tabBar.isHidden = true
        
        section1TitleArray = ["app.SName".localize(value: "SName"),"app.AdsLine1".localize(value: "AdsLine1"),"app.AdsLine2".localize(value: "AdsLine2"),"app.LandMark".localize(value: "LandMark"),"app.MobileNumber".localize(value: "Mobile Number"),"app.SelectProvince".localize(value: "Select Province"),"app.SelectMandal".localize(value: "Select Mandal"),"app.SelectDistrict".localize(value: "Select District"),"app.SelectVillage".localize(value: "Select Village"),"app.PinCode".localize(value: "Pin Code")]
        
        addNewAddressTableView.reloadData()
        
        self.tabBarController?.tabBar.isHidden = true
   
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        
        activeTextField = textField
        
        if let newRegCell : EditTableViewCell = textField.superview?.superview as? EditTableViewCell {
            
//            if textField == newRegCell.addNewAddressTF {
//                
//                
//                if (newRegCell.addNewAddressTF.text != nil)  {
//                    
//                    newRegCell.addNewAddressLabel.isHidden = false
//                    newRegCell.addNewAddressLabel.textColor = UIColor(red: 128.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
//                    
//                }
//                    
//                else{
//                    
//                    newRegCell.addNewAddressLabel.isHidden = true
//                    
//                    
//                }
//            }
        }
        if textField.tag == 0{
            
            textField.clearButtonMode = .never
            textField.keyboardType = .default
            
        }
            
        else if textField.tag == 1 {
            
            textField.clearButtonMode = .never
            textField.keyboardType = .default
        }
            
        else if textField.tag == 2{
            
            textField.clearButtonMode = .never
            textField.keyboardType = .default
            
        }
            
        else if textField.tag == 3{
            
            textField.clearButtonMode = .never
            textField.keyboardType = .default
            
        }
            
        else if textField.tag == 4{
            
            textField.clearButtonMode = .never
            textField.keyboardType = .phonePad
            
             mobileNo = textField.text!
            
        }
        else if textField.tag == 5{
            
            textField.clearButtonMode = .never
            textField.inputView = myPickerView
            pickerData = provinceListArr
            self.pickUp(activeTextField)
            myPickerView.reloadAllComponents()
            myPickerView.selectRow(0, inComponent: 0, animated: false)
            
        }
            
            
        else if textField.tag == 6{
            
            textField.clearButtonMode = .never
            textField.inputView = myPickerView
            pickerData = districtsAry
            self.pickUp(activeTextField)
            myPickerView.reloadAllComponents()
            myPickerView.selectRow(0, inComponent: 0, animated: false)
        }
            
        else if textField.tag == 7{
            textField.clearButtonMode = .never
            textField.inputView = myPickerView
            pickerData = mandalsAry
            self.pickUp(activeTextField)
            myPickerView.reloadAllComponents()
            myPickerView.selectRow(0, inComponent: 0, animated: false)
            
        }
            
        else if textField.tag == 8{
            
            textField.clearButtonMode = .never
            textField.inputView = myPickerView
            pickerData = villagesAry
            self.pickUp(activeTextField)
            myPickerView.reloadAllComponents()
            myPickerView.selectRow(0, inComponent: 0, animated: false)
            
        }
        else if textField.tag == 9{
            
            textField.clearButtonMode = .never
            textField.keyboardType = .phonePad
            
        }
        
        
        
    }
    
    //MARK:- shouldChangeCharactersIn range
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == activeTextField {
        
            if !string.canBeConverted(to: String.Encoding.ascii){
                return false
            }
        
        }
        
    let newString = NSString(string: textField.text!).replacingCharacters(in: range, with: string)
        
        if newString == mobileNo{
            
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
        
        if textField.tag == 0{
            
//            do {
//                let regex = try NSRegularExpression(pattern: ".*[^A-Za-z ].*", options: [])
//                if regex.firstMatch(in: textField.text!, options: [], range: NSMakeRange(0, (textField.text?.characters.count)!)) != nil {
//                    
//                    self.showAlertViewWithTitle("app.Alert".localize(), message: "Must not contain Number in Name", buttonTitle: "app.Retry".localize())
////                    self.showAlert(message: "Must not contain Number in Name")
//                    
//                } else {
//                    
//                }
//            }
//            catch {
//                
//            }
            if string.characters.count > 0 {
                let allowedCharacters = CharacterSet.letters
                
                let unwantedStr = string.trimmingCharacters(in: allowedCharacters)
                let space = CharacterSet.init(charactersIn: " ")
                
                let spacestr = string.trimmingCharacters(in: space)
                
                return unwantedStr.characters.count == 0 ||  spacestr.characters.count == 0
            }
            
            return true
        }
        
        if textField.tag == 5{
            if string.characters.count > 0 {
                let allowedCharacters = CharacterSet.decimalDigits
                
                let unwantedStr = string.trimmingCharacters(in: allowedCharacters)
                
                
                
                return unwantedStr.characters.count == 0
            }
            
            return true
        }
        return true
    }
    
    //MARK:- textFieldShouldEndEditing
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        if let newRegCell : EditTableViewCell = textField.superview?.superview as? EditTableViewCell {
            
            
//            if newRegCell.addNewAddressTF.text == nil {
//                
//                newRegCell.addNewAddressLabel.isHidden = true
//                newRegCell.addNewAddressLabel.isHidden = false
//                
//                
//            }
        }
        return true
    }
    
    //MARK:- textFieldDidEndEditing
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        
        
        
        if let _ : EditTableViewCell = textField.superview?.superview as? EditTableViewCell {
            
//            
//            if (newRegCell.addNewAddressTF.text != nil)  {
//                
//                newRegCell.addNewAddressLabel.isHidden = false
//                
//                newRegCell.addNewAddressLabel.textColor = UIColor.lightGray
//            }
            
//            else{
//                
//             //   newRegCell.addNewAddressLabel.isHidden = false
//                
//            }
            
            if textField.tag == 0{
                
                name =  textField.text!
                
                
            }
            else if textField.tag == 1{
                
                address1 = textField.text!
                
            }
                
            else if textField.tag == 2 {
                
                address2 = textField.text!
                
            }
                
            else if textField.tag == 3{
                
                landmark = textField.text!
                
            }
            else if textField.tag == 4{
                
                mobileNo = textField.text!
                
                
            }
                
            else if textField.tag == 5 {
                
                activeTextField.text = selectedProvinceStr
                
            }
                
            else if textField.tag == 6 {
                
                activeTextField.text = selectedDistrictStr
                
            }
                
                
            else if textField.tag == 7 {
                
                activeTextField.text = selectedMandalStr
                
            }
                
                
            else if textField.tag == 8 {
                
                activeTextField.text = selectedVillageStr
                
            }
            else if textField.tag == 9 {
                
                activeTextField.text = pinCode
                
            }
            
            myPickerView.endEditing(true)
            
        }
        
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
        
        if textField.inputView == myPickerView{
            textField.inputAccessoryView = toolBar
        }
        
    }
    
    //MARK:- Button
    func doneClick() {
        
        
        if pickerData.count > 0 {
        
            switch activeTextField.tag {

            case 5:
               self.selectedProvinceStr = self.provinceListArr[0]
               if let value = provinceIDArray?[0].Id{
                provinceID = value
               }
               
               selectedDistrictStr = ""
               selectedVillageStr = ""
               selectedMandalStr = ""
               pinCode = ""

               
               getDistrictList()
               break
                
            case 6:
                self.selectedDistrictStr = self.districtsAry[0]
                
                if let value = districtIDArray?[0].Id{
                    districtID = value
                }
                
                selectedVillageStr = ""
                selectedMandalStr = ""
                pinCode = ""
                
                getMandalList()
                
                break
             
            case 7:
                self.selectedMandalStr = self.mandalsAry[0]
                
                if let value = mandalIDArray?[0].Id{
                    mandalID = value
                }
                
                selectedVillageStr = ""
                pinCode = ""
                
                getVillageList()
                break
                
            case 8:
                self.selectedVillageStr = self.villagesAry[0]
                
                if let value = villageIDArray?[0].Id{
                    villageID = value
                }
                
                if postalCodeAry.count > 0{
                    
                    if let value = String(postalCodeAry[0]){
                        
                        pinCode = value
                        
                    }
                    
                }
                break
                
                
                
            default :
                break
                
                
            }
        
        }
        
        
        self.addNewAddressTableView.reloadData()
            
        
        activeTextField.resignFirstResponder()
        
    }
    
    
    
    func cancelClick() {
        activeTextField.resignFirstResponder()
    }
    
    
    
    
    //MARK:- PickerView Delegate & DataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return pickerData.count
        
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        if activeTextField.tag == 5{
            
            if pickerData.count > row {
                
                selectedProvinceStr = pickerData[row]
                activeTextField.text = selectedProvinceStr
                selectedDistrictStr = ""
                selectedMandalStr = ""
                selectedVillageStr = ""
                pinCode = ""
                
                if(row < (provinceIDArray?.count)!){
                    if let value = provinceIDArray?[row].Id{
                        provinceID = value
                    }
                }
                
                districtsAry.removeAll()
                getDistrictList()
                
            }
        }
        else if activeTextField.tag == 6{
            
            if pickerData.count > row {
                
                selectedDistrictStr = pickerData[row]
                activeTextField.text = selectedDistrictStr
                selectedMandalStr = ""
                selectedVillageStr = ""
                pinCode = ""
                
                if(row < (districtIDArray?.count)!){
                    if let value = districtIDArray?[row].Id{
                        districtID = value
                    }
                }
                
                mandalsAry.removeAll()
                getMandalList()
            }
        }
            
        else if activeTextField.tag == 7{
            
            if pickerData.count > row {
                
                selectedMandalStr = pickerData[row]
                activeTextField.text = selectedMandalStr
                selectedVillageStr = ""
                pinCode = ""
                
                if(row < (mandalIDArray?.count)!){
                    if let value = mandalIDArray?[row].Id{
                        mandalID = value
                    }
                }
                
                villagesAry.removeAll()
                getVillageList()
            }
        }
        else if activeTextField.tag == 8{
            
            if pickerData.count > row {
                
                selectedVillageStr = pickerData[row]
                pinCode = postalCodeAry[row]
                activeTextField.text = selectedVillageStr
                if(row < (villageIDArray?.count)!){
                    if let value = villageIDArray?[row].Id{
                        villageID = value
                    }
                }
                
                if(row < (villageIDArray?.count)!){
                    if let value = villageIDArray?[row].PostCode{
                        
                        let postPin = String(value)
                        
                        pinCode = postPin
                    }
                }
//                villagesAry.removeAll()
//                 getVillageList()
//                
//                pinCode = ""
                
//                if postalCodeAry.count > 0{
//                    
//                    if let value = String(postalCodeAry[0]){
//                        
//                        pinCode = value
//                        
//                    }
//                    
//                    
//                }
                
            }
        }
        
        self.addNewAddressTableView.reloadData()

        
    }

    
    public func numberOfSections(in tableView: UITableView) -> Int {
        
        
        return 1
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
            return 80
        }
        else {
            
            return 60
            
        }
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        
        return section1TitleArray.count
        
    }
    
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "AddNewAddressTableViewCell", for: indexPath) as! AddNewAddressTableViewCell
        
//        let addList:AddressUpdateResultVo = (addressResultListArr?)!
        
//        cell.addNewAddressLabel.isHidden = false
        
//        cell.addNewAddressLabel.text = section1TitleArray[indexPath.row]
//        
//        cell.selectionStyle = .none
//        cell.addNewAddressTF.delegate = self
//        
//        cell.addNewAddressTF.tag = indexPath.row
        
        let cell = Bundle.main.loadNibNamed("EditTableViewCell", owner: self, options: nil)?.first as! EditTableViewCell
        
        cell.selectionStyle = .none
        cell.profileField.delegate = self
        cell.profileField.setLeftPaddingPoints(4)
        
        cell.profileField.tag = indexPath.row
        cell.profileField.selectedTitleColor = #colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1)
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
            cell.profileField.font = UIFont.systemFont(ofSize: 20)
            cell.profileField.placeholderFont = UIFont.systemFont(ofSize: 20)
            cell.profileField.titleFont = UIFont.systemFont(ofSize: 20)
            //                cell.profileField.errorLabel.font = UIFont.systemFont(ofSize: 14)
        }
        else {
            
            
        }
        
        if indexPath.row == 0{
            
            cell.profileField.placeholder =  "app.Name".localize()
            cell.profileField.selectedTitle =  "app.Name".localize()
            cell.profileField.title = "app.Name".localize()
            cell.profileField.text = name
            cell.profileField.maxLengthTextField = 40
            
            cell.profileField.selectedTitleColor = #colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1)
            
//            cell.addNewAddressLabel?.text = "app.Name".localize()
//            cell.addNewAddressTF.placeholder = "app.Name".localize()
//            cell.addNewAddressTF.text = name
            
            
        }
        else if indexPath.row == 1{
            
            cell.profileField.placeholder =  "app.Address1".localize()
            cell.profileField.selectedTitle =  "app.Address1".localize()
            cell.profileField.title = "app.Address1".localize()
            cell.profileField.text = address1
            cell.profileField.maxLengthTextField = 40
            cell.profileField.selectedTitleColor = #colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1)
            
//            cell.addNewAddressLabel?.text = "app.Address1".localize()
//            cell.addNewAddressTF.placeholder = "app.Address1".localize()
//            cell.addNewAddressTF.text = address1
            
        }
        else if indexPath.row == 2{
            
            cell.profileField.placeholder =  "app.Address2".localize()
            cell.profileField.selectedTitle =  "app.Address2".localize()
            cell.profileField.title = "app.Address2".localize()
            cell.profileField.text = address2
            cell.profileField.maxLengthTextField = 40
            cell.profileField.selectedTitleColor = #colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1)
            
//            cell.addNewAddressLabel?.text = "app.Address2".localize()
//            cell.addNewAddressTF.placeholder = "app.Address2".localize()
//            cell.addNewAddressTF.text = address2
            
        }
        else if indexPath.row == 3{
            
            cell.profileField.placeholder =  "app.Landmark".localize()
            cell.profileField.selectedTitle =  "app.Landmark".localize()
            cell.profileField.title = "app.Landmark".localize()
            cell.profileField.text = landmark
            cell.profileField.maxLengthTextField = 40
            cell.profileField.selectedTitleColor = #colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1)

            
//            cell.addNewAddressLabel?.text = "app.Landmark".localize()
//            cell.addNewAddressTF.placeholder = "app.Landmark".localize()
//            cell.addNewAddressTF.text = landmark
            
        }
        else if indexPath.row == 4{
            
            cell.profileField.placeholder =  "app.MobileNo".localize()
            cell.profileField.selectedTitle =  "app.MobileNo".localize()
            cell.profileField.title = "app.MobileNo".localize()
            cell.profileField.text = mobileNo
            cell.profileField.maxLengthTextField = 10
            cell.profileField.keyboardType = .phonePad
            cell.profileField.selectedTitleColor = #colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1)

            
//            cell.addNewAddressLabel?.text = "app.MobileNo".localize()
//            cell.addNewAddressTF.placeholder = "app.MobileNo".localize()
//            cell.addNewAddressTF.text = mobileNo
            
        }
        else if indexPath.row == 5{
            
            cell.profileField.placeholder =  "app.SelectProvince".localize()
            cell.profileField.selectedTitle =  "app.SelectProvince".localize()
            cell.profileField.title = "app.SelectProvince".localize()
            cell.profileField.text = selectedProvinceStr
            cell.profileField.selectedTitleColor = #colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1)
            
//            cell.addNewAddressLabel?.text = "app.SelectProvince".localize()
//            cell.addNewAddressTF.placeholder = "app.SelectProvince".localize()
//            cell.addNewAddressTF.text = selectedProvinceStr
            
        }
        else if indexPath.row == 6{
            
            cell.profileField.placeholder =  "app.SelectDistricts".localize()
            cell.profileField.selectedTitle =  "app.SelectDistricts".localize()
            cell.profileField.title = "app.SelectDistricts".localize()
            cell.profileField.text = selectedDistrictStr
            cell.profileField.selectedTitleColor = #colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1)

            
//            cell.addNewAddressLabel?.text = "app.SelectDistricts".localize()
//            cell.addNewAddressTF.placeholder = "app.SelectDistricts".localize()
//            cell.addNewAddressTF.text = selectedDistrictStr
            
        }
        else if indexPath.row == 7{
            
            cell.profileField.placeholder =  "app.SelectMandal".localize()
            cell.profileField.selectedTitle =  "app.SelectMandal".localize()
            cell.profileField.title = "app.SelectMandal".localize()
            cell.profileField.text = selectedMandalStr
            cell.profileField.selectedTitleColor = #colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1)

            
//            cell.addNewAddressLabel?.text = "app.SelectMandal".localize()
//            cell.addNewAddressTF.placeholder = "app.SelectMandal".localize()
//            cell.addNewAddressTF.text = selectedMandalStr
            
        }
        else if indexPath.row == 8{
            
            cell.profileField.placeholder =  "app.SelectVillage".localize()
            cell.profileField.selectedTitle =  "app.SelectVillage".localize()
            cell.profileField.title = "app.SelectVillage".localize()
            cell.profileField.text = selectedVillageStr
            cell.profileField.selectedTitleColor = #colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1)

            
//            cell.addNewAddressLabel?.text = "app.SelectVillage".localize()
//            cell.addNewAddressTF.placeholder = "app.SelectVillage".localize()
//            cell.addNewAddressTF.text = selectedVillageStr
            
        }
        else if indexPath.row == 9{
            
            cell.profileField.placeholder =  "app.PinCode".localize()
            cell.profileField.selectedTitle =  "app.PinCode".localize()
            cell.profileField.title = "app.PinCode".localize()
            cell.profileField.text = pinCode
            cell.profileField.selectedTitleColor = #colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1)
            
            cell.profileField.isEnabled = false

            
//            cell.addNewAddressLabel?.text = "app.PinCode".localize()
//            cell.addNewAddressTF.placeholder = "app.PinCode".localize()
//            cell.addNewAddressTF.text = pinCode
            
        }
        
        
        return cell
        
    }
    
    
    //MARK:- getProvinceList
    
    func getProvinceList(){
        
        if(appDelegate.checkInternetConnectivity()){
            
            let strUrl = PROVINCE_API
            
            
            serviceController.requestGETURL(strURL:strUrl, success:{(result) in
                DispatchQueue.main.async()
                    {
                        
                        let respVO:AgentReqVo = Mapper().map(JSONObject: result)!
                        
                        
                        let isActive = respVO.IsSuccess
                        
                        
                        if(isActive == true){
                            
                            let provinceObj = respVO.ListResult
                            self.provinceListArr.removeAll()
                            self.provinceIDArray?.removeAll()
                            
                            for(index,element) in (provinceObj?.enumerated())! {
                                
                                print("index:\(index)")
                                
                                self.provinceListArr.append(element.Name!)
                               
                                
                            }
                            
                            self.provinceIDArray = provinceObj
                            
                            
                        }else if(isActive == false) {
                            
                            let eUserMsg = respVO.EndUserMessage
                            
                            self.view.makeToast(eUserMsg!, duration:kToastDuration, position:CSToastPositionCenter)
                            
                        }
                        
                }
            }, failure:  {(error) in
            })
            
        }
        else {
            
            appDelegate.window?.makeToast(kNetworkStatusMessage, duration:kToastDuration, position:CSToastPositionCenter)
            return
            
        }
    }
    
    //MARK:- getDistrictList
    
    
    func getDistrictList(){
        
        if(appDelegate.checkInternetConnectivity()){
            
            let strUrl = DISTRICTS_API + String(provinceID)
            
            
            serviceController.requestGETURL(strURL:strUrl, success:{(result) in
                DispatchQueue.main.async()
                    {
                        
                        let respVO:AgentDistrictVo = Mapper().map(JSONObject: result)!
                        
                        
                        let isActive = respVO.IsSuccess
                        
                        
                        
                        if(isActive == true){
                            
                            let districtObj = respVO.ListResult
                            
                            self.districtsAry.removeAll()
                            self.districtIDArray?.removeAll()
                            
                            for(index,element) in (districtObj?.enumerated())! {
                                
                                print("index:\(index)")
                                
                                self.districtsAry.append(element.Name!)
                                
                            }
                            
                            self.districtIDArray = districtObj
                            
                            
                        }else if(isActive == false) {
                            
                            let eUserMsg = respVO.EndUserMessage
                            
                            self.view.makeToast(eUserMsg!, duration:kToastDuration, position:CSToastPositionCenter)
                            
                        }
                        
                }
            }, failure:  {(error) in
            })
            
        }
        else {
            
            appDelegate.window?.makeToast(kNetworkStatusMessage, duration:kToastDuration, position:CSToastPositionCenter)
            return
            
        }
    }
    
    //MARK:- getMandalList
    
    
    func getMandalList(){
        
        if(appDelegate.checkInternetConnectivity()){
            
            let strUrl = MANDALS_API + String(districtID)
            
            
            serviceController.requestGETURL(strURL:strUrl, success:{(result) in
                DispatchQueue.main.async()
                    {
                        
                        let respVO:AgentMandalVo = Mapper().map(JSONObject: result)!
                        
                        
                        let isActive = respVO.IsSuccess
                        
                        
                        
                        if(isActive == true){
                            
                            let mandalObj = respVO.ListResult
                            
                            
                            self.mandalIDArray?.removeAll()
                            self.mandalsAry.removeAll()
                            for(index,element) in (mandalObj?.enumerated())! {
                                
                                print("index:\(index)")
                                
                                self.mandalsAry.append(element.Name!)
                                
                            }
                            
                            self.mandalIDArray = mandalObj
                            
                            
                        }else if(isActive == false) {
                            
                            let eUserMsg = respVO.EndUserMessage
                            
                            self.view.makeToast(eUserMsg!, duration:kToastDuration, position:CSToastPositionCenter)
                            
                        }
                        
                }
            }, failure:  {(error) in
            })
            
        }
        else {
            
            appDelegate.window?.makeToast(kNetworkStatusMessage, duration:kToastDuration, position:CSToastPositionCenter)
            return
            
        }
    }
    
    //MARK:- getVillageList
    
    func getVillageList(){
        
        if(appDelegate.checkInternetConnectivity()){
            
            let strUrl = VILLAGES_API + String(mandalID)
            
            
            serviceController.requestGETURL(strURL:strUrl, success:{(result) in
                DispatchQueue.main.async()
                    {
                        
                        let respVO:AgentVillageVo = Mapper().map(JSONObject: result)!
                        
                        
                        let isActive = respVO.IsSuccess
                        
                        
                        
                        if(isActive == true){
                            
                            let villageObj = respVO.ListResult
                            
                            
//                            if (villageObj.count > 0){
//                                
//                                self.villageIDArray = villagesAPIModelArray
//                                
//                                for village in villagesAPIModelArray{
//                                    
//                                    self.villagesAry.append(village.name)
//                                    self.postalCodeAry.append(village.postCode)
//                                    
//                                }
//                            }
                            
                            self.postalCodeAry.removeAll()
                            self.villageIDArray?.removeAll()
                            self.villagesAry.removeAll()
                        
                            for(index,element) in (villageObj?.enumerated())! {
                                
                                print("index:\(index)")
                                
                                self.villagesAry.append(element.Name!)
                                
                                let pin = element.PostCode!
                                
                                let postCode:String = String(describing: pin)
                                
                                self.postalCodeAry.append(postCode)
                                
                            }
                            
                            self.villageIDArray = villageObj
                            
                            
                        }else if(isActive == false) {
                            
                            let eUserMsg = respVO.EndUserMessage
                            
                            self.view.makeToast(eUserMsg!, duration:kToastDuration, position:CSToastPositionCenter)
                            
                        }
                        
                }
            }, failure:  {(error) in
            })
            
        }
        else {
            
            appDelegate.window?.makeToast(kNetworkStatusMessage, duration:kToastDuration, position:CSToastPositionCenter)
            return
            
        }
    }
    
     //MARK:- addAgentReqInfoService
    
    func getAddressByAddressIdAPIService(){
        
        if(appDelegate.checkInternetConnectivity()){
            
            if !(addressId.isEmpty) {
                
                let strUrl = getAddressbyAddressIdUrl + "" + addressId
                
                
                serviceController.requestGETURL(strURL:strUrl, success:{(result) in
                    DispatchQueue.main.async()
                        {
                            
                            let respVO:GetAddressIDVo = Mapper().map(JSONObject: result)!
                            
                            
                            let isActive = respVO.IsSuccess
                            
                            
                            if(isActive == true){
                                
                                let listResultVo = respVO.Result
                                
                                if (listResultVo?.Name) != nil {
                                    
                                    self.name = (listResultVo?.Name)!
                                }
                                if (listResultVo?.AddressLine1) != nil {
                                    
                                    self.address1 = (listResultVo?.AddressLine1)!
                                }
                                if (listResultVo?.Id) != nil {
                                    
                                    self.idd = (listResultVo?.Id)!
                                }
                                
                                if (listResultVo?.AddressLine2) != nil {
                                    
                                    self.address2 = (listResultVo?.AddressLine2)!
                                    
                                }
                                if (listResultVo?.Landmark) != nil {
                                    
                                    self.landmark = (listResultVo?.Landmark)!
                                }
                                if (listResultVo?.MobileNumber) != nil {
                                    
                                    self.mobileNo = (listResultVo?.MobileNumber)!
                                }
                                if (listResultVo?.ProvinceName) != nil {
                                    
                                    self.selectedProvinceStr = (listResultVo?.ProvinceName)!
                                }
                                if (listResultVo?.DistrictName) != nil {
                                    
                                    self.selectedDistrictStr = (listResultVo?.DistrictName)!
                                }
                                if (listResultVo?.MandalName) != nil {
                                    
                                    self.selectedMandalStr = (listResultVo?.MandalName)!
                                }
                                if (listResultVo?.VillageName) != nil {
                                    
                                    self.selectedVillageStr = (listResultVo?.VillageName)!
                                }
                                if (listResultVo?.VillageId) != nil {
                                    
                                   self.villageID = (listResultVo?.VillageId)!
                                    
                                    self.saveBtnStr = "app.UpdateAddress".localize()
                                    
                                    self.saveBtn.setTitle(self.saveBtnStr,for: .normal)
                                }
                                if (listResultVo?.PostCode) != nil {
                                    
                                    let pinC = (listResultVo?.PostCode)!
                                    
                                    self.pinCode = String(pinC)
                                }
                                
                                
//                                self.addressResultListArr = [listResultVo!]
                                
                                
                                DispatchQueue.main.async(execute: { () -> Void in
                                    
                                    self.addNewAddressTableView.reloadData()
                                })
                                
                                
                            }else if(isActive == false) {
                                
                                self.view.makeToast("Service not found", duration:kToastDuration, position:CSToastPositionCenter)
                                
                            }
                            
                    }
                }, failure:  {(error) in
                    
                    if(error == "unAuthorized"){
                        
                        serviceController.refreshTokenForLogin(successHandler:{(result) in
                            DispatchQueue.main.async()
                                {
                                    
                                    self.getAddressByAddressIdAPIService()
                                    
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
        else {
            
            appDelegate.window?.makeToast(kNetworkStatusMessage, duration:kToastDuration, position:CSToastPositionCenter)
            return
        }
        
    }
    
    //MARK:- getAddressAPIService
    
    func getAddressAPIService(){
        
        
        let  strUrl = addressInsertUrl
        
        
        let currentDate = GlobalSupportingClass.getCurrentDate()
        
        print("currentDate\(currentDate)")
        
        let dictParams = [
            "AspNetUserId": userId!,
            "Name": name,
            "AddressLine1": address1,
            "AddressLine2": address2,
            "Landmark": landmark,
            "MobileNumber": mobileNo,
            "VillageId": villageID,
            "Id": 0,
            "IsActive": true,
            "CreatedBy": userId!,
            "ModifiedBy": userId!,
            "Created": "2017-12-29T11:05:09.244Z",
            "Modified": "2017-12-29T11:05:09.244Z"
            ] as NSDictionary
        
        print("dic params \(dictParams)")
        
        let dictHeaders = ["":"","":""] as NSDictionary
        
        
        print("dictHeader:\(dictHeaders)")
        
        serviceController.requestPOSTURL(strURL: strUrl as NSString, postParams: dictParams, postHeaders: dictHeaders, successHandler:{(result) in
            DispatchQueue.main.async()
                {
                    
                    print("result:\(result)")
                    
                    let respVO:AddressInsertInfoVo = Mapper().map(JSONObject: result)!
                    
                    
                    print("responseString = \(respVO)")
                    
                    
                    let statusCode = respVO.IsSuccess
                    
                    print("StatusCode:\(String(describing: statusCode))")
                    
                    
                    
                    if statusCode == true
                    {
                        
                        
                        let successMsg = respVO.EndUserMessage
                        
                        self.showAlertViewWithTitle("app.Success".localize(), message: successMsg!, buttonTitle: "app.Ok".localize())
                        
                        
                        self.name = ""
                        self.address1 = ""
                        self.address2 = ""
                        self.landmark = ""
                        self.mobileNo = ""
                        self.selectedProvinceStr = ""
                        self.selectedDistrictStr = ""
                        self.selectedMandalStr   = ""
                        self.selectedVillageStr  = ""
                        
                        self.navigationController?.popViewController(animated: true)
                        
//                        let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
//                        self.navigationController?.pushViewController(homeViewController, animated: true)
//                        
//                        
//                        self.appDelegate.window?.makeToast(successMsg!, duration:kToastDuration, position:CSToastPositionCenter)
//                        
//                        return
                        
                    }
                    else {
                        
                        let failMsg = respVO.EndUserMessage
                        
                        self.showAlertViewWithTitle("app.Alert".localize(), message: failMsg!, buttonTitle: "app.Ok".localize())
                        
                        return
                        
                    }
                    
                    
            }
        }, failureHandler: {(error) in
            
            if(error == "unAuthorized"){
                serviceController.refreshTokenForLogin(successHandler:{(result) in
                    DispatchQueue.main.async()
                        {
                            
                            self.getAddressAPIService()
                            
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
    
    //MARK:- updateAddressAPIService
    
    func updateAddressAPIService(){
        
        
        let  strUrl = addressUpdateUrl
        
        
        let currentDate = GlobalSupportingClass.getCurrentDate()
        
        print("currentDate\(currentDate)")
        
        let dictParams = [
            "AspNetUserId": userId!,
            "Name": name,
            "AddressLine1": address1,
            "AddressLine2": address2,
            "Landmark": landmark,
            "MobileNumber": mobileNo,
            "VillageId": villageID,
            "Id": self.idd,
            "IsActive": true,
            "CreatedBy": userId!,
            "ModifiedBy": userId!,
            "Created": "2017-12-30T05:24:33.029Z",
            "Modified": "2017-12-30T05:24:33.029Z"
            ] as NSDictionary
        
        print("dic params \(dictParams)")
        
        let dictHeaders = ["":"","":""] as NSDictionary
        
        
        print("dictHeader:\(dictHeaders)")
        
        serviceController.requestPUTURL(strURL: strUrl as NSString, postParams: dictParams, postHeaders: dictHeaders, successHandler:{(result) in
            DispatchQueue.main.async()
                {
                    
                    print("result:\(result)")
                    
                    let respVO:AddressUpdateInfoVo = Mapper().map(JSONObject: result)!
                    
                    
                    print("responseString = \(respVO)")
                    
                    
                    let statusCode = respVO.IsSuccess
                    
                    print("StatusCode:\(String(describing: statusCode))")
                    
                    
                    
                    if statusCode == true
                    {
                        
                        
                        let successMsg = respVO.EndUserMessage
                        
                        self.showAlertViewWithTitle("app.Success".localize(), message: successMsg!, buttonTitle: "app.Ok".localize())
                        
                        
                       self.navigationController?.popViewController(animated: true)
                        
                    }
                    else {
                        
                        let failMsg = respVO.EndUserMessage
                        
                        self.showAlertViewWithTitle("app.Alert".localize(), message: failMsg!, buttonTitle: "app.Ok".localize())
                        
                        return
                        
                    }
                    
                    
            }
        }, failureHandler: {(error) in
            
            if(error == "unAuthorized"){
                serviceController.refreshTokenForLogin(successHandler:{(result) in
                    DispatchQueue.main.async()
                        {
                            
                            self.updateAddressAPIService()
                            
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
        
        var errorMessage:NSString?
        
        let fName:NSString = name as NSString
        let mobile:NSString = mobileNo as NSString
        let province:NSString = selectedProvinceStr as NSString
        let district:NSString = selectedDistrictStr as NSString
        let mandal:NSString = selectedMandalStr as NSString
        let village:NSString = selectedVillageStr as NSString
        let address11:NSString = address1 as NSString
        let address22:NSString = address2 as NSString
        let landmarkk:NSString = landmark as NSString
        
         if (fName.length <= 0){
            
            errorMessage=GlobalSupportingClass.blankNameErrorMessage() as String as String as NSString?
            
        }
        else if (fName.length <= 2){
            
            errorMessage=GlobalSupportingClass.firstNamebitweenMessage() as String as String as NSString?
            
        }
        else if (address11.length <= 0){
            
            errorMessage=GlobalSupportingClass.blankAddress1ErrorMessage() as String as String as NSString?
            
        }
        else if (address22.length <= 0){
            
            errorMessage=GlobalSupportingClass.blankAddress2ErrorMessage() as String as String as NSString?
            
        }
        else if (landmarkk.length <= 0){
            
            errorMessage=GlobalSupportingClass.blankLandmarkErrorMessage() as String as String as NSString?
            
        }
            
        else if (mobile.length <= 0){
            
            errorMessage=GlobalSupportingClass.blankPhoneNumberErrorMessage() as String as String as NSString?
            
        }
        else if (mobile.length <= 9) {
            
            
            errorMessage=GlobalSupportingClass.invalidPhoneNumberErrorMessage() as String as String as NSString?
        }
        else if (mobileNo == "0000000000") {
            errorMessage=GlobalSupportingClass.valiedPhoneNumberErrorMessage() as String as String as NSString?
            
         }
        else if (province.length <= 0){
            
            errorMessage=GlobalSupportingClass.blankProvinceErrorMessage() as String as String as NSString?
            
        }
        else if (district.length <= 0){
            
            errorMessage=GlobalSupportingClass.blankDistrictErrorMessage() as String as String as NSString?
            
        }
        else if (mandal.length <= 0){
            
            errorMessage=GlobalSupportingClass.blankMandalErrorMessage() as String as String as NSString?
            
        }
        else if (village.length <= 0){
            
            errorMessage=GlobalSupportingClass.blankVillageErrorMessage() as String as String as NSString?
            
        }
        
        
        
        if let errorMsg = errorMessage{
            
            self.showAlertViewWithTitle("app.Alert".localize(), message: errorMsg as String, buttonTitle: "app.Retry".localize())
            return false;
        }
        return true
    }
    
    @IBAction func saveBtnAction(_ sender: Any) {
        
        
        addNewAddressTableView.reloadData()
        
        if self.validateAllFields()
        {
            if(appDelegate.checkInternetConnectivity()){
                
                if self.saveBtnStr == "app.UpdateAddress".localize() {
                    
                    self.updateAddressAPIService()
                    print("updateBtn")
                    
                }
                else {
                    
                    print("saveBtn")
                    
                   self.getAddressAPIService()
                }
            
            }
            else {
                
                self.appDelegate.window?.makeToast(kNetworkStatusMessage, duration:kToastDuration, position:CSToastPositionCenter)
                return
                
            }
        }
        
        
    }
    

    @IBAction func backAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
 
        
    }

}
