//
//  PayzAppViewController.swift
//  PayZanScrollViewScreens
//
//  Created by MANOJ KUMAR on 12/10/17.
//  Copyright © 2017 MANOJ KUMAR. All rights reserved.
//

import UIKit
import AMPFloatingTextField
import TextFieldEffects

class PayzAppViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource{
    
   //MARK:- OutLets
    var select = true
    
    var selectedImg = UIImage()
    var totalAmountStr = String()
    
    var addMoneyStr:String = ""
    
    var addMoneyAmount:String = ""
    
    var walletAmount = Float()
    
    @IBOutlet weak var selectBtn: UIButton!
    
    var selection : Int = 1
    
    @IBOutlet weak var totalAmountLbl: UILabel!
    
    @IBOutlet weak var payZanAmountLbl: UILabel!
    
    @IBOutlet weak var avialableAmountLbl: UILabel!
    
    @IBOutlet weak var payingAmount: UILabel!
    
    @IBOutlet weak var viewBackGroundView: UIView!

    @IBOutlet var tableView: UITableView!
    
    
    @IBOutlet var savedCardButtonOutLet: UIButton!
    
    @IBOutlet var creditCardButtonOutLet: UIButton!
    
    @IBOutlet var debitCardButtonOutLet: UIButton!
    
    @IBOutlet var netBankingButtonOutLet: UIButton!
    
       
    var selectedButtonString = ""
    
    
    @IBOutlet var savedCardsLabel: UILabel!
    
    
    @IBOutlet var creditCardLabel: UILabel!
    
    @IBOutlet var debitCardLabel: UILabel!
    
    @IBOutlet var netBankingLabel: UILabel!
    
    @IBOutlet weak var headerImgHeight: NSLayoutConstraint!
    
    @IBOutlet weak var headerViewHeight: NSLayoutConstraint!
    
    
    
    var datePicker = UIDatePicker()
    var dateStr = String()
    var picker = UIPickerView()
    var myPickerView = UIPickerView()
    var toolBar = UIToolbar()
    var pickerDataAry = Array<String>()
    var activeTextField = UITextField()
    var monthsAry = Array<String>()
     var yearsAry = Array<String>()
     var bankNamesAry = Array<String>()
    var selectedMonthStr = String()
    var selectedYearStr  = String()
    
    var cardHolderName  = String()
    
    var selectedBankStr = String()
    
    var cvvStr   = String()
    
    var userId:String? = ""
    var walletId:String? = ""
    
    var debitCardNoStr:String = ""
    var debitholderNameStr:String = ""
    var debitCardLabelStr:String = ""
    var debitCvv:String = ""
    
    var creditCardNoStr:String = ""
    var creditholderNameStr:String = ""
    var creditCardLabelStr:String = ""
    var creditCvv:String = ""
   

// ExtendedTableViewCell

    var completedClaimDetails          : Array<String>     = Array()
    
    struct Section {
        var items: [String]!
        var collapsed: Bool!
        init(items: [String], collapsed: Bool = true) {
            self.items = items
            self.collapsed = collapsed
        }
    }
    var selectedIndex:IndexPath?
    
    var isExpanded = false
    
    var sections = [Section]()
    
    var clickedSection : Int = -1
    var previousSection : Int = -1
    
    
    var selectedMonth = ""
    var selectedYear = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedImg = UIImage(named: "unselectedBox.png")!
        
       totalAmountLbl.text! = totalAmountStr 
        
        totalAmountLbl.text! = addMoneyAmount
        
         let defaults = UserDefaults.standard
                
        if let userid = defaults.string(forKey: userIDD) {
            
            userId = userid
            
            print("defaults savedString: \(userid)")
        }
        if let walletid = defaults.string(forKey: walletIDD) {
            
            walletId = walletid
            
            print("defaults savedString: \(walletid)")
            
        }

        
        
        if let walletAm = defaults.string(forKey: walletAmountt) {
        
        walletAmount = Float(walletAm)!
            
        }
        
        if let walletAmoun = defaults.string(forKey: "walletAmount") {
            
            
            walletAmount = Float(walletAmoun)!
            
            
        }

        
        payZanAmountLbl.isHidden = true
        payingAmount.isHidden = true
        
        payZanAmountLbl.text = String(walletAmount)
        
      //  avialableAmountLbl.text = String(walletAmount-Int(totalAmountStr)!)
        
        avialableAmountLbl.text = String(walletAmount)

        tableView.delegate = self
        tableView.dataSource = self
        
        for i in 0 ..< 4 {
            
            self.sections.append(Section(items: ["\(i)"]))
            
        }
   

        tableView.register(UINib.init(nibName: "ExpandedCell", bundle: nil),
                           forCellReuseIdentifier: "ExpandedCell")
        
        tableView.register(UINib.init(nibName: "ExpandableCell", bundle: nil),
                           forCellReuseIdentifier: "ExpandableCell")
        
     
        
        
        self.findAllTextInputs()
        
       
        
        //MARK:- NibName

        
      

        let nibName1  = UINib(nibName: "CreditCardTableViewCell" , bundle: nil)
        tableView.register(nibName1, forCellReuseIdentifier: "CreditCardTableViewCell")

        
        let nibName2  = UINib(nibName: "DebitCardTableViewCell" , bundle: nil)
        tableView.register(nibName2, forCellReuseIdentifier: "DebitCardTableViewCell")

        
        let nibName3  = UINib(nibName: "NetBankingTableViewCell" , bundle: nil)
        tableView.register(nibName3, forCellReuseIdentifier: "NetBankingTableViewCell")
        
        let nibName4  = UINib(nibName: "CardsTableViewCell" , bundle: nil)
        tableView.register(nibName4, forCellReuseIdentifier: "CardsTableViewCell")
        
        let nibName5  = UINib(nibName: "PayZanAmountTableViewCell" , bundle: nil)
        tableView.register(nibName5, forCellReuseIdentifier: "PayZanAmountTableViewCell")
        

        
        picker.delegate = self
        selectedButtonString = "savedCards"
        self.monthsAry = ["01","02","03","04","05","06","07","08","09","10","11","12"]
        
        self.bankNamesAry = ["HDFC","ICICI","SBI","BOI","BOB"]
        
        self.createPageMenu()

        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
            headerImgHeight.constant = 150
            
