//
//  RequestForAgentViewController.swift
//  PayZan
//
//  Created by Harikrishna Unnam on 28/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit

//MARK:- RequeatAgentDelegate

protocol RequeatAgentDelegate: class {
    
    func textChanged(text:String?)
    
}

class RequestForAgentViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource,UIPickerViewDelegate, UIPickerViewDataSource,UITextFieldDelegate {
    
    
let headerTitle = "PERSONAL INFORMATION"
    
    //MARK:- OutLets

    
    @IBOutlet weak var requestForAgentTableView: UITableView!
    
    @IBOutlet weak var headerImgHeight: NSLayoutConstraint!
    
    @IBOutlet weak var headerViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var backLabel: UILabel!
    
    
    
    weak var reqdelegate: RequeatAgentDelegate?
    
    var myPickerView = UIPickerView()
    
    var toolBar = UIToolbar()
    var activeTextField = UITextField()
    var pickerData : Array<String> = Array()
    
    var placeholdersAry  = ["Select District","Select Mandal","Select Village","First Name","Middle Name","Last Name","Mobile No","Email","Address1","Address2"]
    
    var firstName    : String = ""
    var middileName  : String = ""
    var lastName     : String = ""
    var mobileNo   : String = ""
    var emailID       : String = ""
    var address1  : String = ""
    var address2     : String = ""
    var landmark       : String = ""
    var comments : String = ""
    
    var provinceListArr = Array<String>()
//    var provinceIDArray = Array<Int>()
    var provinceIDArray:[AgentReqResultVo]?
    var districtIDArray:[AgentDistrictResultVo]?
    var mandalIDArray:[AgentMandalResultVo]?
    var villageIDArray:[AgentVillageResultVo]?

    var districtsAry = Array<String>()
    var mandalsAry = Array<String>()
    var villagesAry = Array<String>()
    
    var titletypeIdAry: [ProfileTitleResultVo]?
    var titleArray = Array<String>()
    
   
    var selectedtitleTypeStr  = ""
    var selectedProvinceStr = ""
    var selectedDistrictStr = ""
    var selectedMandalStr   = ""
    var selectedVillageStr  = ""
    
    var provinceID     : Int    = 0
    var districtID     : Int    = 0
    var mandalID       : Int    = 0
    var villageID       : Int    = 0
    
     var titleTypeID    : Int    = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //MARK:- NibName

        
        let nibName  = UINib(nibName: "AddAgentRequestTableViewCell" , bundle: nil)
        requestForAgentTableView.register(nibName, forCellReuseIdentifier: "AddAgentRequestTableViewCell")
        
        let nibName1  = UINib(nibName: "SubmitAgentTableViewCell" , bundle: nil)
        requestForAgentTableView.register(nibName1, forCellReuseIdentifier: "SubmitAgentTableViewCell")
        
        requestForAgentTableView.dataSource = self
        requestForAgentTableView.delegate = self
        
        getTitleTypeAPICall()
        
        
        //MARK:- headerImgHeight For iphone and ipad

        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
            headerImgHeight.constant = 150
            
            headerViewHeight.constant = 50
            
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
        
        requestForAgentTableView.reloadData()
        
