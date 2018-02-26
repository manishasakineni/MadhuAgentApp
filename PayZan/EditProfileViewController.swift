//
//  EditProfileViewController.swift
//  PayZan
//
//  Created by CalibrageMac02 on 12/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit

//MARK:- ViewControllerBDelegate

protocol ViewControllerBDelegate: class {
    
    func textChanged(text:String?)
    
}

class EditProfileViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIPickerViewDelegate, UIPickerViewDataSource,UITextFieldDelegate  {
    
    //MARK:- OutLets

    @IBOutlet weak var editTableView: UITableView!
    
    @IBOutlet weak var headerImgHeight: NSLayoutConstraint!
    
    @IBOutlet weak var headerViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var backLabel: UILabel!
    
    
    //MARK:- Constants

    
    let headerTitle = "app.PERSONALINFORMATION".localize()
    let picker = UIImagePickerController()
    let datePicker = UIDatePicker()
    
    let TVC1 = TableViewCell1()
    let TVC2 = TableViewCell2()
    let GVC  = GenderTableViewCell()
    
    //MARK:- Variables
    
    var myPickerView = UIPickerView()
    
    var toolBar = UIToolbar()
    var activeTextField = UITextField()
    var pickerData : Array<String> = Array()
    
    
    var section1TitleArray = ["Name","AddressLine1","AddressLine2","LandMark","Mobile Number","Select Province","Select District","Select Mandal","Select Village","Select Pin Code"]
    
    var pTitle:String = ""
    var name    : String = ""
    var firstName:String = ""
    var lastName:String = ""
    var middleName:String = ""
    var address1  : String = ""
    var address2     : String = ""
    var landmark       : String = ""
    var mobileNo   : String = ""
    var email:String = ""
    var dateofBirth:String = ""
    var dob:String = ""
    var pinCode : String = ""
    var gender : String = ""
    var idd : Int = 0
    var aspNetUserId:String = ""
    
    var fileExtImg:String = ""
    var fileLocationImg:String = ""
    var fileNameImg:String = ""
    var profileUrl:String = ""
    var base64String = String()
    
    var titleTypeID    : Int    = 0
    
    
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
    
//    var titletypeIdAry = Array<String>()
    var titleArray = Array<String>()
    
    var titletypeIdAry: [ProfileTitleResultVo]?
    
    var alertTag = Int()

    
    var selectedProvinceStr = ""
    var selectedDistrictStr = ""
    var selectedMandalStr   = ""
    var selectedVillageStr  = ""
    var selectedtitleTypeStr  = ""
    
    var provinceID     : Int    = 0
    var districtID     : Int    = 0
    var mandalID       : Int    = 0
    var villageID       : Int    = 0
    


    var dateStr = String()
//    var image:UIImage?
    
    var image  = UIImage()
    var newImage: UIImage? = nil
    
    var selectedImagesArray: Array<UIImage> = []
    
    var userNamee:String!
    var userIdd:String!
    var userEmail:String!
    
    var checked = false
    var male = true
    var female = false
    
    var jpgImageData:Data!
    
    var dictProfile:NSMutableDictionary!
    var imageData: Data!
    
    var maleBtnID:Int = 0
    var femaleBtnID:Int = 0
    
    var isImageSave:Bool = false
    
    
    weak var delegate: ViewControllerBDelegate?
    
    var text: String? = nil
    var labelText:String?
    
    
    var editProfileArray:ProfileResultVo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.editTableView.delegate = self
        self.editTableView.dataSource = self
        
        self.editTableView.separatorStyle = .none
        
        labelText = text
        
        
        
        let defaults = UserDefaults.standard
        
        if let useriddd = defaults.string(forKey: userIDD) {
            
            userIdd = useriddd
            
            print("userName: \(String(describing: userIdd))")
        }
        
        if let userName = defaults.string(forKey: uNamee) {
            
            userNamee = userName
            
            print("userName: \(String(describing: userNamee))")
        }
        else {
            
            userNamee = "User Name"
        }
        
        if let email = defaults.string(forKey:emailIdd ) {
            
            userEmail = email
            
            print("userName: \(String(describing: userEmail))")
        }
        else {
            
            userEmail = "abc@gmail.com"
        }
        
        getEditProfileList()
        
        getProvinceList()
        
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
        
           }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        
        activeTextField = textField
        
        
        
        if textField.tag == 0{
            
            textField.clearButtonMode = .never
            textField.inputView = myPickerView
            pickerData = titleArray
            self.pickUp(activeTextField)
            myPickerView.reloadAllComponents()
            myPickerView.selectRow(0, inComponent: 0, animated: false)
            
        }
        else if textField.tag == 1 {
            
            textField.clearButtonMode = .never
            textField.keyboardType = .default
        }
        else if textField.tag == 2 {
            
            textField.clearButtonMode = .never
            textField.keyboardType = .default
        }
        else if textField.tag == 3 {
            
            textField.clearButtonMode = .never
            textField.keyboardType = .default
        }
            