            headerViewHeight.constant = 50
            

           

        }
        else {
            
            headerImgHeight.constant = 79
            

            
        }
        
        
        
        self.yearsTillNow

        borderColors()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.isHidden = true
        
    }
    
    
    private func createPageMenu() {
        
        
        
        
        
        
        
    }
    var yearsTillNow : [String] {
        
        let date = Date()
        let calendar = Calendar.current
        
        let year = calendar.component(.year, from: date)
        // var years = [String]()
        for i in (year..<year+50) {
            self.yearsAry.append("\(i)")
        }
        return self.yearsAry
    }
    
    
    @IBAction func selectBtnAction(_ sender: Any) {
        
        
        
        if selection == 1{
        
       selectBtn.setImage(UIImage(named: "selectedBox.png"), for: .normal)
            
            payZanAmountLbl.isHidden = false
           // payingAmount.text = String(walletAmount-Int(totalAmountStr)!)
            payingAmount.isHidden = false
            
           selection = 2
        
        }
        
        else{
        
        selectBtn.setImage(UIImage(named: "unselectedBox.png"), for: .normal)
            
        payZanAmountLbl.isHidden = true
       // payingAmount.text = String(walletAmount)
        payingAmount.isHidden = true
            
            selection = 1
        
        
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
        
//        selectedMonthStr = ""
//        if(selectedMonthStr == "" && self.monthsAry.count > 0){
//            self.selectedMonthStr = self.monthsAry[0]
//        }
//        else if(selectedYearStr == "" && self.yearsAry.count > 0){
//            self.selectedYearStr = self.yearsAry[0]
//        }
//        else if(selectedBankStr == ""){
//            
//            self.selectedBankStr = self.bankNamesAry[0]
//        }

        activeTextField.resignFirstResponder()
        
    }
    func cancelClick() {
        activeTextField.resignFirstResponder()
    }
    
    func applySkyscannerTheme(textField: AMPFloatingTextField) {
        
        textField.tintColor = .black
        
        textField.textColor = .black
        textField.errorLabel.textColor = .red
        textField.updateBorder()
        
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
        textField.titleLabel.font = UIFont.systemFont(ofSize: 12)
        textField.placeholderFont = UIFont.systemFont(ofSize: 12)
        //        textField.errorLabel.font = UIFont.systemFont(ofSize: 8)
        //        textField.font = UIFont.systemFont(ofSize: 18)
        //        textField.isImmediateValidation = true
    }
    
    
//MARK:- UITextfield delegate methods
    
     func textFieldDidEndEditing(_ textField: UITextField) {
        
        activeTextField = textField
        
        if activeTextField.tag == 5{
            
            debitCardNoStr = activeTextField.text!
            
//            textField.clearButtonMode = .never
//            textField.keyboardType = .default
            
        }
        else if activeTextField.tag == 6 {
            
            debitholderNameStr = activeTextField.text!
            
        }
        else if activeTextField.tag == 7 {
            
            debitCardLabelStr = activeTextField.text!
            
        }
        else if activeTextField.tag == 8 {
            
            creditCardNoStr = activeTextField.text!
            
        }
        else if activeTextField.tag == 9 {
            
            creditholderNameStr = activeTextField.text!
            
        }
        else if activeTextField.tag == 10 {
            
            creditCardLabelStr = activeTextField.text!
            
        }
        
        else if activeTextField.tag == 1 {
            
            activeTextField.text = selectedMonthStr
            
        }
        
        else if activeTextField.tag == 2{
            
           activeTextField.text = selectedYearStr
            
            
        }
        else if activeTextField.tag == 3{
            
            activeTextField.text = selectedMonthStr
            
        }
        
        else if activeTextField.tag == 4 {
            
            activeTextField.text = selectedYearStr
            
        }
        else if activeTextField.tag == 11 {
            
            activeTextField.text = selectedBankStr
            
            if(selectedBankStr == ""){
                
                self.selectedBankStr = self.bankNamesAry[0]
                
                activeTextField.text = selectedBankStr
            }
            
        }
        else if activeTextField.tag == 12 {
            
            debitCvv = activeTextField.text!
            
        }
        else if activeTextField.tag == 13 {
            
            creditCvv = activeTextField.text!
            
        }
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
         activeTextField = textField
        
        self.currentjumpOrder = textField.jumpOrder //set current first responder index
        
        if activeTextField.tag == 0{
            
            textField.clearButtonMode = .never
            textField.keyboardType = .default
            
        }
        
       else if activeTextField.tag == 1 {
            
            textField.clearButtonMode = .never
            textField.inputView = myPickerView
            pickerDataAry = self.monthsAry
            self.pickUp(activeTextField)
            myPickerView.reloadAllComponents()
            myPickerView.selectRow(0, inComponent: 0, animated: false)
            
//        textField.clearButtonMode = .never
//        textField.inputView = picker
//        pickerDataAry = self.monthsAry
//        picker.reloadAllComponents()
//        picker.selectRow(0, inComponent: 0, animated: false)
        
        }
        
        else if activeTextField.tag == 2 {
            
            textField.clearButtonMode = .never
            textField.inputView = myPickerView
            pickerDataAry = self.yearsAry
            self.pickUp(activeTextField)
            myPickerView.reloadAllComponents()
            myPickerView.selectRow(0, inComponent: 0, animated: false)

//            textField.clearButtonMode = .never
//            textField.inputView = picker
//            pickerDataAry = self.yearsAry
//            picker.reloadAllComponents()
//            picker.selectRow(0, inComponent: 0, animated: false)
            
        }
        
      else if activeTextField.tag == 3 {
            
            textField.clearButtonMode = .never
            textField.inputView = myPickerView
            pickerDataAry = self.monthsAry
            self.pickUp(activeTextField)
            myPickerView.reloadAllComponents()
            myPickerView.selectRow(0, inComponent: 0, animated: false)
                        
//            textField.clearButtonMode = .never
//            textField.inputView = picker
//            pickerDataAry = self.monthsAry
//            picker.reloadAllComponents()
//            picker.selectRow(0, inComponent: 0, animated: false)
            
        }
            
        else if activeTextField.tag == 4 {
            
            textField.clearButtonMode = .never
            textField.inputView = myPickerView
            pickerDataAry = self.yearsAry
            self.pickUp(activeTextField)
            myPickerView.reloadAllComponents()
            myPickerView.selectRow(0, inComponent: 0, animated: false)
            
//            textField.clearButtonMode = .never
//            textField.inputView = picker
//            pickerDataAry = self.yearsAry
//            picker.reloadAllComponents()
//            picker.selectRow(0, inComponent: 0, animated: false)
            
        }
        
        else if activeTextField.tag == 11 {
            
//            textField.clearButtonMode = .never
            textField.inputView = picker
            pickerDataAry = self.bankNamesAry
            picker.reloadAllComponents()
            picker.selectRow(0, inComponent: 0, animated: false)
            
            
        }
        
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.moveNext() //move to the next text input in order
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        activeTextField = textField
        
        if textField == activeTextField {
            
            if !string.canBeConverted(to: String.Encoding.ascii){
                return false
            }
            
        }
        
        if !string.canBeConverted(to: String.Encoding.ascii){
            
            return false
            
        }
        
        if activeTextField.tag == 13  || activeTextField.tag == 12{
            
            if string.characters.count > 0 {
                
                let currentCharacterCount = textField.text?.characters.count ?? 0
                if (range.length + range.location > currentCharacterCount){
                    return false
                }
                //  let newLength = currentCharacterCount + string.characters.count - range.length
                
                let allowedCharacters = CharacterSet.decimalDigits
                
                
                
                let unwantedStr = string.trimmingCharacters(in: allowedCharacters)
                
                return unwantedStr.characters.count == 0
                
            }
            
        }
        
        if activeTextField.tag == 6 || activeTextField.tag == 7 || activeTextField.tag == 9 || activeTextField.tag == 10 {
        
            if string.characters.count > 0 {
                
                let currentCharacterCount = textField.text?.characters.count ?? 0
                if (range.length + range.location > currentCharacterCount){
                    return false
                }
                
                
                let allowedCharacters = CharacterSet.letters
                
                let space = CharacterSet.init(charactersIn: " ")
                
                let spacestr = string.trimmingCharacters(in: space)
                
                let unwantedStr = string.trimmingCharacters(in: allowedCharacters)
                
                return unwantedStr.characters.count == 0 ||  spacestr.characters.count == 0
                
            }}
        
        if textField.reachedMaxLength(range, string: string) || !string.shouldAllow(textField.allowedCharacters){
            return false
        }
        
        
        return textField.formatText(string)
    }
    
      //MARK:- borderColors

    func borderColors(){
        
        savedCardButtonOutLet.layer.borderWidth = 1
        
    
        savedCardButtonOutLet.layer.borderColor = UIColor(red:238.0/255.0, green:224.0/255.0, blue:225.0/255.0, alpha: 1.0).cgColor
        
        savedCardButtonOutLet.layer.cornerRadius = 20
        savedCardButtonOutLet.clipsToBounds = true

        
        creditCardButtonOutLet.layer.borderWidth = 1
        creditCardButtonOutLet.layer.borderColor = UIColor(red:238.0/255.0, green:224.0/255.0, blue:225.0/255.0, alpha: 1.0).cgColor
        creditCardButtonOutLet.layer.cornerRadius = 10
        
        
        
        debitCardButtonOutLet.layer.borderWidth = 1
        debitCardButtonOutLet.layer.borderColor = UIColor(red:238.0/255.0, green:224.0/255.0, blue:225.0/255.0, alpha: 1.0).cgColor
        debitCardButtonOutLet.layer.cornerRadius = 10
        
        
        netBankingButtonOutLet.layer.borderWidth = 1
        netBankingButtonOutLet.layer.borderColor = UIColor(red:238.0/255.0, green:224.0/255.0, blue:225.0/255.0, alpha: 1.0).cgColor
        netBankingButtonOutLet.layer.cornerRadius = 10
        
        
    }
    
    //MARK:- Tableview Datasource Methods

    public func numberOfSections(in tableView: UITableView) -> Int{
        
        if(selectedButtonString == "savedCards"){
            
        
            return 4
        }
        return 2
        
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        
        
        if(selectedButtonString == "savedCards"){
            
            if(section == 0){
                return 2
            }else{
                
                let sectiontag = sections[section]
                
                print(sectiontag)
                 return sections[section].collapsed! ? 1 : 2
            }

        }else{
            
            if(section == 0){
                if(addMoneyStr == "AddMoney"){
                   return 1
                }else{
                    return 2
                }
                
            }else{
                return 1
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // Here, we use NSFetchedResultsController
        // And we simply use the section name as title
//        let currSection = fetchedResultsController.sections?[section]
//        let title = currSection!.name
        
        // Dequeue with the reuse identifier
        let cell = self.tableView.dequeueReusableHeaderFooterView(withIdentifier: "CardsTableViewCell")
//        let header = cell as! TableSectionHeader
//        header.titleLabel.text = title
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

         if(addMoneyStr != "AddMoney"){
        if(indexPath.section == 0){
            if(indexPath.row == 0){
             
                    
                    let cell = tableView.dequeueReusableCell(withIdentifier: "PayZanAmountTableViewCell", for: indexPath) as! PayZanAmountTableViewCell
                
                cell.totalAmount.text! = String(totalAmountStr)
                
                cell.usePayZanAmount.text! = String(walletAmount)
                cell.availableBal.text = String(walletAmount)

                    
                    return cell
                
            }
        }
        }
        
     //  if  (indexPath.row == 0) {
            
            if(selectedButtonString == "savedCards"){
                
                if indexPath.section == 0{
                    if(addMoneyStr != "AddMoney"){
                        if indexPath.row == 1{
                            
                            let cardsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CardsTableViewCell", for: indexPath) as! CardsTableViewCell
                            


//                            if addMoneyStr == "AddMoney" {
//                                
//                                cardsTableViewCell.selectBtn.isHidden = true
//                                cardsTableViewCell.usePazanLabel.isHidden = true
//                                cardsTableViewCell.availableBalLabel.isHidden = true
//                                cardsTableViewCell.avialableAmountLbl.isHidden = true
//                                cardsTableViewCell.payZanAmountLbl.isHidden = true
//                                cardsTableViewCell.totalAmountLabel.isHidden = true
             //       cardsTableViewCell.totalAmountLbl.isHidden = true
                            
//                            }
                            
                            if !totalAmountStr.isEmpty {
                                
                                cardsTableViewCell.payingAmount.text! = String(totalAmountStr)
                                
                                
                            }
                            else {
                                
                                cardsTableViewCell.payingAmount.text! = String(addMoneyAmount)
                            }
                            
                   
                            cardsTableViewCell.creditBtn.layer.cornerRadius = 10
                            cardsTableViewCell.debitBtn.layer.cornerRadius = 10
                            cardsTableViewCell.netBankingBtn.layer.cornerRadius = 10
                            cardsTableViewCell.savedBtn.layer.cornerRadius = 10
                            
                            cardsTableViewCell.creditBtn.layer.borderWidth = 0.5
                            cardsTableViewCell.creditBtn.layer.borderColor =  UIColor.init(red: 113/255.0, green: 25/255.0, blue: 34/255.0, alpha: 1.0).cgColor
                            cardsTableViewCell.debitBtn.layer.borderWidth = 0.5
                            cardsTableViewCell.debitBtn.layer.borderColor =  UIColor.init(red: 113/255.0, green: 25/255.0, blue: 34/255.0, alpha: 1.0).cgColor
                            
                            cardsTableViewCell.netBankingBtn.layer.borderWidth = 0.5
                            cardsTableViewCell.netBankingBtn.layer.borderColor = UIColor.init(red: 113/255.0, green: 25/255.0, blue: 34/255.0, alpha: 1.0).cgColor
                            
                            cardsTableViewCell.savedBtn.layer.borderWidth = 0.5
                            cardsTableViewCell.savedBtn.layer.borderColor =  UIColor.init(red: 113/255.0, green: 25/255.0, blue: 34/255.0, alpha: 1.0).cgColor
                            
                            
                            cardsTableViewCell.savedBtn.addTarget(self, action: #selector(savedBtnClicked), for: .touchUpInside)
                            cardsTableViewCell.creditBtn.addTarget(self, action: #selector(creditBtnClicked), for: .touchUpInside)
                            cardsTableViewCell.debitBtn.addTarget(self, action: #selector(debitBtnClicked), for: .touchUpInside)
                            cardsTableViewCell.netBankingBtn.addTarget(self, action: #selector(netBankingBtnClicked), for: .touchUpInside)
                            
//                            cardsTableViewCell.selectBtn.addTarget(self, action: #selector(selectBtnClicked), for: .touchUpInside)
                            

                            
                            return cardsTableViewCell
                        }
                    }else{
                        
                        if indexPath.row == 0{
                            
                            let cardsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CardsTableViewCell", for: indexPath) as! CardsTableViewCell
                            
                            if addMoneyStr == "AddMoney" {
                                
//                                cardsTableViewCell.selectBtn.isHidden = true
//                                cardsTableViewCell.usePazanLabel.isHidden = true
//                                cardsTableViewCell.availableBalLabel.isHidden = true
//                                cardsTableViewCell.avialableAmountLbl.isHidden = true
//                                cardsTableViewCell.payZanAmountLbl.isHidden = true
//                                cardsTableViewCell.totalAmountLabel.isHidden = true
//                                cardsTableViewCell.totalAmountLbl.isHidden = true
                                
                            }
                            
                            if !totalAmountStr.isEmpty {
                                
//                            cardsTableViewCell.totalAmountLbl.text! = String(totalAmountStr)
                                
                            }
                            else {
                                
//                                cardsTableViewCell.totalAmountLbl.text! = String(addMoneyAmount)
                            }
                            cardsTableViewCell.payingAmount.text! = String(addMoneyAmount)
//                            cardsTableViewCell.payZanAmountLbl.text! = String(walletAmount)
//                            cardsTableViewCell.avialableAmountLbl.text = String(walletAmount)
                            
                            cardsTableViewCell.creditBtn.layer.cornerRadius = 10
                            cardsTableViewCell.debitBtn.layer.cornerRadius = 10
                            cardsTableViewCell.netBankingBtn.layer.cornerRadius = 10
                            cardsTableViewCell.savedBtn.layer.cornerRadius = 10
                            
                            cardsTableViewCell.creditBtn.layer.borderWidth = 0.5
                            cardsTableViewCell.creditBtn.layer.borderColor =  UIColor.init(red: 113/255.0, green: 25/255.0, blue: 34/255.0, alpha: 1.0).cgColor
                            cardsTableViewCell.debitBtn.layer.borderWidth = 0.5
                            cardsTableViewCell.debitBtn.layer.borderColor =  UIColor.init(red: 113/255.0, green: 25/255.0, blue: 34/255.0, alpha: 1.0).cgColor
                            
                            cardsTableViewCell.netBankingBtn.layer.borderWidth = 0.5
                            cardsTableViewCell.netBankingBtn.layer.borderColor = UIColor.init(red: 113/255.0, green: 25/255.0, blue: 34/255.0, alpha: 1.0).cgColor
                            
                            cardsTableViewCell.savedBtn.layer.borderWidth = 0.5
                            cardsTableViewCell.savedBtn.layer.borderColor =  UIColor.init(red: 113/255.0, green: 25/255.0, blue: 34/255.0, alpha: 1.0).cgColor
                            
                            
                            cardsTableViewCell.savedBtn.addTarget(self, action: #selector(savedBtnClicked), for: .touchUpInside)
                            cardsTableViewCell.creditBtn.addTarget(self, action: #selector(creditBtnClicked), for: .touchUpInside)
                            cardsTableViewCell.debitBtn.addTarget(self, action: #selector(debitBtnClicked), for: .touchUpInside)
                            cardsTableViewCell.netBankingBtn.addTarget(self, action: #selector(netBankingBtnClicked), for: .touchUpInside)
                            
//                            cardsTableViewCell.selectBtn.addTarget(self, action: #selector(selectBtnClicked), for: .touchUpInside)
                            
                            
                            
                            return cardsTableViewCell
                        }
                    }
    
                }
                else{
                
                
                
                let section = indexPath.section
                let row = getRowIndex(indexPath.row)
                previousSection = clickedSection
                
                if(row == 0){
                    
                    let expandedCell = tableView.dequeueReusableCell(withIdentifier: "ExpandedCell", for: indexPath) as! ExpandedCell
                    let isCollapsed = sections[section].collapsed!
                    expandedCell.bottomLabel.isHidden = isCollapsed ? false : true
                    
                    if isCollapsed == false {
                    
                        expandedCell.radioButton.setImage(UIImage(named: "selectedBox.png"), for: .normal)
                        
                    }
                    
                    else {
                        expandedCell.radioButton.setImage(UIImage(named: "unselectedBox.png"), for: .normal)
                     
                    }
                    
               
                    
                 

                    return expandedCell
                    
                }
                else{
                    let expandableCell = tableView.dequeueReusableCell(withIdentifier: "ExpandableCell", for: indexPath) as! ExpandableCell
                    
                    expandableCell.CVVTextField.keyboardType = .decimalPad
                    
                    
                    expandableCell.CVVTextField.validationType = .creditCard
                    
                    expandableCell.CVVTextField.maxLengthTextField = 3
                    
                    expandableCell.CVVTextField.text = cvvStr
                    expandableCell.CVVTextField.delegate = self
                    expandableCell.CVVTextField.tag = 0
                    

                    
                    return expandableCell
                }

            }
            
            }
            else if(selectedButtonString == "creditCard"){
                
                if indexPath.section == 0{
                    if(addMoneyStr != "AddMoney"){
                        if(indexPath.row == 1){
                            let cardsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CardsTableViewCell", for: indexPath) as! CardsTableViewCell
                            
                            cardsTableViewCell.savedBtn.addTarget(self, action: #selector(savedBtnClicked), for: .touchUpInside)
                            cardsTableViewCell.creditBtn.addTarget(self, action: #selector(creditBtnClicked), for: .touchUpInside)
                            cardsTableViewCell.debitBtn.addTarget(self, action: #selector(debitBtnClicked), for: .touchUpInside)
                            cardsTableViewCell.netBankingBtn.addTarget(self, action: #selector(netBankingBtnClicked), for: .touchUpInside)
                            
                            
                            return cardsTableViewCell
                        }
                    }else{
                        if(indexPath.row == 0){
                            let cardsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CardsTableViewCell", for: indexPath) as! CardsTableViewCell
                            
                            cardsTableViewCell.savedBtn.addTarget(self, action: #selector(savedBtnClicked), for: .touchUpInside)
                            cardsTableViewCell.creditBtn.addTarget(self, action: #selector(creditBtnClicked), for: .touchUpInside)
                            cardsTableViewCell.debitBtn.addTarget(self, action: #selector(debitBtnClicked), for: .touchUpInside)
                            cardsTableViewCell.netBankingBtn.addTarget(self, action: #selector(netBankingBtnClicked), for: .touchUpInside)
                            
                            
                            return cardsTableViewCell
                        }
                    }
              
                }
                
                else {
                    
                let cell = tableView.dequeueReusableCell(withIdentifier: "CreditCardTableViewCell", for: indexPath) as! CreditCardTableViewCell
                
                cell.cardNumberTextField.keyboardType = .decimalPad
                cell.cvvTF.keyboardType = .decimalPad
                cell.cvvTF.maxLengthTextField = 3
                    
                cell.cardNumberTextField.delegate = self
                cell.cardHoldersTextField.delegate = self
                cell.monthTextField.delegate = self
                cell.yearTextField.delegate = self
                cell.cvvTF.delegate = self
                    cell.cardLabelTextField.delegate = self
                
                cell.monthTextField.tag = 3
                cell.yearTextField.tag = 4
                cell.cardNumberTextField.tag = 8
                cell.cardHoldersTextField.tag = 9
                cell.cardLabelTextField.tag = 10
                cell.cvvTF.tag = 13
                
                //Programmatic UITextField setup
                cell.cardNumberTextField.validationType = .creditCard
                cell.cardNumberTextField.format = "xxxx xxxx xxxx xxxx"
                cell.cardNumberTextField.maxLengthTextField = 19
                cell.cardNumberTextField.jumpOrder = 1
                    
                cell.cardNumberTextField.placeholder = "app.CardNumber".localize()
//                cell.cardNumberTextField.selectedTitle = "app.CardNumber".localize()
//                cell.cardNumberTextField.title = "app.CardNumber".localize()
//                cell.cardNumberTextField.setLeftPaddingPoints(4)
                    
                cell.cardHoldersTextField.placeholder = "app.CardHolder'sname".localize()
//                cell.cardHoldersTextField.selectedTitle = "app.CardHolder'sname".localize()
//                cell.cardHoldersTextField.title = "app.CardHolder'sname".localize()
                cell.cardHoldersTextField.maxLengthTextField = 40
//                cell.cardHoldersTextField.setLeftPaddingPoints(4)
                    
                cell.cardLabelTextField.placeholder = "app.CardLabel(optional)".localize()
//                cell.cardLabelTextField.selectedTitle = "app.CardLabel(optional)".localize()
//                cell.cardLabelTextField.title = "app.CardLabel(optional)".localize()
                cell.cardLabelTextField.maxLengthTextField = 20
//                cell.cardLabelTextField.setLeftPaddingPoints(4)
                    
                cell.payNowBtn.tag = indexPath.row
//                cell.monthTextField.tag = indexPath.row
//                cell.yearTextField.tag = indexPath.row
                    
                cell.payNowBtn.addTarget(self, action: #selector(payNowBtnClicked), for: .touchUpInside)
                
                print(cell.cardNumberTextField.allowedCharacters) //most built in validation types set allowedCharacters for you
                
                cell.monthTextField.delegate = self
                cell.yearTextField.delegate = self
                
                cell.lblRight = UILabel(frame: CGRect(x: cell.cardNumberTextField.frame.size.width - 60,y: 0,width: 60,height: cell.cardNumberTextField.frame.size.height))
                cell.lblRight.textAlignment = .center
                cell.lblRight.font = UIFont.systemFont(ofSize: 10)
                cell.lblRight.textColor = UIColor.lightGray
                cell.cardNumberTextField.rightView = cell.lblRight
                cell.cardNumberTextField.rightViewMode = .always
                
//                cell.monthTextField = activeTextField
//                cell.yearTextField = activeTextField
                cell.monthTextField.text = selectedMonthStr
                cell.yearTextField.text = selectedYearStr
                
//                cell.cardHoldersTextField.text = creditholderNameStr

                
                return cell
                }
                
            }
            
            else if(selectedButtonString == "debitCard"){
                
                if indexPath.section == 0{
                    if(addMoneyStr != "AddMoney"){
                        if(indexPath.row == 1){
                            let cardsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CardsTableViewCell", for: indexPath) as! CardsTableViewCell
                            
                            cardsTableViewCell.savedBtn.addTarget(self, action: #selector(savedBtnClicked), for: .touchUpInside)
                            cardsTableViewCell.creditBtn.addTarget(self, action: #selector(creditBtnClicked), for: .touchUpInside)
                            cardsTableViewCell.debitBtn.addTarget(self, action: #selector(debitBtnClicked), for: .touchUpInside)
                            cardsTableViewCell.netBankingBtn.addTarget(self, action: #selector(netBankingBtnClicked), for: .touchUpInside)
                            
                            
                            return cardsTableViewCell
                        }
                    }else{
                        if(indexPath.row == 0){
                            let cardsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CardsTableViewCell", for: indexPath) as! CardsTableViewCell
                            
                            cardsTableViewCell.savedBtn.addTarget(self, action: #selector(savedBtnClicked), for: .touchUpInside)
                            cardsTableViewCell.creditBtn.addTarget(self, action: #selector(creditBtnClicked), for: .touchUpInside)
                            cardsTableViewCell.debitBtn.addTarget(self, action: #selector(debitBtnClicked), for: .touchUpInside)
                            cardsTableViewCell.netBankingBtn.addTarget(self, action: #selector(netBankingBtnClicked), for: .touchUpInside)
                            
                            
                            return cardsTableViewCell
                        }
                    }
             
                }
                
                else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DebitCardTableViewCell", for: indexPath) as! DebitCardTableViewCell
                
                cell.cardNumberTxtField.delegate = self
                cell.cardHoldersTxtField.delegate = self
                cell.monthTxtField.delegate = self
                cell.yearTxtField.delegate = self
                cell.cvvTF.delegate = self
                cell.cardLabelTxtField.delegate = self
                
                cell.cardNumberTxtField.keyboardType = .decimalPad
                cell.cvvTF.keyboardType = .decimalPad
                cell.cvvTF.maxLengthTextField = 3
                    
                    
                cell.monthTxtField.tag = 1
                cell.yearTxtField.tag = 2
                cell.cardNumberTxtField.tag = 5
                cell.cardHoldersTxtField.tag = 6
                cell.cardLabelTxtField.tag = 7
                cell.cvvTF.tag = 12
                    
                cell.cardNumberTxtField.validationType = .creditCard
                cell.cardNumberTxtField.format = "xxxx xxxx xxxx xxxx"
                cell.cardNumberTxtField.maxLengthTextField = 19
                cell.cardNumberTxtField.jumpOrder = 1
                
                
                cell.cardNumberTxtField.placeholder = "app.CardNumber".localize()
//                cell.cardNumberTxtField.selectedTitle = "app.CardNumber".localize()
//                cell.cardNumberTxtField.title = "app.CardNumber".localize()
//                cell.cardNumberTxtField.setLeftPaddingPoints(4)
                    
                cell.cardHoldersTxtField.placeholder = "app.CardHolder'sname".localize()
//                cell.cardHoldersTxtField.selectedTitle = "app.CardHolder'sname".localize()
//                cell.cardHoldersTxtField.title = "app.CardHolder'sname".localize()
                cell.cardHoldersTxtField.maxLengthTextField = 40
//                cell.cardHoldersTxtField.setLeftPaddingPoints(4)
                    
                cell.cardLabelTxtField.placeholder = "app.CardLabel(optional)".localize()
//                cell.cardLabelTxtField.selectedTitle = "app.CardLabel(optional)".localize()
//                cell.cardLabelTxtField.title = "app.CardLabel(optional)".localize()
                cell.cardLabelTxtField.maxLengthTextField = 20
//                cell.cardLabelTxtField.setLeftPaddingPoints(4)
            
//                cell.monthTxtField = activeTextField
//                cell.yearTxtField = activeTextField
                cell.monthTxtField.text = selectedMonthStr
                cell.yearTxtField.text = selectedYearStr
//                cell.cardHoldersTxtField.text = debitholderNameStr
                    
                    
                cell.lblRight = UILabel(frame: CGRect(x: cell.cardNumberTxtField.frame.size.width - 60,y: 0,width: 60,height: cell.cardNumberTxtField.frame.size.height))
                cell.lblRight.textAlignment = .center
                cell.lblRight.font = UIFont.systemFont(ofSize: 10)
                cell.lblRight.textColor = UIColor.lightGray
                cell.cardNumberTxtField.rightView = cell.lblRight
                cell.cardNumberTxtField.rightViewMode = .always
                    
                cell.payNowBtn.tag = indexPath.row
//                cell.monthTxtField.tag = indexPath.row
//                cell.yearTxtField.tag = indexPath.row
                cell.payNowBtn.addTarget(self, action: #selector(debitPayBtnClicked), for: .touchUpInside)

                
                return cell
                    
                }
            }
            
            else if(selectedButtonString == "netBanking"){
                
                if indexPath.section == 0{
                      if(addMoneyStr != "AddMoney"){
                        if(indexPath.row == 1){
                            let cardsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CardsTableViewCell", for: indexPath) as! CardsTableViewCell
                            
                            cardsTableViewCell.savedBtn.addTarget(self, action: #selector(savedBtnClicked), for: .touchUpInside)
                            cardsTableViewCell.creditBtn.addTarget(self, action: #selector(creditBtnClicked), for: .touchUpInside)
                            cardsTableViewCell.debitBtn.addTarget(self, action: #selector(debitBtnClicked), for: .touchUpInside)
                            cardsTableViewCell.netBankingBtn.addTarget(self, action: #selector(netBankingBtnClicked), for: .touchUpInside)
                            
                            
                            return cardsTableViewCell
                        }
                      }else{
                        if(indexPath.row == 0){
                            let cardsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CardsTableViewCell", for: indexPath) as! CardsTableViewCell
                            
                            cardsTableViewCell.savedBtn.addTarget(self, action: #selector(savedBtnClicked), for: .touchUpInside)
                            cardsTableViewCell.creditBtn.addTarget(self, action: #selector(creditBtnClicked), for: .touchUpInside)
                            cardsTableViewCell.debitBtn.addTarget(self, action: #selector(debitBtnClicked), for: .touchUpInside)
                            cardsTableViewCell.netBankingBtn.addTarget(self, action: #selector(netBankingBtnClicked), for: .touchUpInside)
                            
                            
                            return cardsTableViewCell
                        }
                    }
               
                }
                
                else {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "NetBankingTableViewCell", for: indexPath) as! NetBankingTableViewCell
                
                cell.selectBankTextField.delegate = self
                    
                cell.selectBankTextField.tag = 11
                    
                cell.selectBankTextField.text = selectedBankStr
                    
//                cell.selectBankTextField = activeTextField as! AkiraTextField
                    
                    cell.selectBankTextField.placeholder = "app.SelectBank".localize()
//                    cell.selectBankTextField.selectedTitle = "app.SelectBank".localize()
//                    cell.selectBankTextField.title = "app.SelectBank".localize()
//                    cell.selectBankTextField.setLeftPaddingPoints(4)
                
                return cell
                    
                }

        }
      return UITableViewCell()
      

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if(selectedButtonString == "savedCards"){
            
           //  select = true
            if indexPath.section == 0 {}
            
            else {
        
              
            if(indexPath.row == 0){
                
            
                
                
  
                manageToggle(sectionNum: indexPath.section)
                
               

            }
            
            tableView.deselectRow(at: indexPath, animated: true)
                

        }
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      
        if(selectedButtonString == "savedCards"){
            
            if(addMoneyStr != "AddMoney"){
                if indexPath.section == 0{
                    
                    if indexPath.row == 0 {
                        
                        return 90
                    }
                    else if indexPath.row == 1{
                        
                        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
                            
                            return 180
                            
                        }else{
                            
                            return 130
                            
                        }
                    }
                }
            }else{
                 if indexPath.section == 0{
                    if indexPath.row == 0{
                        
                        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
                            
                            return 180
                            
                        }else{
                            
                            return 130
                            
                        }
                    }
                }
                }
                
            

            let section = indexPath.section
            let row = getRowIndex(indexPath.row)
            if(row == 0){
                return 50
                
            }
            return sections[section].collapsed! ? 0 : 120
            
        }
        
        else {
        
            if(addMoneyStr != "AddMoney"){
                if indexPath.section == 0{
                    
                    if indexPath.row == 0 {
                        
                        return 90
                    }
                    else if indexPath.row == 1{
                        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
                            
                            return 180

                        }else{
                            
                            return UITableViewAutomaticDimension
  
                        }
                    }
                }
            }else{
                if indexPath.section == 0{
                    if indexPath.row == 0{
                        
                        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
                            
                            return 180
                            
                        }else{
                            
                            return UITableViewAutomaticDimension
                            
                        }
                    }
                }
            }

            
//            else {
//                
//            return UITableViewAutomaticDimension
//            
//            }
        
        }
      
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
    }

    
     func debitPayBtnClicked(_ sender: UIButton){
        
        let indexPath : IndexPath = IndexPath(row: sender.tag, section: 1)
        
        if let cardCell : DebitCardTableViewCell = tableView.cellForRow(at: indexPath) as? DebitCardTableViewCell {
            
            cardCell.cardNumberTxtField.text = cardCell.cardNumberTxtField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
            cardCell.cardHoldersTxtField.text = cardCell.cardHoldersTxtField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
           
            cardCell.monthTxtField.text = cardCell.monthTxtField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
            cardCell.yearTxtField.text = cardCell.yearTxtField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
             cardCell.cvvTF.text = cardCell.cvvTF.text!.trimmingCharacters(in: CharacterSet.whitespaces)
           
            
            let cardNumField:NSString = debitCardNoStr as NSString
            let cardHolderField:NSString = debitholderNameStr as NSString
            let monthField:NSString = self.selectedMonthStr as NSString
            let yearField:NSString = self.selectedYearStr as NSString
            let cvvField:NSString = self.debitCvv as NSString
            
            var errorMessage:NSString?
            
            if (cardNumField.length<=0) {
                
                errorMessage=GlobalSupportingClass.blankCardNumberErrorMessage() as String as String as NSString?
            }
            
            else if (monthField.length<=0) {
            
                errorMessage=GlobalSupportingClass.blankMonthErrorMessage() as String as String as NSString?
                
            }
            else if (yearField.length<=0) {
                
                errorMessage=GlobalSupportingClass.blankYearErrorMessage() as String as String as NSString?
                
            }
            else if (cvvField.length<=0) {
                
                errorMessage=GlobalSupportingClass.blankCvvErrorMessage() as String as String as NSString?
                
            }
            else if (cardHolderField.length<=0) {
                
                errorMessage=GlobalSupportingClass.blankCardHolderErrorMessage() as String as String as NSString?
            }
            
           
            
            if let errorMsg = errorMessage{
                
                if (cardNumField.length<=0) {
                    
                    self.showAlertViewWithTitle("app.Alert".localize(), message: errorMsg as String, buttonTitle: "app.Retry".localize())
                    
//                    cardCell.cardNumberTxtField.errorMessage = errorMsg as String
//                    
//                    cardCell.cardNumberTxtField.errorLabel.textColor = .red
                }
                
                else if (monthField.length<=0) {
                
                    self.showAlertViewWithTitle("app.Alert".localize(), message: errorMsg as String, buttonTitle: "app.Retry".localize())
        
                }
                else if (yearField.length<=0) {
                    
                     self.showAlertViewWithTitle("app.Alert".localize(), message: errorMsg as String, buttonTitle: "app.Retry".localize())
                }
                    
                else if (cvvField.length<=0) {
                    
                   self.showAlertViewWithTitle("app.Alert".localize(), message: errorMsg as String, buttonTitle: "app.Retry".localize())
                    
                }
                else if (cardHolderField.length<=0) {
                    
                    self.showAlertViewWithTitle("app.Alert".localize(), message: errorMsg as String, buttonTitle: "app.Retry".localize())
                    
//                    cardCell.cardHoldersTxtField.errorMessage = errorMsg as String
//                    
//                    cardCell.cardHoldersTxtField.errorLabel.textColor = .red
                }
                
                
            }
            
            else{
                
                print("success")
                
                if addMoneyStr == "AddMoney"{
                    
                    postWalletMoneyService()
                    
                }
                
                
            }
            
        }
        
    }
    
    //MARK:- postWalletMoneyService
    
    
    func postWalletMoneyService(){
        
        
        if !(walletId?.isEmpty)! && !(userId?.isEmpty)! {
            
            
            let walletField:String = totalAmountLbl.text!
            
            let  strUrl = walletUrl
            
//            let trimmedString = debitCardNoStr.trimmingCharacters(in: .whitespaces)
            let formattedString = debitCardNoStr.replacingOccurrences(of: " ", with: "")
            
            let last2 = selectedYearStr.substring(from:selectedYearStr.index(selectedYearStr.endIndex, offsetBy: -2))
            
            let cardExpiryDate = selectedMonthStr + "" + last2
            
            let cvvNo = Int(debitCvv)!
            
            
            let currentDate = GlobalSupportingClass.getCurrentDate()
            
            print("currentDate\(currentDate)")
            
            let dictParams = ["Id": 0,
                              "WalletId": walletId!,
                              "Amount": walletField,
                              "TransactionTypeId": 29,
                              "ReasonTypeId": 32,
                              "IsActive": true,
                              "NameOnCard": debitholderNameStr,
                              "CardNumber": formattedString,
                              "CardExpiry": cardExpiryDate,
                              "CVV": cvvNo,
                              "Currency": "USD"
                ] as NSDictionary
            
            print("dic params \(dictParams)")
            
            let dictHeaders = ["":"","":""] as NSDictionary
            
            
            print("dictHeader:\(dictHeaders)")
            
            serviceController.requestPOSTURL(strURL: strUrl as NSString, postParams: dictParams, postHeaders: dictHeaders, successHandler:{(result) in
                DispatchQueue.main.async()
                    {
                        
                        print("result:\(result)")
                        
                        let respVO:ResultVo = Mapper().map(JSONObject: result)!
                        
                        
                        print("responseString = \(respVO)")
                        
                        
                        let statusCode = respVO.IsSuccess
                        
                        print("StatusCode:\(String(describing: statusCode))")
                        
                        
                        if statusCode == true
                        {
                            
                            let successMsg = respVO.EndUserMessage
                            
                            let waleetBalance = respVO.Result?.Balance
                            
                            let defaults = UserDefaults.standard
                            
                            defaults.set(waleetBalance, forKey: "walletAmount")
                            
                            defaults.set("1", forKey: "emptyField")
                            
                            self.navigationController?.popViewController(animated: true)
                            
//                            self.selectedMonthStr = ""
//                            self.selectedYearStr = ""
                            
                            self.appDelegate.window?.makeToast(successMsg!, duration:kToastDuration, position:CSToastPositionCenter)
                            
                            
                        }
                        else if statusCode == false{
                            
//                            self.selectedMonthStr = ""
//                            self.selectedYearStr = ""
                            
                            if !(respVO.ValidationErrors?.isEmpty)! {
                                
                                let failMsg = respVO.ValidationErrors?[0].Description
                                
                                self.showAlertViewWithTitle("app.Alert".localize(), message: failMsg!, buttonTitle: "Ok".localize())
                                
                            }
                            else if respVO.EndUserMessage != nil {
                                
                                let failMsg = respVO.EndUserMessage
                                
                                self.showAlertViewWithTitle("app.Alert".localize(), message: failMsg!, buttonTitle: "Ok".localize())
                                
                            }
                         
                        }
                        
                }
            }, failureHandler: {(error) in
                
                if(error == "unAuthorized"){
                    serviceController.refreshTokenForLogin(successHandler:{(result) in
                        DispatchQueue.main.async()
                            {
                                
                                self.postWalletMoneyService()
                                
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
    
    func creditPostWalletMoneyService(){
        
        
        if !(walletId?.isEmpty)! && !(userId?.isEmpty)! {
            
            
            let walletField:String = totalAmountLbl.text!
            
            let  strUrl = walletUrl
            
            //            let trimmedString = debitCardNoStr.trimmingCharacters(in: .whitespaces)
            let formattedString = creditCardNoStr.replacingOccurrences(of: " ", with: "")
            
            let last2 = selectedYearStr.substring(from:selectedYearStr.index(selectedYearStr.endIndex, offsetBy: -2))
            
            let cardExpiryDate = selectedMonthStr + "" + last2
            
            let cvvNo = Int(creditCvv)!
            
            
            let currentDate = GlobalSupportingClass.getCurrentDate()
            
            print("currentDate\(currentDate)")
            
            let dictParams = ["Id": 0,
                              "WalletId": walletId!,
                              "Amount": walletField,
                              "TransactionTypeId": 29,
                              "ReasonTypeId": 32,
                              "IsActive": true,
                              "NameOnCard": creditholderNameStr,
                              "CardNumber": formattedString,
                              "CardExpiry": cardExpiryDate,
                              "CVV": cvvNo,
                              "Currency": "USD"
                ] as NSDictionary
            
            print("dic params \(dictParams)")
            
            let dictHeaders = ["":"","":""] as NSDictionary
            
            
            print("dictHeader:\(dictHeaders)")
            
            serviceController.requestPOSTURL(strURL: strUrl as NSString, postParams: dictParams, postHeaders: dictHeaders, successHandler:{(result) in
                DispatchQueue.main.async()
                    {
                        
                        print("result:\(result)")
                        
                        let respVO:ResultVo = Mapper().map(JSONObject: result)!
                        
                        
                        print("responseString = \(respVO)")
                        
                        
                        let statusCode = respVO.IsSuccess
                        
                        print("StatusCode:\(String(describing: statusCode))")
                        
                        
                        if statusCode == true
                        {
                            
                            let successMsg = respVO.EndUserMessage
                            
                            let waleetBalance = respVO.Result?.Balance
                            
                            let defaults = UserDefaults.standard
                            
                            defaults.set(waleetBalance, forKey: "walletAmount")
                            
                            defaults.set("1", forKey: "emptyField")
                            
                            
                            self.navigationController?.popViewController(animated: true)
                            
//                            self.selectedMonthStr = ""
//                            self.selectedYearStr = ""
                            
                            self.appDelegate.window?.makeToast(successMsg!, duration:kToastDuration, position:CSToastPositionCenter)
                            
                            
                        }
                        else if statusCode == false{
                            
//                            self.selectedMonthStr = ""
//                            self.selectedYearStr = ""
                            
                            if !(respVO.ValidationErrors?.isEmpty)! {
                                
                                let failMsg = respVO.ValidationErrors?[0].Description
                                
                                self.showAlertViewWithTitle("app.Alert".localize(), message: failMsg!, buttonTitle: "Ok".localize())
                                
                            }
                            else if respVO.EndUserMessage != nil {
                                
                                let failMsg = respVO.EndUserMessage
                                
                                self.showAlertViewWithTitle("app.Alert".localize(), message: failMsg!, buttonTitle: "Ok".localize())
                                
                            }
                            
                        }
                        
                }
            }, failureHandler: {(error) in
                
                if(error == "unAuthorized"){
                    serviceController.refreshTokenForLogin(successHandler:{(result) in
                        DispatchQueue.main.async()
                            {
                                
                                self.postWalletMoneyService()
                                
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

   
    func payNowBtnClicked(_ sender: UIButton){
        
        
        let indexPath : IndexPath = IndexPath(row: sender.tag, section: 1)
        
        if let cardCell : CreditCardTableViewCell = tableView.cellForRow(at: indexPath) as? CreditCardTableViewCell {
            
            cardCell.cardNumberTextField.text = cardCell.cardNumberTextField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
            cardCell.cardHoldersTextField.text = cardCell.cardHoldersTextField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
            cardCell.cardLabelTextField.text = cardCell.cardLabelTextField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
            cardCell.monthTextField.text = cardCell.monthTextField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
            cardCell.yearTextField.text = cardCell.yearTextField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
            cardCell.cvvTF.text = cardCell.cvvTF.text!.trimmingCharacters(in: CharacterSet.whitespaces)

            
            
            let cardNumField:NSString = cardCell.cardNumberTextField.text! as NSString
            let cardHolderField:NSString = cardCell.cardHoldersTextField.text! as NSString
            let monthField:NSString = self.selectedMonthStr as NSString
            let yearField:NSString = self.selectedYearStr as NSString
            let cvvField:NSString = self.creditCvv as NSString

            
            var errorMessage:NSString?
            
            if (cardNumField.length<=0) {
                errorMessage=GlobalSupportingClass.blankCardNumberErrorMessage() as String as String as NSString?
            }
                
            else if (monthField.length<=0) {
                
                errorMessage=GlobalSupportingClass.blankMonthErrorMessage() as String as String as NSString?
                
            }
                
            else if (yearField.length<=0) {
                
                errorMessage=GlobalSupportingClass.blankYearErrorMessage() as String as String as NSString?
                
            }
            else if (cvvField.length<=0) {
                
                errorMessage=GlobalSupportingClass.blankCvvErrorMessage() as String as String as NSString?
                
            }
            else if (cardHolderField.length<=0) {
                errorMessage=GlobalSupportingClass.blankCardHolderErrorMessage() as String as String as NSString?
            }
            
            
            if let errorMsg = errorMessage{
                
                if (cardNumField.length<=0) {
                    
                    self.showAlertViewWithTitle("app.Alert".localize(), message: errorMsg as String, buttonTitle: "app.Retry".localize())
                    
//                    cardCell.cardNumberTextField.errorMessage = errorMsg as String
//                    
//                     cardCell.cardNumberTextField.errorLabel.textColor = .red
                }
                else if (monthField.length<=0) {
                    
                    self.showAlertViewWithTitle("app.Alert".localize(), message: errorMsg as String, buttonTitle: "app.Retry".localize())
                    
                }
                else if (yearField.length<=0) {
                    
                    self.showAlertViewWithTitle("app.Alert".localize(), message: errorMsg as String, buttonTitle: "app.Retry".localize())
                }
                else if (cvvField.length<=0) {
                    
                    self.showAlertViewWithTitle("app.Alert".localize(), message: errorMsg as String, buttonTitle: "app.Retry".localize())
                }
                else if (cardHolderField.length<=0) {
                    
                    
                    self.showAlertViewWithTitle("app.Alert".localize(), message: errorMsg as String, buttonTitle: "app.Retry".localize())
                    
//                    cardCell.cardHoldersTextField.errorMessage = errorMsg as String
//                    
//                    cardCell.cardHoldersTextField.errorLabel.textColor = .red
                }
                
                
            }
            
            else{
                
                print("success")
                
                if addMoneyStr == "AddMoney"{
                    
                    creditPostWalletMoneyService()
                    
                }
                
            }
            
        }
        
    }

    
    
    func manageToggle(sectionNum : Int){
        
        clickedSection = sectionNum
        let section = sectionNum
        let collapsed = sections[section].collapsed
        
    //    select = true
        // Toggle collapse
        // sections[section].collapsed = !collapsed!
        

        
                if(previousSection >= 0 && previousSection != clickedSection)
            
        {
            
            sections[previousSection].collapsed = true
           

            
            tableView.reloadSections(IndexSet(integer: previousSection), with: .automatic)
            


            
        }
        // Toggle collapse
        sections[section].collapsed = !collapsed!
        
        
        tableView.reloadSections(IndexSet(integer: clickedSection), with: .automatic)
        
    }
    
    
    
    
    
    func getRowIndex(_ row: NSInteger) -> Int {
        var index = row
        let indices = getHeaderIndices()
        
        for i in 0..<indices.count {
            if i == indices.count - 1 || row < indices[i + 1] {
                index -= indices[i]
                break
            }
        }
        
        return index
    }
    
    func getHeaderIndices() -> [Int] {
        var index = 0
        var indices: [Int] = []
        
        for section in sections {
            indices.append(index)
            index += section.items.count + 1
        }
        
        return indices
    }
    
            override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func donePressed(){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
//
        
        
        
        datePicker.datePickerMode = UIDatePickerMode.date
        
        
        
        datePicker.minimumDate = Date()
         dateStr = dateFormatter.string(from: datePicker.date)
        
        
        
        self.view.endEditing(true)
        
        
        tableView.reloadData()
    }
    
    
    //MARK:-  Button Actions
    
    @IBAction func savedCardsButtonAction(_ sender: Any) {
        selectedButtonString = "savedCards"

        creditCardButtonOutLet.backgroundColor = UIColor.white
        debitCardButtonOutLet.backgroundColor = UIColor.white
        netBankingButtonOutLet.backgroundColor = UIColor.white

        
        savedCardButtonOutLet.backgroundColor = UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)
        
        savedCardsLabel.textColor = UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)

        creditCardLabel.textColor =  UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)

        debitCardLabel.textColor =  UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)

        netBankingLabel.textColor = UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)

        
        savedCardsLabel.textColor = UIColor.red
        


        savedCardButtonOutLet.setImage(UIImage(named: "payment_savedcaddetails_white"), for: UIControlState.normal)

        
        debitCardButtonOutLet.setImage(UIImage(named: "payment_creitcard_active"), for: UIControlState.normal)
        netBankingButtonOutLet.setImage(UIImage(named: "payment_bank_active"), for: UIControlState.normal)
        creditCardButtonOutLet.setImage(UIImage(named: "payment_creitcard_active"), for: UIControlState.normal)
        
     //   viewBackGroundView.layer.borderColor = UIColor(red: 151.0/255.0, green: 12.0/255.0, blue: 10.0/255.0, alpha: 1.0).cgColor

        tableView.reloadData()
        
    }
    
    
    @IBAction func creditCardButtonAction(_ sender: Any) {
        selectedButtonString = "creditCard"
        
    
        
        savedCardButtonOutLet.backgroundColor = UIColor.white
        netBankingButtonOutLet.backgroundColor = UIColor.white
        debitCardButtonOutLet.backgroundColor = UIColor.white

        creditCardButtonOutLet.backgroundColor = UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)
        
        savedCardsLabel.textColor = UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)
        creditCardLabel.textColor =  UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)

        debitCardLabel.textColor =  UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)
        netBankingLabel.textColor = UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)

        
        creditCardLabel.textColor = UIColor.red
      
        
        creditCardButtonOutLet.setImage(UIImage(named: "payment_creditcard_white"), for: UIControlState.normal)
        
        savedCardButtonOutLet.setImage(UIImage(named: "payment_savedcaddetails_active"), for: UIControlState.normal)
        debitCardButtonOutLet.setImage(UIImage(named: "payment_creitcard_active"), for: UIControlState.normal)
        netBankingButtonOutLet.setImage(UIImage(named: "payment_bank_active"), for: UIControlState.normal)
        

        //viewBackGroundView.layer.borderColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
   
        
        
        tableView.reloadData()


    }
    
    @IBAction func debitCardBUttonAction(_ sender: Any) {
        selectedButtonString = "debitCard"
        
        
        
        savedCardButtonOutLet.backgroundColor = UIColor.white
        creditCardButtonOutLet.backgroundColor = UIColor.white
        netBankingButtonOutLet.backgroundColor = UIColor.white

        
        debitCardButtonOutLet.backgroundColor = UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)
        
        
        savedCardsLabel.textColor =  UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)
        
        creditCardLabel.textColor =  UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)
        debitCardLabel.textColor =  UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)
        netBankingLabel.textColor = UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)

        
        debitCardLabel.textColor = UIColor.red
        
        
        debitCardButtonOutLet.setImage(UIImage(named: "payment_creditcard_white"), for: UIControlState.normal)
        
        savedCardButtonOutLet.setImage(UIImage(named: "payment_savedcaddetails_active"), for: UIControlState.normal)
        creditCardButtonOutLet.setImage(UIImage(named: "payment_creitcard_active"), for: UIControlState.normal)
        netBankingButtonOutLet.setImage(UIImage(named: "payment_bank_active"), for: UIControlState.normal)
        
     //   viewBackGroundView.layer.borderColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
        

        
         tableView.reloadData()
    }
    
    @IBAction func netBankingButtonAction(_ sender: Any) {
        selectedButtonString = "netBanking"
        
        viewBackGroundView.layer.borderColor = UIColor.white.cgColor

        
        
        savedCardButtonOutLet.backgroundColor = UIColor.white
        creditCardButtonOutLet.backgroundColor = UIColor.white
        debitCardButtonOutLet.backgroundColor = UIColor.white

        netBankingButtonOutLet.backgroundColor = UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)
        
        savedCardsLabel.textColor =  UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)
        
        debitCardLabel.textColor =  UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)

        creditCardLabel.textColor =  UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)
        netBankingLabel.textColor = UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)

        netBankingLabel.textColor = UIColor.white
        
        netBankingButtonOutLet.setImage(UIImage(named: "payment_bank_white"), for: UIControlState.normal)
        
        savedCardButtonOutLet.setImage(UIImage(named: "payment_savedcaddetails_active"), for: UIControlState.normal)
        debitCardButtonOutLet.setImage(UIImage(named: "payment_creitcard_active"), for: UIControlState.normal)
        creditCardButtonOutLet.setImage(UIImage(named: "payment_creitcard_active"), for: UIControlState.normal)
        
        viewBackGroundView.layer.borderColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
        



         tableView.reloadData()
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return pickerDataAry.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        

        
        return pickerDataAry[row]
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    
        if activeTextField.tag == 1 {
 
                if pickerDataAry.count > row {
                    
                    selectedMonthStr = pickerDataAry[row]
                    activeTextField.text = selectedMonthStr
        
        }
    
    
    }
        
        else if activeTextField.tag == 2 {
            
            if pickerDataAry.count > row {
                
                selectedYearStr = pickerDataAry[row]
                activeTextField.text = selectedYearStr
                
            }
            
            }
        
       else if activeTextField.tag == 3 {
            
            if pickerDataAry.count > row {
                
                selectedMonthStr = pickerDataAry[row]
                activeTextField.text = selectedMonthStr
                
            }
            
            
        }
            
        else if activeTextField.tag == 4 {
            
            if pickerDataAry.count > row {
                
                selectedYearStr = pickerDataAry[row]
                activeTextField.text = selectedYearStr
                
            }
            
        }
        
        else if activeTextField.tag == 11 {
            
            if pickerDataAry.count > row {
                activeTextField.text = ""
                selectedBankStr = pickerDataAry[row]
                activeTextField.text = selectedBankStr
                
            }
            
        }
    
    }
    
    
    
    @IBAction func backBtnAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func savedBtnClicked(sender : UIButton){
        let indexPath : IndexPath!
         if(addMoneyStr != "AddMoney"){
            indexPath  = IndexPath(row: 1, section: 0)
         }else{
            indexPath  = IndexPath(row: 0, section: 0)
        }
        
        
        if let cardsTableViewCell : CardsTableViewCell = self.tableView.cellForRow(at: indexPath) as? CardsTableViewCell {
            
            selectedMonthStr = ""
            selectedYearStr = ""
            
            
            cardsTableViewCell.savedCardLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            cardsTableViewCell.creditCardLabel.textColor = #colorLiteral(red: 0.5019607843, green: 0, blue: 0, alpha: 1)
            cardsTableViewCell.debitCardLabel.textColor = #colorLiteral(red: 0.5019607843, green: 0, blue: 0, alpha: 1)
            cardsTableViewCell.netbankingLabel.textColor = #colorLiteral(red: 0.5019607843, green: 0, blue: 0, alpha: 1)
            
            cardsTableViewCell.creditBtn.backgroundColor = UIColor.white
            cardsTableViewCell.debitBtn.backgroundColor = UIColor.white
            cardsTableViewCell.netBankingBtn.backgroundColor = UIColor.white
            
            
            cardsTableViewCell.savedBtn.backgroundColor = UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)
            
            
            cardsTableViewCell.savedBtn.setImage(UIImage(named: "payment_savedcaddetails_white"), for: UIControlState.normal)
            
            
            cardsTableViewCell.creditBtn.setImage(UIImage(named: "payment_creitcard_active"), for: UIControlState.normal)
            cardsTableViewCell.netBankingBtn.setImage(UIImage(named: "payment_bank_active"), for: UIControlState.normal)
            cardsTableViewCell.debitBtn.setImage(UIImage(named: "payment_creitcard_active"), for: UIControlState.normal)
            
            
            
            
        }
        


        selectedButtonString = "savedCards"
        
        creditCardButtonOutLet.backgroundColor = UIColor.white
        debitCardButtonOutLet.backgroundColor = UIColor.white
        netBankingButtonOutLet.backgroundColor = UIColor.white
        
        
        
        savedCardButtonOutLet.backgroundColor = UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)
        
        savedCardsLabel.textColor = UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)
        
        creditCardLabel.textColor =  UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)
        
        debitCardLabel.textColor =  UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)
        
        netBankingLabel.textColor = UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)
        
        
        savedCardsLabel.textColor = UIColor.white
        
        
        
        savedCardButtonOutLet.setImage(UIImage(named: "payment_savedcaddetails_active"), for: UIControlState.normal)
        
        
        debitCardButtonOutLet.setImage(UIImage(named: "payment_creitcard_active"), for: UIControlState.normal)
        netBankingButtonOutLet.setImage(UIImage(named: "payment_bank_active"), for: UIControlState.normal)
        creditCardButtonOutLet.setImage(UIImage(named: "payment_creitcard_active"), for: UIControlState.normal)
        
        viewBackGroundView.layer.borderColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
        
        tableView.reloadData()
        
    }
    
    func creditBtnClicked(sender : UIButton){
        
        let indexPath : IndexPath!
        if(addMoneyStr != "AddMoney"){
            indexPath  = IndexPath(row: 1, section: 0)
        }else{
            indexPath  = IndexPath(row: 0, section: 0)
        }
        
        if let cardsTableViewCell : CardsTableViewCell = self.tableView.cellForRow(at: indexPath) as? CardsTableViewCell {
            
            
            selectedMonthStr = ""
            selectedYearStr = ""
            cardsTableViewCell.savedBtn.backgroundColor = UIColor.white
            cardsTableViewCell.debitBtn.backgroundColor = UIColor.white
            cardsTableViewCell.netBankingBtn.backgroundColor = UIColor.white
            cardsTableViewCell.creditBtn.backgroundColor = UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)
            
            cardsTableViewCell.creditBtn.setImage(UIImage(named: "payment_creditcard_white"), for: UIControlState.normal)
            
            cardsTableViewCell.savedBtn.setImage(UIImage(named: "payment_savedcaddetails_active"), for: UIControlState.normal)
            cardsTableViewCell.debitBtn.setImage(UIImage(named: "payment_creitcard_active"), for: UIControlState.normal)
            cardsTableViewCell.netBankingBtn.setImage(UIImage(named: "payment_bank_active"), for: UIControlState.normal)
            
            cardsTableViewCell.savedCardLabel.textColor = #colorLiteral(red: 0.5019607843, green: 0, blue: 0, alpha: 1)
            cardsTableViewCell.creditCardLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            cardsTableViewCell.debitCardLabel.textColor = #colorLiteral(red: 0.5019607843, green: 0, blue: 0, alpha: 1)
            cardsTableViewCell.netbankingLabel.textColor = #colorLiteral(red: 0.5019607843, green: 0, blue: 0, alpha: 1)
            
        }
        
        selectedButtonString = "creditCard"
        
        
        
        savedCardButtonOutLet.backgroundColor = UIColor.white
        netBankingButtonOutLet.backgroundColor = UIColor.white
        debitCardButtonOutLet.backgroundColor = UIColor.white
        
        creditCardButtonOutLet.backgroundColor = UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)
        
        savedCardsLabel.textColor = UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)
        creditCardLabel.textColor =  UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)
        
        debitCardLabel.textColor =  UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)
        netBankingLabel.textColor = UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)
        
        
        creditCardLabel.textColor = UIColor.white
        savedCardsLabel.textColor = UIColor.red

        
        creditCardButtonOutLet.setImage(UIImage(named: "payment_creditcard_white"), for: UIControlState.normal)
        
        savedCardButtonOutLet.setImage(UIImage(named: "payment_savedcaddetails_active"), for: UIControlState.normal)
        debitCardButtonOutLet.setImage(UIImage(named: "payment_creitcard_active"), for: UIControlState.normal)
        netBankingButtonOutLet.setImage(UIImage(named: "payment_bank_active"), for: UIControlState.normal)
        
        
        viewBackGroundView.layer.borderColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
        
        
        
        tableView.reloadData()
        
    }
    
    func debitBtnClicked(sender : UIButton){
        
        let indexPath : IndexPath!
        if(addMoneyStr != "AddMoney"){
            indexPath  = IndexPath(row: 1, section: 0)
        }else{
            indexPath  = IndexPath(row: 0, section: 0)
        }
        
        if let cardsTableViewCell : CardsTableViewCell = self.tableView.cellForRow(at: indexPath) as? CardsTableViewCell {
            
            selectedMonthStr = ""
            selectedYearStr = ""
        
            cardsTableViewCell.savedCardLabel.textColor = #colorLiteral(red: 0.5019607843, green: 0, blue: 0, alpha: 1)
            cardsTableViewCell.creditCardLabel.textColor = #colorLiteral(red: 0.5019607843, green: 0, blue: 0, alpha: 1)
            cardsTableViewCell.debitCardLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            cardsTableViewCell.netbankingLabel.textColor = #colorLiteral(red: 0.5019607843, green: 0, blue: 0, alpha: 1)
            
            cardsTableViewCell.creditBtn.backgroundColor = UIColor.white
            cardsTableViewCell.savedBtn.backgroundColor = UIColor.white
            cardsTableViewCell.netBankingBtn.backgroundColor = UIColor.white
            cardsTableViewCell.debitBtn.backgroundColor = UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)
            
            cardsTableViewCell.creditBtn.setImage(UIImage(named: "payment_creitcard_active"), for: UIControlState.normal)
            
            cardsTableViewCell.savedBtn.setImage(UIImage(named: "payment_savedcaddetails_active"), for: UIControlState.normal)
            cardsTableViewCell.debitBtn.setImage(UIImage(named: "payment_creditcard_white"), for: UIControlState.normal)
            cardsTableViewCell.netBankingBtn.setImage(UIImage(named: "payment_bank_active"), for: UIControlState.normal)
            
            
        }
        
        selectedButtonString = "debitCard"
        
        
        
        savedCardButtonOutLet.backgroundColor = UIColor.white
        creditCardButtonOutLet.backgroundColor = UIColor.white
        netBankingButtonOutLet.backgroundColor = UIColor.white
        
        
        debitCardButtonOutLet.backgroundColor = UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)
        
        
        savedCardsLabel.textColor =  UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)
        
        creditCardLabel.textColor =  UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)
        debitCardLabel.textColor =  UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)
        netBankingLabel.textColor = UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)
        
        
        debitCardLabel.textColor = UIColor.white
        savedCardsLabel.textColor = UIColor.red

        
        debitCardButtonOutLet.setImage(UIImage(named: "payment_creditcard_white"), for: UIControlState.normal)
        
        savedCardButtonOutLet.setImage(UIImage(named: "payment_savedcaddetails_active"), for: UIControlState.normal)
        creditCardButtonOutLet.setImage(UIImage(named: "payment_creitcard_active"), for: UIControlState.normal)
        netBankingButtonOutLet.setImage(UIImage(named: "payment_bank_active"), for: UIControlState.normal)
        
        viewBackGroundView.layer.borderColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
        
        
        
        tableView.reloadData()
        
    }
    
    func netBankingBtnClicked(sender : UIButton){
        
        let indexPath : IndexPath!
        if(addMoneyStr != "AddMoney"){
            indexPath  = IndexPath(row: 1, section: 0)
        }else{
            indexPath  = IndexPath(row: 0, section: 0)
        }
        
        if let cardsTableViewCell : CardsTableViewCell = self.tableView.cellForRow(at: indexPath) as? CardsTableViewCell {
            
            selectedMonthStr = ""
            selectedYearStr = ""
            
            cardsTableViewCell.savedCardLabel.textColor = #colorLiteral(red: 0.5019607843, green: 0, blue: 0, alpha: 1)
            cardsTableViewCell.creditCardLabel.textColor = #colorLiteral(red: 0.5019607843, green: 0, blue: 0, alpha: 1)
            cardsTableViewCell.debitCardLabel.textColor = #colorLiteral(red: 0.5019607843, green: 0, blue: 0, alpha: 1)
            cardsTableViewCell.netbankingLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            
            cardsTableViewCell.savedBtn.backgroundColor = UIColor.white
            cardsTableViewCell.debitBtn.backgroundColor = UIColor.white
            cardsTableViewCell.creditBtn.backgroundColor = UIColor.white
            
            cardsTableViewCell.netBankingBtn.backgroundColor = UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)
            
            cardsTableViewCell.creditBtn.setImage(UIImage(named: "payment_creitcard_active"), for: UIControlState.normal)
            
            cardsTableViewCell.savedBtn.setImage(UIImage(named: "payment_savedcaddetails_active"), for: UIControlState.normal)
            cardsTableViewCell.debitBtn.setImage(UIImage(named: "payment_creitcard_active"), for: UIControlState.normal)
            cardsTableViewCell.netBankingBtn.setImage(UIImage(named: "payment_bank_white"), for: UIControlState.normal)
            
            
        }
        
        selectedButtonString = "netBanking"
        
        viewBackGroundView.layer.borderColor = UIColor.white.cgColor
        
        
        
        savedCardButtonOutLet.backgroundColor = UIColor.white
        creditCardButtonOutLet.backgroundColor = UIColor.white
        debitCardButtonOutLet.backgroundColor = UIColor.white
        
        netBankingButtonOutLet.backgroundColor = UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)
        
        savedCardsLabel.textColor =  UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)
        
        debitCardLabel.textColor =  UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)
        
        creditCardLabel.textColor =  UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)
        netBankingLabel.textColor = UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)
        
        netBankingLabel.textColor = UIColor.white
        
        netBankingButtonOutLet.setImage(UIImage(named: "payment_bank_white"), for: UIControlState.normal)
        
        savedCardButtonOutLet.setImage(UIImage(named: "payment_savedcaddetails_active"), for: UIControlState.normal)
        debitCardButtonOutLet.setImage(UIImage(named: "payment_creitcard_active"), for: UIControlState.normal)
        creditCardButtonOutLet.setImage(UIImage(named: "payment_creitcard_white"), for: UIControlState.normal)
        
        viewBackGroundView.layer.borderColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
        
        
        
        
        tableView.reloadData()
        
    }
    
    func selectBtnClicked(sender : UIButton){
        
        let indexPath : IndexPath = IndexPath(row: 0, section: 0)
    
    
    if let cardsTableViewCell : CardsTableViewCell = self.tableView.cellForRow(at: indexPath) as? CardsTableViewCell {
        
        
        
        if selection == 1{
            
//            cardsTableViewCell.selectBtn.setImage(UIImage(named: "selectedBox.png"), for: .normal)
            
//            cardsTableViewCell.payZanAmountLbl.isHidden = false
            // payingAmount.text = String(walletAmount-Int(totalAmountStr)!)
            cardsTableViewCell.payingAmount.isHidden = false
            
            selection = 2
            
        }
            
        else{
            
//            cardsTableViewCell.selectBtn.setImage(UIImage(named: "unselectedBox.png"), for: .normal)
            
//            cardsTableViewCell.payZanAmountLbl.isHidden = true
            // payingAmount.text = String(walletAmount)
            cardsTableViewCell.payingAmount.isHidden = true
            
            selection = 1
            
            
        }
    
    
        }
    
    }
   
   
}