        self.tabBarController?.tabBar.isHidden = true
    }
    
    //MARK:- textFieldDidBeginEditing

    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        
        activeTextField = textField
        
        if let newRegCell : EditTableViewCell = textField.superview?.superview as? EditTableViewCell {
        

        }
        
        if textField.tag == 0{
            
            textField.clearButtonMode = .never
            textField.inputView = myPickerView
            pickerData = titleArray
            self.pickUp(activeTextField)
            myPickerView.reloadAllComponents()
            myPickerView.selectRow(0, inComponent: 0, animated: false)
            
        }

        else if textField.tag == 1{
            
            textField.clearButtonMode = .never
            textField.keyboardType = .default
            
        }
            
        else if textField.tag == 2 {
            
            textField.inputView = nil
            textField.keyboardType = .default
        }
            
        else if textField.tag == 3{
            
            textField.clearButtonMode = .never
            textField.keyboardType = .default
            
        }
            
        else if textField.tag == 4{
            
            textField.inputView = nil
            textField.keyboardType = .phonePad
            
        }
            
        else if textField.tag == 5{
            textField.inputView = nil
            textField.keyboardType = .emailAddress
            
        }
        else if textField.tag == 6{
            
            textField.clearButtonMode = .never
            textField.inputView = myPickerView
            pickerData = provinceListArr
            self.pickUp(activeTextField)
            myPickerView.reloadAllComponents()
            myPickerView.selectRow(0, inComponent: 0, animated: false)
            
        }
            
            
        else if textField.tag == 7{
            
            textField.clearButtonMode = .never
            textField.inputView = myPickerView
            pickerData = districtsAry
            self.pickUp(activeTextField)
            myPickerView.reloadAllComponents()
            myPickerView.selectRow(0, inComponent: 0, animated: false)
        }
            
        else if textField.tag == 8{
            textField.clearButtonMode = .never
            textField.inputView = myPickerView
            pickerData = mandalsAry
            self.pickUp(activeTextField)
            myPickerView.reloadAllComponents()
            myPickerView.selectRow(0, inComponent: 0, animated: false)
            
        }
            
        else if textField.tag == 9{
           
            textField.clearButtonMode = .never
            textField.inputView = myPickerView
            pickerData = villagesAry
            self.pickUp(activeTextField)
            myPickerView.reloadAllComponents()
            myPickerView.selectRow(0, inComponent: 0, animated: false)
            
        }
        else if textField.tag == 10{
            textField.inputView = nil
            textField.keyboardType = .asciiCapable
            
        }
            
        else if textField.tag == 11 {
            
            textField.clearButtonMode = .never
            textField.keyboardType = .asciiCapable
           
            
        }
            
        else if textField.tag == 12 {
            
            textField.clearButtonMode = .never
            textField.keyboardType = .asciiCapable
            
            
        }
            
        else if textField.tag == 13 {
            
            textField.clearButtonMode = .never
            
      
            
        }
            

        
    }
    
    //MARK:- shouldChangeCharactersIn range

    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == activeTextField {
            
            if !string.canBeConverted(to: String.Encoding.ascii){
                return false
            }
            
        }
        
        
        if textField.tag == 1 || textField.tag == 2 || textField.tag == 3  {
            if string.characters.count > 0 {
                let allowedCharacters = CharacterSet.letters
                
                let unwantedStr = string.trimmingCharacters(in: allowedCharacters)
                return unwantedStr.characters.count == 0
            }
            
            return true
        }
        
        if textField.tag == 4  {
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
            
            

        }
        return true
    }
    
    //MARK:- textFieldDidEndEditing

    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        
        
        
        if let newRegCell : EditTableViewCell = textField.superview?.superview as? EditTableViewCell {
            

            
            if textField.tag == 0{
                
                
                activeTextField.text = selectedtitleTypeStr
                
                
            }
            else if textField.tag == 1{
                
           firstName =  textField.text!
                
                
            }
            else if textField.tag == 2{
                
                middileName = textField.text!
                
            }
                
            else if textField.tag == 3 {
                
            lastName = textField.text!
                
            }
                
            else if textField.tag == 4{
                
              mobileNo = textField.text!
                
            }
            else if textField.tag == 5{

                emailID = textField.text!
                
                
            }
                
            else if textField.tag == 6 {
                
               activeTextField.text = selectedProvinceStr
                
            }
                
            else if textField.tag == 7 {
                
                activeTextField.text = selectedDistrictStr
                
            }
                
                
            else if textField.tag == 8 {
                
                 activeTextField.text = selectedMandalStr
                
            }
                
                
            else if textField.tag == 9 {
                
                activeTextField.text = selectedVillageStr
                
            }
                
            else if textField.tag == 10 {
                
                address1 = textField.text!
                
            }
                
            else if textField.tag == 11 {
                
                 address2 = textField.text!

            }
                
            else if textField.tag == 12 {
                landmark = textField.text!
       
            }
                
            else if textField.tag == 13 {
                
          comments = textField.text!
                
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
                
            case 0:
                self.selectedtitleTypeStr = self.titleArray[0]
                if let value = titletypeIdAry?[0].Id{
                    titleTypeID = value
                }
                
                getProvinceList()
                break
                
            case 6:
                self.selectedProvinceStr = self.provinceListArr[0]
                if let value = provinceIDArray?[0].Id{
                    provinceID = value
                }
                
                selectedDistrictStr = ""
                selectedVillageStr = ""
                selectedMandalStr = ""
                
                
                getDistrictList()
                break
                
            case 7:
                self.selectedDistrictStr = self.districtsAry[0]
                
                if let value = districtIDArray?[0].Id{
                    districtID = value
                }
                
                selectedVillageStr = ""
                selectedMandalStr = ""
                
                getMandalList()
                
                break
                
            case 8:
                self.selectedMandalStr = self.mandalsAry[0]
                
                if let value = mandalIDArray?[0].Id{
                    mandalID = value
                }
                
                selectedVillageStr = ""
                
                getVillageList()
                break
                
            case 9:
                self.selectedVillageStr = self.villagesAry[0]
                
                if let value = villageIDArray?[0].Id{
                    villageID = value
                }
                
                break
                
            default :
                break
                
                
            }
            
        }
        
        requestForAgentTableView.reloadData()
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
        
        
        if activeTextField.tag == 0{
            
            if pickerData.count > row {
                
                selectedtitleTypeStr = pickerData[row]
                activeTextField.text = selectedtitleTypeStr
                
                if(row < (titletypeIdAry?.count)!){
                    
                    if let value = titletypeIdAry?[row].Id{
                        titleTypeID = value
                    }
                }
                
                
            }
        }

        
        if activeTextField.tag == 6{
            
            if pickerData.count > row {
                
                selectedProvinceStr = pickerData[row]
                activeTextField.text = selectedProvinceStr
                selectedDistrictStr = ""
                selectedMandalStr = ""
                selectedVillageStr = ""

                if(row < (provinceIDArray?.count)!){
                    if let value = provinceIDArray?[row].Id{
                        provinceID = value
                    }
                }
                
                districtsAry.removeAll()
                getDistrictList()
            }
        }
        else if activeTextField.tag == 7{
            
            if pickerData.count > row {
                
                selectedDistrictStr = pickerData[row]
                activeTextField.text = selectedDistrictStr
                selectedMandalStr = ""
                selectedVillageStr = ""

                if(row < (districtIDArray?.count)!){
                    if let value = districtIDArray?[row].Id{
                        districtID = value
                    }
                }
                
                mandalsAry.removeAll()
                getMandalList()
            }
        }
        
        else if activeTextField.tag == 8{
            
            if pickerData.count > row {
                
                selectedMandalStr = pickerData[row]
                activeTextField.text = selectedMandalStr
                selectedVillageStr = ""

                if(row < (mandalIDArray?.count)!){
                    if let value = mandalIDArray?[row].Id{
                        mandalID = value
                    }
                }
                
                villagesAry.removeAll()
                getVillageList()
            }
        }
        else if activeTextField.tag == 9{
            
            if pickerData.count > row {
                
                selectedVillageStr = pickerData[row]
                activeTextField.text = selectedVillageStr
                if(row < (villageIDArray?.count)!){
                    if let value = villageIDArray?[row].Id{
                        villageID = value
                    }
                }
                
            }
            
        }
        requestForAgentTableView.reloadData()
    }
    
     //MARK:- UITableView Delegate & DataSource
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if(section==0){
            return 1.0
        }
            
        else{
            return 20.0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        
        var headerView = UIView()
        headerView.backgroundColor = #colorLiteral(red: 0.9222715736, green: 0.9222715736, blue: 0.9222715736, alpha: 1)
        
        if (section == 0) {
            headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 2))
            
        }
        else {
            
             headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 2))
        }
        
        return headerView
        
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
                
                return 80
            }
            else {
                
               return 60
            }
            
            
        }
            
        else{
            
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
                
                return 80
            }
            else {
                
                return 60
            }
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        
        return nil
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            
            return 14
        }
            
        else if section == 1 {
            
            return  1
        }
        
        return 0
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
        
            
            let cell = Bundle.main.loadNibNamed("EditTableViewCell", owner: self, options: nil)?.first as! EditTableViewCell
            
            cell.selectionStyle = .none
            cell.profileField.delegate = self
            
            cell.profileField.tag = indexPath.row
            cell.profileField.selectedTitleColor = #colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1)
            
            cell.profileField.setLeftPaddingPoints(4)
            
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
                
                cell.profileField.font = UIFont.systemFont(ofSize: 20)
                cell.profileField.placeholderFont = UIFont.systemFont(ofSize: 20)
                cell.profileField.titleFont = UIFont.systemFont(ofSize: 20)
            }
            else {
                
                
            }
                    
            if indexPath.row == 0{
                
                cell.profileField.placeholder = "app.ProfileTitle".localize()
                cell.profileField.selectedTitle = "app.ProfileTitle".localize()
                cell.profileField.title = "app.ProfileTitle".localize()
                cell.profileField.text = selectedtitleTypeStr
                cell.profileField.selectedTitleColor = #colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1)
          }
        
          else if indexPath.row == 1{
                
            cell.profileField.placeholder = "app.FirstName".localize()
            cell.profileField.selectedTitle = "app.FirstName".localize()
            cell.profileField.title = "app.FirstName".localize()
            cell.profileField.text = firstName
            cell.profileField.maxLengthTextField = 40

            cell.profileField.selectedTitleColor = #colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1)
            

        }
         else if indexPath.row == 2{
            
            cell.profileField.placeholder = "app.MiddleName".localize()
            cell.profileField.selectedTitle = "app.MiddleName".localize()
            cell.profileField.title = "app.MiddleName".localize()
            cell.profileField.text = middileName
            cell.profileField.maxLengthTextField = 40
            cell.profileField.selectedTitleColor = #colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1)
            
        }
        else if indexPath.row == 3{
            
            cell.profileField.placeholder = "app.LastName".localize()
            cell.profileField.selectedTitle = "app.LastName".localize()
            cell.profileField.title = "app.LastName".localize()
            cell.profileField.text = lastName
            cell.profileField.maxLengthTextField = 40
            cell.profileField.selectedTitleColor = #colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1)

                
        }
        else if indexPath.row == 4{
            
            cell.profileField.placeholder = "app.MobileNo".localize()
            cell.profileField.selectedTitle = "app.MobileNo".localize()
            cell.profileField.title = "app.MobileNo".localize()
            cell.profileField.text = mobileNo
            cell.profileField.maxLengthTextField = 10
            cell.profileField.selectedTitleColor = #colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1)
            
        }
        else if indexPath.row == 5{
            
            cell.profileField.placeholder = "app.Email".localize()
            cell.profileField.selectedTitle = "app.Email".localize()
            cell.profileField.title = "app.Email".localize()
            cell.profileField.text = emailID
            cell.profileField.maxLengthTextField = 60
            cell.profileField.selectedTitleColor = #colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1)
                
        }
        else if indexPath.row == 6{
            
            cell.profileField.placeholder = "app.SelectProvince".localize()
            cell.profileField.selectedTitle = "app.SelectProvince".localize()
            cell.profileField.title = "app.SelectProvince".localize()
            cell.profileField.text = selectedProvinceStr
            cell.profileField.selectedTitleColor = #colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1)
            
        }
        else if indexPath.row == 7{
            
            cell.profileField.placeholder = "app.SelectDistricts".localize()
            cell.profileField.selectedTitle = "app.SelectDistricts".localize()
            cell.profileField.title = "app.SelectDistricts".localize()
            cell.profileField.text = selectedDistrictStr
            cell.profileField.selectedTitleColor = #colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1)
            
        }
        else if indexPath.row == 8{
            
            cell.profileField.placeholder = "app.SelectMandal".localize()
            cell.profileField.selectedTitle = "app.SelectMandal".localize()
            cell.profileField.title = "app.SelectMandal".localize()
            cell.profileField.text = selectedMandalStr
            cell.profileField.selectedTitleColor = #colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1)
            
        }
        else if indexPath.row == 9{
            
            cell.profileField.placeholder = "app.SelectVillage".localize()
            cell.profileField.selectedTitle = "app.SelectVillage".localize()
            cell.profileField.title = "app.SelectVillage".localize()
            cell.profileField.text = selectedVillageStr
            cell.profileField.selectedTitleColor = #colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1)
            
        }
        else if indexPath.row == 10{
            
            cell.profileField.placeholder = "app.Address1".localize()
            cell.profileField.selectedTitle = "app.Address1".localize()
            cell.profileField.title = "app.Address1".localize()
            cell.profileField.text = address1
            cell.profileField.maxLengthTextField = 40
            cell.profileField.selectedTitleColor = #colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1)

        }
        else if indexPath.row == 11{
            
            cell.profileField.placeholder = "app.Address2".localize()
            cell.profileField.selectedTitle = "app.Address2".localize()
            cell.profileField.title = "app.Address2".localize()
            cell.profileField.text = address2
            cell.profileField.maxLengthTextField = 40
            cell.profileField.selectedTitleColor = #colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1)

            
        }
        else if indexPath.row == 12{
            
            cell.profileField.placeholder = "app.Landmark".localize()
            cell.profileField.selectedTitle = "app.Landmark".localize()
            cell.profileField.title = "app.Landmark".localize()
            cell.profileField.text = landmark
            cell.profileField.maxLengthTextField = 40
            cell.profileField.selectedTitleColor = #colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1)
                
        }
        else if indexPath.row == 13{
            
            cell.profileField.placeholder = "app.Enteryourcomments".localize()
            cell.profileField.selectedTitle = "app.Enteryourcomments".localize()
            cell.profileField.title = "app.Enteryourcomments".localize()
            cell.profileField.text = comments
            cell.profileField.maxLengthTextField = 100
            cell.profileField.selectedTitleColor = #colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1)
            
        }
            
            return cell
            
        }
        else{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "SubmitAgentTableViewCell", for: indexPath) as! SubmitAgentTableViewCell
            
            
            cell.submitBtn.addTarget(self, action: #selector(self.submitAgentAction), for: .touchUpInside)
            
            return cell
        }
        
        
    }
    
    //MARK:- submitAgentAction

    
    func submitAgentAction(_ sender: UIButton) {
        
    print("sender:\(sender.tag)")
        
        requestForAgentTableView.reloadData()
        
        if self.validateAllFields()
        {
                if(appDelegate.checkInternetConnectivity()){
                    
                    addAgentReqInfoService()
                        
                    
                }
                else {
                    
                    self.appDelegate.window?.makeToast(kNetworkStatusMessage, duration:kToastDuration, position:CSToastPositionCenter)
                    return
                    
        }
        }
     
    }
    
     //MARK:- validateAllFields
    
    func validateAllFields() -> Bool
    {
        
        var errorMessage:NSString?
        
        let title:NSString = selectedtitleTypeStr as NSString
        let fName:NSString = firstName as NSString
        let lName:NSString = lastName as NSString
        let mobile:NSString = mobileNo as NSString
        let email:NSString = emailID as NSString
        let province:NSString = selectedProvinceStr as NSString
        let district:NSString = selectedDistrictStr as NSString
        let mandal:NSString = selectedMandalStr as NSString
        let village:NSString = selectedVillageStr as NSString
        let address11:NSString = address1 as NSString
        let address22:NSString = address2 as NSString
        let landmarkk:NSString = landmark as NSString
        let commentss:NSString = comments as NSString
        
        if (title.length <= 0){
            
            errorMessage=GlobalSupportingClass.blankTitleErrorMessage() as String as String as NSString?
            
        }
        else if (fName.length <= 0){
            
            errorMessage=GlobalSupportingClass.blankFnameErrorMessage() as String as String as NSString?
            
        }
        else if (fName.length < 3){
            
            errorMessage=GlobalSupportingClass.firstNamebitweenMessage() as String as String as NSString?
            
        }
        else if (lName.length <= 0){
            
           errorMessage=GlobalSupportingClass.blankLnameErrorMessage() as String as String as NSString?
            
        }
            
        else if (mobile.length <= 0){
            
           errorMessage=GlobalSupportingClass.blankPhoneNumberErrorMessage() as String as String as NSString?
            
        }
        else if (mobile.length <= 9) {
            
            
            errorMessage=GlobalSupportingClass.invalidPhoneNumberErrorMessage() as String as String as NSString?
        }
            
            
        else if (email.length <= 0){
            

            errorMessage=GlobalSupportingClass.blankEmailIDErrorMessage() as String as String as NSString?
        }
            
        else if(!GlobalSupportingClass.isValidEmail(email as NSString)){
            
            errorMessage=GlobalSupportingClass.invalidEmaildIDFormatErrorMessage() as String as String as NSString?
            
            
        }
        else if (email.length<=3) {
            errorMessage=GlobalSupportingClass.miniCharEmailIDErrorMessage() as String as String as NSString?
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
            
        else if (address11.length <= 0){
            
            errorMessage=GlobalSupportingClass.blankAddress1ErrorMessage() as String as String as NSString?
            
        }
        else if (address22.length <= 0){
            
            errorMessage=GlobalSupportingClass.blankAddress2ErrorMessage() as String as String as NSString?
            
        }
        else if (landmarkk.length <= 0){
            
            errorMessage=GlobalSupportingClass.blankLandmarkErrorMessage() as String as String as NSString?
            
        }
        else if (commentss.length <= 0){
            
            errorMessage=GlobalSupportingClass.blankCommentsErrorMessage() as String as String as NSString?
            
        }
        
        if let errorMsg = errorMessage{
            
            self.showAlertViewWithTitle("app.Alert".localize(), message: errorMsg as String, buttonTitle: "app.Retry".localize())
            return false;
        }
        return true
    }
    
    
    //MARK: - Api call for get title Types
    
    func getTitleTypeAPICall(){
        
        getProvinceList()
        
        if(appDelegate.checkInternetConnectivity()){
            
            let classTypeID = "4"
            
            let strUrl = TITLETYPE_API + classTypeID
            
            
            serviceController.requestGETURL(strURL:strUrl, success:{(result) in
                DispatchQueue.main.async()
                    {
                        
                        let respVO:ProfileTitleVo = Mapper().map(JSONObject: result)!
                        
                        
                        let isActive = respVO.IsSuccess
                        
                        
                        if(isActive == true){
                            
                            let titleObj = respVO.ListResult
                            
                            self.titleArray.removeAll()
                            self.titletypeIdAry?.removeAll()
                            
                            for(index,element) in (titleObj?.enumerated())! {
                                
                                print("index:\(index)")
                                
                                
                                self.titleArray.append(element.Description!)
                                

                                
                            }
                            
                            self.titletypeIdAry = titleObj
                            
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
                            
                            self.requestForAgentTableView.reloadData()

                            
                        }else if(isActive == false) {
                            
                            self.view.makeToast("Service not found", duration:kToastDuration, position:CSToastPositionCenter)
                            
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
                            
                            self.view.makeToast("Service not found", duration:kToastDuration, position:CSToastPositionCenter)
                            
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
                            
                            self.mandalsAry.removeAll()
                            self.mandalIDArray?.removeAll()
                            
                            for(index,element) in (mandalObj?.enumerated())! {
                                
                                print("index:\(index)")
                                
                                self.mandalsAry.append(element.Name!)
                                
                            }
                            
                            self.mandalIDArray = mandalObj
                            
                            
                        }else if(isActive == false) {
                            
                            self.view.makeToast("Service not found", duration:kToastDuration, position:CSToastPositionCenter)
                            
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
                        
                        self.villagesAry.removeAll()
                        self.villageIDArray?.removeAll()
                        
                        if(isActive == true){
                            
                            let villageObj = respVO.ListResult
                            
                            for(index,element) in (villageObj?.enumerated())! {
                                
                                print("index:\(index)")
                                
                                self.villagesAry.append(element.Name!)
                                
                            }
                            
                            self.villageIDArray = villageObj
                            
                            
                        }else if(isActive == false) {
                            
                            self.view.makeToast("Service not found", duration:kToastDuration, position:CSToastPositionCenter)
                            
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

    
    func addAgentReqInfoService(){
        
        
            let  strUrl = ADDAGENT_API
            
        
            let currentDate = GlobalSupportingClass.getCurrentDate()
            
            print("currentDate\(currentDate)")
            
            let dictParams = [
                "Id": 0,
                "AgentRequestCategoryId": 38,
                "TitleTypeId": titleTypeID,
                "FirstName": firstName,
                "MiddleName": middileName,
                "LastName": lastName,
                "MobileNumber": mobileNo,
                "Email": emailID,
                "AddressLine1": address1,
                "AddressLine2": address2,
                "Landmark": landmark,
                "VillageId": villageID,
                "Comments": comments,
                "Created": currentDate
                ] as NSDictionary
            
            print("dic params \(dictParams)")
            
            let dictHeaders = ["":"","":""] as NSDictionary
            
            
            print("dictHeader:\(dictHeaders)")
            
            serviceController.requestPOSTURL(strURL: strUrl as NSString, postParams: dictParams, postHeaders: dictHeaders, successHandler:{(result) in
                DispatchQueue.main.async()
                    {
                        
                        print("result:\(result)")
                        
                        let respVO:AddAgentReqVo = Mapper().map(JSONObject: result)!
                        
                        
                        print("responseString = \(respVO)")
                        
                        
                        let statusCode = respVO.IsSuccess
                        
                        print("StatusCode:\(String(describing: statusCode))")
                        
                        
                        
                        if statusCode == true
                        {
                            
                            let successMsg = respVO.EndUserMessage
                            
                            
                            let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                            self.navigationController?.pushViewController(homeViewController, animated: true)
                            
                            
                            self.appDelegate.window?.makeToast(successMsg!, duration:kToastDuration, position:CSToastPositionCenter)
                            
                            return
                            
                        }
                        else {
                            
                            let failMsg = respVO.EndUserMessage
                            
                            self.showAlertViewWithTitle("Failed", message: failMsg!, buttonTitle: "Ok")
                            
                            return
                            
                        }
                            
                       
                }
            }, failureHandler: {(error) in
                
                if(error == "unAuthorized"){
                    serviceController.refreshTokenForLogin(successHandler:{(result) in
                        DispatchQueue.main.async()
                            {
                                
                                self.addAgentReqInfoService()
                                
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
    
    //MARK:- Button Actions

    
    @IBAction func backAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func notificationAction(_ sender: Any) {
        
    }
    
    
}
    
    
    
    
    
    
    
    



    



