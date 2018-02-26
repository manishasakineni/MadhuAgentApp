//
//  SavedCardsViewController.swift
//  NewScreens
//
//  Created by Manoj on 23/11/17.
//  Copyright © 2017 Manoj. All rights reserved.
//

import UIKit
import TextFieldEffects

class SavedCardsViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource {
    
    //MARK:- OutLets


    @IBOutlet weak var savedCardTableView: UITableView!
    
    @IBOutlet weak var headerImgHeight: NSLayoutConstraint!
    
    @IBOutlet weak var headerViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var backLabel: UILabel!
    
    var datePicker = UIDatePicker()
    var dateStr = String()
    var picker = UIPickerView()
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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK:- NibName
        
        self.monthsAry = ["01","02","03","04","05","06","07","08","09","10","11","12"]
        
        self.bankNamesAry = ["HDFC","ICICI","SBI","BOI","BOB"]

        let nibName  = UINib(nibName: "SavedTableViewCell" , bundle: nil)
        savedCardTableView.register(nibName, forCellReuseIdentifier: "SavedTableViewCell")
        
        let nibName1  = UINib(nibName: "CreditCardTableViewCell" , bundle: nil)
        savedCardTableView.register(nibName1, forCellReuseIdentifier: "CreditCardTableViewCell")
        
        
        savedCardTableView.dataSource = self
        savedCardTableView.delegate = self
        
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
        
        
        self.picker.delegate = self
        
        self.yearsTillNow
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.isHidden = true
    }
    
    //MARK:- Button Action

    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        activeTextField = textField
        
        self.currentjumpOrder = textField.jumpOrder //set current first responder index
        
        if activeTextField.tag == 1 {
            
            textField.inputView = picker
            pickerDataAry = self.monthsAry
            picker.reloadAllComponents()
            picker.selectRow(0, inComponent: 0, animated: false)
            
        }
            
        else if activeTextField.tag == 2 {
            
            
            textField.inputView = picker
            pickerDataAry = self.yearsAry
            picker.reloadAllComponents()
            picker.selectRow(0, inComponent: 0, animated: false)
            
        }
            
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.moveNext() //move to the next text input in order
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        
        if textField == activeTextField {
            
            if !string.canBeConverted(to: String.Encoding.ascii){
                return false
            }
            
        }
        
        
        if textField.reachedMaxLength(range, string: string) || !string.shouldAllow(textField.allowedCharacters){
            return false
        }
        
        if textField.tag == 3 {
            
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
        
        
        return textField.formatText(string)
    }

    
   //MARK:- UITableView Datasource Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat{
        
        return UITableViewAutomaticDimension
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CreditCardTableViewCell", for: indexPath) as! CreditCardTableViewCell
        
        cell.cardNumberTextField.keyboardType = .decimalPad
        cell.cvvTF.keyboardType = .decimalPad
        cell.cvvTF.maxLengthTextField = 3
        
        cell.creditCardDetailsView.layer.borderColor = UIColor.white.cgColor
        
        cell.cardNumberTextField.delegate = self
        cell.cardHoldersTextField.delegate = self
        cell.monthTextField.delegate = self
        cell.yearTextField.delegate = self
        cell.cvvTF.delegate = self
        cell.cardLabelTextField.delegate = self
        
        cell.monthTextField.tag = 1
        cell.yearTextField.tag = 2
        cell.cvvTF.tag = 3
        
        
        //Programmatic UITextField setup
        cell.cardNumberTextField.validationType = .creditCard
        cell.cardNumberTextField.format = "xxxx xxxx xxxx xxxx"
        cell.cardNumberTextField.maxLengthTextField = 19
        cell.cardNumberTextField.jumpOrder = 1
        
        cell.cardNumberTextField.placeholder = "app.CardNumber".localize()
       
        
        cell.cardHoldersTextField.placeholder = "app.CardHolder'sname".localize()
       
        cell.cardHoldersTextField.maxLengthTextField = 40
        
        cell.cardLabelTextField.placeholder = "app.CardLabel(optional)".localize()
        cell.cardLabelTextField.maxLengthTextField = 20
        
        cell.payNowBtn.tag = indexPath.row
       
        cell.payNowBtn.addTarget(self, action: #selector(addCardBtnClicked), for: .touchUpInside)
        
        print(cell.cardNumberTextField.allowedCharacters) //most built in validation types set allowedCharacters for you
        
        cell.cardNumberTextField.delegate = self
        cell.monthTextField.delegate = self
        cell.yearTextField.delegate = self
        
         cell.payNowBtn.setTitle("app.AddCard".localize(), for: .normal)
        
        
        cell.lblRight = UILabel(frame: CGRect(x: cell.cardNumberTextField.frame.size.width - 60,y: 0,width: 60,height: cell.cardNumberTextField.frame.size.height))
        cell.lblRight.textAlignment = .center
        cell.lblRight.font = UIFont.systemFont(ofSize: 10)
        cell.lblRight.textColor = UIColor.lightGray
        cell.cardNumberTextField.rightView = cell.lblRight
        cell.cardNumberTextField.rightViewMode = .always
        
        cell.monthTextField.text = selectedMonthStr
        cell.yearTextField.text = selectedYearStr
        
        
        
        return cell
        
    }
    
    //MARK: - UIButton Action
    
    func payNowBtnClicked(_ sender: UIButton){
        
    }
    
    func addCardBtnClicked(_ sender: UIButton){
        
        
        let indexPath : IndexPath = IndexPath(row: sender.tag, section: 0)
        
        if let cardCell : CreditCardTableViewCell = savedCardTableView.cellForRow(at: indexPath) as? CreditCardTableViewCell {
            
            cardCell.cardNumberTextField.text = cardCell.cardNumberTextField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
             cardCell.cardHoldersTextField.text = cardCell.cardHoldersTextField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
             cardCell.cardLabelTextField.text = cardCell.cardLabelTextField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
            
            cardCell.monthTextField.text = cardCell.monthTextField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
            cardCell.yearTextField.text = cardCell.yearTextField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
            
            let cardNumField:NSString = cardCell.cardNumberTextField.text! as NSString
            let cardHolderField:NSString = cardCell.cardHoldersTextField.text! as NSString
            let monthField:NSString = selectedMonthStr as NSString
            let yearField:NSString = selectedYearStr as NSString
            let cvvField:NSString = cardCell.cvvTF.text! as NSString

            
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
                
                    self.showAlertViewWithTitle("app.Alert".localize(), message: errorMsg as String, buttonTitle: "app.Retry".localize())

            }

        }
        
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
            
        else if activeTextField.tag == 5 {
            
            if pickerDataAry.count > row {
                
                selectedYearStr = pickerDataAry[row]
                activeTextField.text = selectedYearStr
                
            }
            
        }
        
    }

    
    
    
}