//        else if textField.tag == 4 {
//            
//            textField.clearButtonMode = .never
//            textField.keyboardType = .default
//        }
            
        else if textField.tag == 4{
            
            textField.clearButtonMode = .never
            textField.keyboardType = .default
            
        }
            
        else if textField.tag == 5{
            
            textField.clearButtonMode = .never
            textField.keyboardType = .default
            
        }
        else if textField.tag == 6{
            
            textField.clearButtonMode = .never
            textField.keyboardType = .default
            
        }
        else if textField.tag == 7{
            
            textField.clearButtonMode = .never
            textField.keyboardType = .default
            
        }
        else if textField.tag == 8{
            
            textField.clearButtonMode = .never
            textField.keyboardType = .default
            
        }
        else if textField.tag == 9{
            
            textField.clearButtonMode = .never
            textField.inputView = datePicker
            
            let todayDate = NSDate()
            self.datePicker.maximumDate = todayDate as Date
            datePicker.datePickerMode = .date
            let toolBar = UIToolbar()
            toolBar.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            toolBar.sizeToFit()
            
            let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
            
            toolBar.setItems([doneButton], animated: true)
            
            textField.inputAccessoryView = toolBar
            
            activeTextField.text = dateofBirth
            
            
        }
            
        else if textField.tag == 10{
            
            textField.clearButtonMode = .never
            textField.inputView = myPickerView
            pickerData = provinceListArr
            self.pickUp(activeTextField)
            myPickerView.reloadAllComponents()
            myPickerView.selectRow(0, inComponent: 0, animated: false)
            
        }
            
            
        else if textField.tag == 11{
            
            textField.clearButtonMode = .never
            textField.inputView = myPickerView
            pickerData = districtsAry
            self.pickUp(activeTextField)
            myPickerView.reloadAllComponents()
            myPickerView.selectRow(0, inComponent: 0, animated: false)
        }
            
        else if textField.tag == 12{
            textField.clearButtonMode = .never
            textField.inputView = myPickerView
            pickerData = mandalsAry
            self.pickUp(activeTextField)
            myPickerView.reloadAllComponents()
            myPickerView.selectRow(0, inComponent: 0, animated: false)
            
        }
            
        else if textField.tag == 13{
            
            textField.clearButtonMode = .never
            textField.inputView = myPickerView
            pickerData = villagesAry
            self.pickUp(activeTextField)
            myPickerView.reloadAllComponents()
            myPickerView.selectRow(0, inComponent: 0, animated: false)
            
        }
        else if textField.tag == 14{
            
            textField.clearButtonMode = .never
            textField.keyboardType = .phonePad
            
        }
        else if textField.tag == 15{
            
            textField.clearButtonMode = .never
            textField.keyboardType = .default
            
        }
   
    }
    
    //MARK:- shouldChangeCharactersIn range
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        
        if textField == activeTextField {
            
            if !string.canBeConverted(to: String.Encoding.ascii){
                return false
            }
            
        }
        
        if textField.tag == 1{
            if string.characters.count > 0 {
                let allowedCharacters = CharacterSet.letters
                
                let unwantedStr = string.trimmingCharacters(in: allowedCharacters)
                return unwantedStr.characters.count == 0
            }
            
            return true
        }
        if textField.tag == 2{
            if string.characters.count > 0 {
                let allowedCharacters = CharacterSet.letters
                
                let unwantedStr = string.trimmingCharacters(in: allowedCharacters)
                return unwantedStr.characters.count == 0
            }
            
            return true
        }
        if textField.tag == 3{
            if string.characters.count > 0 {
                let allowedCharacters = CharacterSet.letters
                
                let unwantedStr = string.trimmingCharacters(in: allowedCharacters)
                return unwantedStr.characters.count == 0
            }
            
            return true
        }
        
        if textField.tag == 14 {
        
            if (string.hasPrefix("0") || string.hasPrefix("."))
            {
                return false
            }
        
        }
        

        
        
        
        return true
    }
    
    //MARK:- textFieldShouldEndEditing
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        
        if let newRegCell : EditTableViewCell = textField.superview?.superview as? EditTableViewCell {
            
            newRegCell.profileField.selectedTitleColor = #colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1)
            

        }
        return true
    }
    
    //MARK:- textFieldDidEndEditing
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        
        
        
        if let newRegCell : EditTableViewCell = textField.superview?.superview as? EditTableViewCell {
            
             newRegCell.profileField.selectedTitleColor = #colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1)
            
            
            if textField.tag == 0{
                
                
                activeTextField.text = selectedtitleTypeStr
                
                
            }
            if textField.tag == 1{
                
                
                firstName = textField.text!
                
                
            }
            if textField.tag == 2{
                
                
                middleName = textField.text!
                
                
            }
            if textField.tag == 3{
                
                
                lastName = textField.text!
                
                
            }
//            else if textField.tag == 4{
//                
//                name = textField.text!
//                
//            }
                
            else if textField.tag == 4 {
                
                address1 = textField.text!
                
            }
                
            else if textField.tag == 5{
                
                address2 = textField.text!
                
            }
            else if textField.tag == 6{
                
                landmark = textField.text!
                
                
            }
                
            else if textField.tag == 7 {
                
                
                mobileNo = textField.text!
                
                
            }
                
            else if textField.tag == 8 {
                
                email = textField.text!
                
                
            }
                
                
            else if textField.tag == 9 {
                
                
                activeTextField.text = dateofBirth
                
            }
                
                
            else if textField.tag == 10 {
                
                activeTextField.text = selectedProvinceStr
                
            }
            else if textField.tag == 11 {
                
                activeTextField.text = selectedDistrictStr
                
            }
            else if textField.tag == 12 {
                
                activeTextField.text = selectedMandalStr
                
            }
            else if textField.tag == 13 {
                
                activeTextField.text = selectedVillageStr
                
            }
            else if textField.tag == 14 {
                
                activeTextField.text = pinCode
                
            }
            else if textField.tag == 15 {
                
                activeTextField.text = gender
                
            }
            
            myPickerView.endEditing(true)
            
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if let newCell : EditTableViewCell = textField.superview?.superview as? EditTableViewCell {
            
            newCell.profileField.text = newCell.profileField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
            
            let pField:NSString = newCell.profileField.text! as NSString
            
            
            var errorMessage:NSString?
        
        // Validate the email field
        if newCell.profileField.tag == 0 {
            
            if (pField.length<=0) {
                
                errorMessage=GlobalSupportingClass.blankTitleErrorMessage() as String as String as NSString?
                
            }
        }
        if newCell.profileField.tag == 1 {

            if (pField.length<=0) {
                
                errorMessage=GlobalSupportingClass.blankTitleErrorMessage() as String as String as NSString?
                
            }
            
        }
            
           
        if let errorMsg = errorMessage{
                
                if newCell.profileField.tag == 0 {
                    
                    if (pField.length<=0) {
                        
                        newCell.profileField.errorMessage = errorMsg as String
                        
                    }
                }
                    
                else if newCell.profileField.tag == 1 {
                    
                    if (pField.length<=0) {
                        
                        newCell.profileField.errorMessage = errorMsg as String
                    }
                    
                }
                
            }
        newCell.profileField.rightView?.isHidden = true
        // When pressing return, move to the next field
        let nextTag = newCell.profileField.tag + 1
        if let nextResponder = textField.superview?.viewWithTag(nextTag) as UIResponder! {
            nextResponder.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
            
             }
        return false
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
        
        
        if activeTextField.tag == 10{
            
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
        else if activeTextField.tag == 11{
            
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
            
        else if activeTextField.tag == 12{
            
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
        else if activeTextField.tag == 13{
            
            if pickerData.count > row {
                
                selectedVillageStr = pickerData[row]
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
                
                
                
                
                self.editTableView.reloadData()
            }
        }
        
        self.editTableView.reloadData()
        
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
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(EditProfileViewController.doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(EditProfileViewController.cancelClick))
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
                
            case 10:
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
                
            case 11:
                self.selectedDistrictStr = self.districtsAry[0]
                
                if let value = districtIDArray?[0].Id{
                    districtID = value
                }
                
                selectedVillageStr = ""
                selectedMandalStr = ""
                pinCode = ""
                
                getMandalList()
                
                break
                
            case 12:
                self.selectedMandalStr = self.mandalsAry[0]
                
                if let value = mandalIDArray?[0].Id{
                    mandalID = value
                }
                
                selectedVillageStr = ""
                pinCode = ""
                
                getVillageList()
                break
                
            case 13:
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
        
        self.editTableView.reloadData()

        activeTextField.resignFirstResponder()
        
    }
    func cancelClick() {
        activeTextField.resignFirstResponder()
    }
    
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if(section==0){
            return 1.0
        }
            
        else{
            return 45.0
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
            
            let headerLabel = UILabel(frame: CGRect(x: 15, y: 17, width:
                tableView.bounds.size.width, height: 20))
             if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
                
                headerLabel.font = UIFont(name: "Verdana", size: 20)
            }
             else {
                
                
                headerLabel.font = UIFont(name: "Verdana", size: 12)
                
            }
            
            headerLabel.textColor = UIColor.gray
            headerLabel.text = self.tableView(self.editTableView, titleForHeaderInSection: section)
            headerLabel.sizeToFit()
            headerView.addSubview(headerLabel)
        }
        
        return headerView
        
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            
            return 100
        }
            
        else{
            if indexPath.row == 15{
                
                return 150
            }
            
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
                
                return 80
            }
            else {
                
               return 60
                
            }
            
            
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if(section==1){
            
            
            return headerTitle
        }
        
        return nil
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            
            return 1
        }
            
        else if section == 1 {
            
            return  16
        }
        
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            let cell = Bundle.main.loadNibNamed("TableViewCell1", owner: self, options: nil)?.first as! TableViewCell1
            
            cell.selectionStyle = .none
            
            
            if indexPath.row == 0{
                
                
                cell.editButton.addTarget(self, action: #selector(self.editBtnClicked), for: .touchDown)
                
                cell.profileImag.layer.cornerRadius = cell.profileImag.frame.size.height/2;
                cell.profileImag.layer.borderColor = UIColor.gray.cgColor
                cell.profileImag.layer.borderWidth = 1
                cell.profileImag.clipsToBounds = true
                
                if newImage == nil {
                    
                    cell.profileImag.image = UIImage(named: "user")
                }
                else {
                    
                    cell.profileImag.image = newImage
                }
                
                
                
            }
            
            
            
            
            return cell
            
        }
            
        else
        {
            
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
            if indexPath.row == 1{
                
                

                cell.profileField.placeholder = "app.FirstName".localize()
                cell.profileField.selectedTitle = "app.FirstName".localize()
                cell.profileField.title = "app.FirstName".localize()
                cell.profileField.text = firstName
                cell.profileField.maxLengthTextField = 40

                cell.profileField.selectedTitleColor = #colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1)
                
            }
            if indexPath.row == 2{
                
                

                cell.profileField.placeholder = "app.MiddleName".localize()
                cell.profileField.selectedTitle = "app.MiddleName".localize()
                cell.profileField.title = "app.MiddleName".localize()
                cell.profileField.text = middleName
                cell.profileField.maxLengthTextField = 40

                cell.profileField.selectedTitleColor = #colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1)
                
                
            }
            if indexPath.row == 3{
                
                
                

                cell.profileField.placeholder = "app.LastName".localize()
                cell.profileField.selectedTitle = "app.LastName".localize()
                cell.profileField.title = "app.LastName".localize()
                cell.profileField.text = lastName
                cell.profileField.maxLengthTextField = 40

                cell.profileField.selectedTitleColor = #colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1)
                
            }
            
                
            else if indexPath.row == 4{
                

                
                cell.profileField.placeholder = "app.Address1".localize()
                cell.profileField.selectedTitle = "app.Address1".localize()
                cell.profileField.title = "app.Address1".localize()
                cell.profileField.text = address1
                cell.profileField.maxLengthTextField = 40

                cell.profileField.selectedTitleColor = #colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1)

                
                
            }
            else if indexPath.row == 5{
                

                
                cell.profileField.placeholder = "app.Address2".localize()
                cell.profileField.selectedTitle = "app.Address2".localize()
                cell.profileField.title = "app.Address2".localize()
                cell.profileField.text = address2
                cell.profileField.maxLengthTextField = 40

                cell.profileField.selectedTitleColor = #colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1)
                
                
                
            }
            else if indexPath.row == 6{
                
                cell.profileField.placeholder = "app.Landmark".localize()
                cell.profileField.selectedTitle = "app.Landmark".localize()
                cell.profileField.title = "app.Landmark".localize()
                cell.profileField.text = landmark
                cell.profileField.maxLengthTextField = 40

                cell.profileField.selectedTitleColor = #colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1)
                
                
            }
            else if indexPath.row == 7{
                
                
                cell.profileField.placeholder = "app.MobileNo".localize()
                cell.profileField.selectedTitle = "app.MobileNo".localize()
                cell.profileField.title = "app.MobileNo".localize()
                cell.profileField.text = mobileNo
                cell.profileField.maxLengthTextField = 40

                cell.profileField.selectedTitleColor = #colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1)
                
                cell.profileField.isEnabled = false
                
            }
            else if indexPath.row == 8{
                
                
                cell.profileField.placeholder = "app.Email".localize()
                cell.profileField.selectedTitle = "app.Email".localize()
                cell.profileField.title = "app.Email".localize()
                cell.profileField.maxLengthTextField = 40

                cell.profileField.text = email
                
                
            }
            else if indexPath.row == 9{
                
                
                cell.profileField.placeholder = "app.DateOfBirth".localize()
                cell.profileField.selectedTitle = "app.DateOfBirth".localize()
                cell.profileField.title = "app.DateOfBirth".localize()
                cell.profileField.maxLengthTextField = 40

                cell.profileField.text! = dateofBirth
                
                
                
            }
            else if indexPath.row == 10{
                

                
                cell.profileField.placeholder = "app.SelectProvince".localize()
                cell.profileField.selectedTitle = "app.SelectProvince".localize()
                cell.profileField.title = "app.SelectProvince".localize()
                cell.profileField.maxLengthTextField = 40

                cell.profileField.text = selectedProvinceStr
                
                
                
            }
            else if indexPath.row == 11{
                
                
                cell.profileField.placeholder = "app.SelectDistricts".localize()
                cell.profileField.selectedTitle = "app.SelectDistricts".localize()
                cell.profileField.title = "app.SelectDistricts".localize()
                cell.profileField.maxLengthTextField = 40

                cell.profileField.text = selectedDistrictStr
                
                
                
            }
            else if indexPath.row == 12{
                
                
                cell.profileField.placeholder = "app.SelectMandal".localize()
                cell.profileField.selectedTitle = "app.SelectMandal".localize()
                cell.profileField.title = "app.SelectMandal".localize()
                cell.profileField.maxLengthTextField = 40

                cell.profileField.text = selectedMandalStr
            
            }
                
            else if indexPath.row == 13{
                
                
                cell.profileField.placeholder = "app.SelectVillage".localize()
                cell.profileField.selectedTitle = "app.SelectVillage".localize()
                cell.profileField.title = "app.SelectVillage".localize()
                
                cell.profileField.maxLengthTextField = 40

                cell.profileField.text = selectedVillageStr
             
            }
            else if indexPath.row == 14{
                

                
                cell.profileField.placeholder = "app.PinCode".localize()
                cell.profileField.selectedTitle = "app.PinCode".localize()
                cell.profileField.title = "app.PinCode".localize()
 
                cell.profileField.text = pinCode
                
                cell.profileField.isEnabled = false
            
            }
            else if indexPath.row == 15{
                
                let cell = Bundle.main.loadNibNamed("GenderTableViewCell", owner: self, options: nil)?.first as! GenderTableViewCell
                
                
                cell.selectionStyle = .none
                cell.saveBtn.tag = indexPath.row
                cell.femaleUnCheck.tintColor = #colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1)
                cell.maleUnCheckBtn.tintColor = #colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1)
                
                if maleBtnID == 21 {
                    
                    
                    cell.femaleUnCheck.image = UIImage(named:"checked_83366")
                    
                    cell.maleUnCheckBtn.image = UIImage(named:"icons8-Unchecked Circle-50")
                    
                }
                else {
                    
                    
                   
                    
                    cell.maleUnCheckBtn.image = UIImage(named:"checked_83366")
                    
                    cell.femaleUnCheck.image = UIImage(named:"icons8-Unchecked Circle-50")
                }
               
                cell.maleBtn.addTarget(self, action: #selector(self.maleBtnClicked), for: .touchUpInside)
                
                cell.maleBtn.tag = 20
                
                
                cell.femaleBtn.addTarget(self, action: #selector(self.femaleBtnClicked), for: .touchUpInside)
                
                cell.femaleBtn.tag = 21
                
                cell.saveBtn.addTarget(self, action: #selector(self.saveBtnClicked), for: .touchUpInside)
                
                
                return cell
                
            }
            
            
            
            return cell
        }
        
        
    }

    
    //MARK:- Edit Action
    
    
    func editBtnClicked(_ sender: UIButton) {
        print("I Clicked a button")
        
        
        let alert:UIAlertController=UIAlertController(title: "app.ChooseProfileImage".localize(), message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        let cameraAction = UIAlertAction(title: "app.FromCamera".localize(), style: UIAlertActionStyle.default)
        {
            UIAlertAction in
            self.openCamera()
        }
        let gallaryAction = UIAlertAction(title: "app.FromGallery".localize(), style: UIAlertActionStyle.default)
        {
            UIAlertAction in
            self.openGallary()
        }
        let cancelAction = UIAlertAction(title: "app.Cancel".localize(), style: UIAlertActionStyle.cancel)
        {
            UIAlertAction in
        }
        // Add the actions
        picker.delegate = self
        alert.addAction(cameraAction)
        alert.addAction(gallaryAction)
        alert.addAction(cancelAction)
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone) {
            
            
            present(alert, animated: true, completion: nil)
        }
            
        else{
            
            let popup = UIPopoverController.init(contentViewController: alert)
            
            popup.present(from: CGRect(x:self.view.frame.size.width/2, y:self.view.frame.size.height/4, width:0, height:0), in: self.view, permittedArrowDirections: UIPopoverArrowDirection.any, animated: true)
            
        }
        

    }
    
    //MARK:- saveBtnClicked

    
    func saveBtnClicked(_ sender: UIButton) {
        
        
//        let indexPath : IndexPath = IndexPath(row: sender.tag, section: 1)
//        
//        if let cell : GenderTableViewCell = editTableView.cellForRow(at: indexPath) as? GenderTableViewCell {
//            
//            let editCell:EditTableViewCell = (editTableView.cellForRow(at: indexPath) as? EditTableViewCell)!
//            
//            editCell.profileField.text = editCell.profileField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
//            
//            let pField:NSString = editCell.profileField.text! as NSString
//            
//            
//            var errorMessage:NSString?
//            
//            if editCell.profileField.tag == 0 {
//                
//                
//                if (pField.length<=0) {
//                
//                errorMessage=GlobalSupportingClass.blankTitleErrorMessage() as String as String as NSString?
//                    
//                }
//                
//            }
//            else if editCell.profileField.tag == 1 {
//                
//                if (pField.length<=0) {
//                    
//                    errorMessage=GlobalSupportingClass.blankFnameErrorMessage() as String as String as NSString?
//                }
//            }
//            
//            print("editCell:\(indexPath.row)")
//            
//
//            if let errorMsg = errorMessage{
//                
//                 if editCell.profileField.tag == 0 {
//                
//                if (pField.length<=0) {
//                    
//                    editCell.profileField.errorMessage = errorMsg as String
//                    editTableView.reloadData()
//                   }
//                 }
//                    
//                 else if editCell.profileField.tag == 1 {
//                    
//                 if (pField.length<=0) {
//                    
//                    editCell.profileField.errorMessage = errorMsg as String
//                }
//                    
//                }
//                
//               editTableView.reloadData()
//            }
//
//        }

        
        
        if(appDelegate.checkInternetConnectivity()){
            
            if self.validateAllFields()
            {
                
                
               updateProfileAPIService()
            }
            }
            else {
                
                self.appDelegate.window?.makeToast(kNetworkStatusMessage, duration:kToastDuration, position:CSToastPositionCenter)
                return
                
            }
        
    }
    //MARK:- openCamera

    
    func openCamera() {
        picker.allowsEditing = true
        picker.sourceType = .camera
        present(picker, animated: true, completion: nil)
        
    }
    
    //MARK:- openGallary

    
    func openGallary() {
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
        
    }
    
    //MARK:- imagePickerController
 
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        
        image = (info[UIImagePickerControllerOriginalImage] as? UIImage)!
        
        
        let size = CGSize(width: 200, height: 200)
        
        newImage = resizeImage(image: image,targetSize : size)
        
        selectedImagesArray.append(newImage!)
        
        fileLocationImg = "null"
        fileNameImg = "null"
        
        editTableView.reloadData()
        
        dismiss(animated: true, completion: nil)
        
    }
    
    //MARK:- UIPickerViewController

    
    func image(_ image: UIImage!, didFinishSavingWithError error: NSError!, contextInfo: AnyObject!) {
        if (error != nil) {
            
        } else {
            
           
        }
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    //MARK:- saveImage

    
    func saveImage (_ image: UIImage, path: String ) -> Bool{
        
        isImageSave = true
        
        let jpgImageData = UIImageJPEGRepresentation(image, 1.0)   // if you want to save as JPEG
        let result = (try? jpgImageData!.write(to: URL(fileURLWithPath: path), options: [.atomic])) != nil
        
        return result
    }
    
    //MARK:- donePressed

    
    
    func donePressed(){
        
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "MMM dd, yyyy"
        dateofBirth = dateFormatter.string(from: datePicker.date)
        
        self.view.endEditing(true)
    }
    
    //MARK:- hideLabels

    
    func hideLabels(){
        
        
        
    }
    
    //MARK:- maleBtnClicked

    
    func maleBtnClicked(_ sender: UIButton) {
        
        
        let indexPath:IndexPath = IndexPath(row: 15, section: 1)
        
        
        if let cell : GenderTableViewCell = self.editTableView.cellForRow(at: indexPath) as? GenderTableViewCell {
            
            if (male == true)
            {
                
           cell.maleUnCheckBtn.image = UIImage(named:"checked_83366")
                
           cell.femaleUnCheck.image = UIImage(named:"icons8-Unchecked Circle-50")
                
            male = false
                
            }
            else
            {
                cell.maleUnCheckBtn.image = UIImage(named:"icons8-Unchecked Circle-50")
                
                cell.femaleUnCheck.image = UIImage(named:"checked_83366")
                
                male = true
            }
            
        }
        
        
        
        maleBtnID = sender.tag
        
        print(maleBtnID)
        
        
        editTableView.reloadRows(at: [indexPath], with: .fade)
        
        editTableView.reloadData()
        
        
    }
    
    //MARK:- femaleBtnClicked

    
    func femaleBtnClicked(_ sender: UIButton){
        
        let indexPath:IndexPath = IndexPath(row: 15, section: 1)
        
        
        if let cell : GenderTableViewCell = self.editTableView.cellForRow(at: indexPath) as? GenderTableViewCell {
            
            if (male == true)
            {
                
                cell.maleUnCheckBtn.image = UIImage(named:"icons8-Unchecked Circle-50")
                
                cell.femaleUnCheck.image = UIImage(named:"checked_83366")
                
                male = false
                
            }
            else
            {
                cell.maleUnCheckBtn.image = UIImage(named:"checked_83366")
                
                cell.femaleUnCheck.image = UIImage(named:"icons8-Unchecked Circle-50")
                
                male = true
            }
            
        }

        
        maleBtnID = sender.tag
        
        print(maleBtnID)
        

        
        editTableView.reloadRows(at: [indexPath], with: .fade)
        
        editTableView.reloadData()
        
    }
    
    //MARK:- Button Actions

    
    @IBAction func backAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
        delegate?.textChanged(text: labelText)
    }
    
    @IBAction func searchAction(_ sender: Any) {
        
        delegate?.textChanged(text: labelText)
    }
    
    //MARK: - Api call for get title Types
    
    func getTitleTypeAPICall(){
        
        
        if(appDelegate.checkInternetConnectivity()){
            
            let classTypeID = "4"
            
            let strUrl = TITLETYPE_API + classTypeID
            
            
            serviceController.requestGETURL(strURL:strUrl, success:{(result) in
                DispatchQueue.main.async()
                    {
                        
                        let respVO:ProfileTitleVo = Mapper().map(JSONObject: result)!
                        
                        
                        let isActive = respVO.IsSuccess
                        
                        
                        if(isActive == true){
                            
                            let provinceObj = respVO.ListResult
                            
                            self.titleArray.removeAll()
                            
                            self.titletypeIdAry?.removeAll()
                            
                            for(index,element) in (provinceObj?.enumerated())! {
                                
                                print("index:\(index)")
                                
                                
                                self.titleArray.append(element.Description!)
                                

                                
                            }
                            
                            self.titletypeIdAry = provinceObj
                            
                            
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
                                //                                self.provinceIDArray.append(element.Id!)
                                
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
                            
                            self.mandalsAry.removeAll()
                            self.mandalIDArray?.removeAll()
                            
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
                            
                            self.villagesAry.removeAll()
                            self.postalCodeAry.removeAll()
                            self.villageIDArray?.removeAll()
                            
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
    
    func getEditProfileList(){
        
        if(appDelegate.checkInternetConnectivity()){
            
            getTitleTypeAPICall()
            
            if userIdd != nil {
            
            let strUrl = getProfileUrl + "" + userIdd
            
            
            serviceController.requestGETURL(strURL:strUrl, success:{(result) in
                DispatchQueue.main.async()
                    {
                        
                        let respVO:GetProfileVo = Mapper().map(JSONObject: result)!
                        
                        let isSuccess = respVO.IsSuccess
                        
                        if(isSuccess == true){
                            
                            let editProfileObj = respVO.Result
                            
                            if editProfileObj != nil {
                                
                                let editObj = editProfileObj!
                                
                                if editObj.Title != nil {
                                    
                                    self.selectedtitleTypeStr = editObj.Title!
                                }
                                if editObj.TitleTypeId != nil {
                                    
                                    self.titleTypeID = editObj.TitleTypeId!
                                }
                                if editObj.FirstName != nil {
                                    
                                    self.firstName = editObj.FirstName!
                                }
                                if editObj.MiddleName != nil {
                                    
                                    self.middleName = editObj.MiddleName!
                                }
                                if editObj.LastName != nil {
                                    
                                    self.lastName = editObj.LastName!
                                }
                                if editObj.UserName != nil {
                                    
                                    self.name = editObj.UserName!
                                }
                                if editObj.Address1 != nil {
                                    
                                    self.address1 = editObj.Address1!
                                }
                                if editObj.Address2 != nil {
                                    
                                    self.address2 = editObj.Address2!
                                }
                                if editObj.Landmark != nil {
                                    
                                    self.landmark = editObj.Landmark!
                                }
                                if editObj.Phone != nil {
                                    
                                    self.mobileNo = editObj.Phone!
                                }
                                if editObj.Email != nil {
                                    
                                    self.email = editObj.Email!
                                }
                                if editObj.DOB != nil {
                                    
                                    let fff = (editObj.DOB!)
                                    
                                   self.dob = self.formattedDateFromString(dateString: fff, withFormat: "MMM dd, yyyy")!
                                    
                                    if self.dob != "0" {
                                        
                                       self.dateofBirth = self.dob
                                        
                                    }
                                    
                                }
                                if editObj.ProvinceName != nil {
                                    
                                    self.selectedProvinceStr = editObj.ProvinceName!
                                }
                                if editObj.DistrictName != nil {
                                    
                                    self.selectedDistrictStr = editObj.DistrictName!
                                }
                                if editObj.MandalName != nil {
                                    
                                    self.selectedMandalStr = editObj.MandalName!
                                }
                                if editObj.VillageName != nil {
                                    
                                    self.selectedVillageStr = editObj.VillageName!
                                }
                                if editObj.PostCode != nil {
                                    
                                    let pin = editObj.PostCode!
                                    
                                    let pinC:String = String(pin)
                                    
                                    self.pinCode = pinC
                                }
                                if editObj.VillageId != nil {
                                    
                                    self.villageID = editObj.VillageId!
                                }
                                if editObj.Id != nil {
                                    
                                    self.idd = editObj.Id!
                                }
                                if editObj.AspNetUserId != nil {
                                    
                                    self.aspNetUserId = editObj.AspNetUserId!
                                }
                                if editObj.FileExtension != nil {
                                    
                                    self.fileExtImg = editObj.FileExtension!
                                }
                                if editObj.FileLocation != nil {
                                    
                                    self.fileLocationImg = editObj.FileLocation!
                                }
                                if editObj.FileName != nil {
                                    
                                    self.fileNameImg = editObj.FileName!
                                }
                                
                                if editObj.FileName != nil {
                                    
                                    self.fileNameImg = editObj.FileName!
                                }
                                
                                if editObj.GenderTypeId != nil {
                                    
                                    self.maleBtnID = editObj.GenderTypeId!
                                }
                                if editObj.ProfilePicUrl != nil {
                                    
                                     self.profileUrl = editObj.ProfilePicUrl!
                                    
                                     let newString = self.profileUrl.replacingOccurrences(of: "\\", with: "//", options: .backwards, range: nil)
                                        
                                     print("filteredUrlString:\(newString)")
                                        
                                     let url = URL(string:newString)
                                        
                                     let data = try? Data(contentsOf: url!)
                                    
                                    if data != nil {
                                        
                                        self.newImage = UIImage(data: data!)
                                    }
                                    
                                    
                                }
                                
                                self.editProfileArray = editObj
                                
                            }
                            
                            self.editTableView.reloadData()
                            
                        }
                        else if(isSuccess == false) {
                            
                            self.view.makeToast("Service not found", duration:kToastDuration, position:CSToastPositionCenter)
                            
                        }
                       
                }
            }, failure:  {(error) in
                
                if(error == "unAuthorized"){
                    serviceController.refreshTokenForLogin(successHandler:{(result) in
                        DispatchQueue.main.async()
                            {
                                
                               self.getEditProfileList()
                                
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
        }
        else {
            
            appDelegate.window?.makeToast(kNetworkStatusMessage, duration:kToastDuration, position:CSToastPositionCenter)
            return
            
        }
    }
    
    //MARK:- validateAllFields
    
    func validateAllFields() -> Bool
    {
        
        var errorMessage:NSString?
        
        let title:NSString = selectedtitleTypeStr as NSString
        let fName:NSString = firstName as NSString
        let uName:NSString = name as NSString
        let lName:NSString = lastName as NSString
        let mobile:NSString = mobileNo as NSString
        let emailId:NSString = self.email as NSString
        let dob:NSString = dateofBirth as NSString
        let province:NSString = selectedProvinceStr as NSString
        let district:NSString = selectedDistrictStr as NSString
        let mandal:NSString = selectedMandalStr as NSString
        let village:NSString = selectedVillageStr as NSString
        let address11:NSString = address1 as NSString
        let address22:NSString = address2 as NSString
        let landmarkk:NSString = landmark as NSString
        
        
        if (title.length <= 0){
            
            alertTag = 0
            
            errorMessage=GlobalSupportingClass.blankTitleErrorMessage() as String as String as NSString?
            
        }
        else if (fName.length <= 0){
            
            alertTag = 1
            
            errorMessage=GlobalSupportingClass.blankFnameErrorMessage() as String as String as NSString?
            
        }
        else if (fName.length <= 2){
            
            alertTag = 1
            
            errorMessage=GlobalSupportingClass.firstNamebitweenMessage() as String as String as NSString?
            
        }
        

        
       else if (lName.length <= 0){
            
            alertTag = 3
            
            errorMessage=GlobalSupportingClass.blankLnameErrorMessage() as String as String as NSString?
            
        }
       else if (uName.length <= 0){
            
            alertTag = 2
            
            errorMessage=GlobalSupportingClass.blankNameErrorMessage() as String as String as NSString?
            
        }
       else if (address11.length <= 0){
            
            alertTag = 4
            
            errorMessage=GlobalSupportingClass.blankAddress1ErrorMessage() as String as String as NSString?
            
        }
        else if (address22.length <= 0){
            
            alertTag = 5
            
            errorMessage=GlobalSupportingClass.blankAddress2ErrorMessage() as String as String as NSString?
            
        }
        else if (landmarkk.length <= 0){
            
            alertTag = 6
            
            errorMessage=GlobalSupportingClass.blankLandmarkErrorMessage() as String as String as NSString?
            
        }
            
        else if (mobile.length <= 0){
            
            alertTag = 7
            
            errorMessage=GlobalSupportingClass.blankPhoneNumberErrorMessage() as String as String as NSString?
            
        }
        else if (mobile.length <= 9) {
            
            alertTag = 7
            
            errorMessage=GlobalSupportingClass.invalidPhoneNumberErrorMessage() as String as String as NSString?
        }
     
            
         else if (mobile.length > 12) {
            
            alertTag = 7
            errorMessage=GlobalSupportingClass.invalidPhoneNumberErrorMessage() as String as String as NSString?
        }
        else if (emailId.length<=0) {
            
            alertTag = 8
            
            errorMessage=GlobalSupportingClass.blankEmailIDErrorMessage() as String as String as NSString?
        }
       else  if (emailId.length<=4) {
            alertTag = 8
            
            errorMessage=GlobalSupportingClass.miniCharEmailIDErrorMessage() as String as String as NSString?
        }
       else  if(!GlobalSupportingClass.isValidEmail(emailId as NSString))
        {
            alertTag = 8
            errorMessage=GlobalSupportingClass.invalidEmaildIDFormatErrorMessage() as String as String as NSString?
        }
        else if (dob.length <= 0){
            
            alertTag = 9
            
            errorMessage=GlobalSupportingClass.blankDOBirthErrorMessage() as String as String as NSString?
            
        }
        else if (province.length <= 0){
            
            alertTag = 10
            
            errorMessage=GlobalSupportingClass.blankProvinceErrorMessage() as String as String as NSString?
            
        }
        else if (district.length <= 0){
            
            alertTag = 11
            
            errorMessage=GlobalSupportingClass.blankDistrictErrorMessage() as String as String as NSString?
            
        }
        else if (mandal.length <= 0){
            
            alertTag = 12
            
            errorMessage=GlobalSupportingClass.blankMandalErrorMessage() as String as String as NSString?
            
        }
       else  if (village.length <= 0){
            
            alertTag = 13
            
            errorMessage=GlobalSupportingClass.blankVillageErrorMessage() as String as String as NSString?
            
        }
        
        
        
        if let errorMsg = errorMessage{
            
            
            self.alertWithTitle(title: "app.Alert".localize(), message: errorMsg as String, ViewController: self, toFocus: activeTextField)
            
        
            return false
            
        }
        return true
    }
    
    //MARK:- updateAddressAPIService
    
    func updateProfileAPIService(){
        
       
        
        let  strUrl = profileUpdateUrl
        
        
        let currentDate = GlobalSupportingClass.getCurrentDate()
        
        print("currentDate\(currentDate)")
        
        
        let formatter = DateFormatter()
        
        
        
        formatter.dateFormat = "MMM dd, yyyy"
        
        let yourDate = formatter.date(from: dateofBirth)
        
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        
            let dateB = formatter.string(from: yourDate!)
            
            let dob:String = dateB
//        }
        
        if newImage != nil {
            
            let imageData = UIImagePNGRepresentation(newImage!)
            
            base64String = imageData!.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
            
        }
        
        
        if maleBtnID == 0 {
            
            maleBtnID = 20
        }
        let null = NSNull()
        
        let dictParams = [
            
            "AspNetUserId": userIdd,
            "TitleTypeId": titleTypeID,
            "FirstName": firstName,
            "MiddleName": middleName,
            "LastName": lastName,
            "Phone": mobileNo,
            "Email": email,
            "GenderTypeId": maleBtnID,
            "DOB": dob,
            "Address1": address1,
            "Address2": address2,
            "Landmark": landmark,
            "VillageId": villageID,
            "ParentAspNetUserId": userIdd,
            "EducationTypeId": null,
            "Id": idd,
            "IsActive": true,
            "ImageString": base64String,
            "FileExtension": ".png",
            "FileName": fileNameImg,
            "FileLocation": fileLocationImg,
            "CreatedBy": userIdd,
            "ModifiedBy": userIdd,
            "Created": "2018-01-06T10:58:32.800Z",
            "Modified": "2018-01-06T10:58:32.800Z"
            
            ] as NSDictionary
        
        print("dic params \(dictParams)")
        
        let dictHeaders = ["":"","":""] as NSDictionary
        
        
        print("dictHeader:\(dictHeaders)")
        
        serviceController.requestPOSTURL(strURL: strUrl as NSString, postParams: dictParams, postHeaders: dictHeaders, successHandler:{(result) in
            DispatchQueue.main.async()
                {
                    
                    print("result:\(result)")
                    
                    let respVO:ProfileUpdateVo = Mapper().map(JSONObject: result)!
                    
                    
                    let statusCode = respVO.IsSuccess
                    
                    print("StatusCode:\(String(describing: statusCode))")
                    
                    
                    if statusCode == true
                    {
                        
                        let successMsg = respVO.EndUserMessage
                        
                        let email = respVO.Result?.Email
                        
                        let profileUrl = respVO.Result?.ProfilePicUrl
                        
                        
                        let defaults = UserDefaults.standard
                        
                        // Save String value to UserDefaults
                        
                        defaults.set(email, forKey: profileEmail)
                        
                        defaults.set(profileUrl, forKey: profilePicUrl)
                        
                        UserDefaults.standard.synchronize()
                        
                        
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
                            
                            self.updateProfileAPIService()
                            
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
    
    @IBAction func doneAction(_ sender: Any) {
    }
   
    //MARK: - Date Formarter
    
    func formattedDateFromString(dateString: String, withFormat format: String) -> String? {
        
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        if let date = inputFormatter.date(from: dateString) {
            
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = format
            
            return outputFormatter.string(from: date)
        }
        
        return nil
    }
    
    
    func alertWithTitle(title: String!, message: String, ViewController: UIViewController, toFocus:UITextField) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "app.Ok".localize(), style: UIAlertActionStyle.cancel,handler: {_ in
            
            let indexPath : IndexPath = IndexPath(row: self.alertTag, section: 1)
            
            self.editTableView.scrollToRow(at: indexPath, at: UITableViewScrollPosition.top, animated: false)
            if let itemNumberCell = self.editTableView.cellForRow(at: indexPath) as? EditTableViewCell {
                
                itemNumberCell.profileField.becomeFirstResponder()
            }
            
            
        });
        alert.addAction(action)
        ViewController.present(alert, animated: true, completion:nil)
    }

    
    
}
