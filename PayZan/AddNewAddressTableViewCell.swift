//
//  AddNewAddressTableViewCell.swift
//  PayZan
//
//  Created by Manoj on 28/12/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit

class AddNewAddressTableViewCell: UITableViewCell,UITextFieldDelegate {
    
    @IBOutlet weak var addNewAddressLabel: UILabel!
    
    @IBOutlet weak var addNewAddressTF: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addNewAddressTF.delegate = self
        
        
        hideLabels()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    func hideLabels(){
        
        if (addNewAddressTF.text != nil)  {
            
            addNewAddressLabel.isHidden = true
        }
            
        else{
            
            addNewAddressLabel.isHidden = false
            
        }
        
//        if (addNewAddressTF.text != nil)  {
//            
//            addNewAddressLabel.isHidden = true
//        }
//            
//        else{
//            
//            addNewAddressLabel.isHidden = false
//            
//        }
//        
        
    }
    
    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        
//        if  textField == addNewAddressTF {
//            
//            
//            if (addNewAddressTF.text != nil)  {
//                
//                addNewAddressLabel.isHidden = false
//                
//                
//            }
//                
//            else{
//                
//                addNewAddressLabel.isHidden = true
//                
//                
//            }
//            
//        }
//        
//        if textField == addNewAddressTF {
//            
//            
//            if (addNewAddressTF.text != nil)  {
//                
//                addNewAddressLabel.isHidden = false
//                
//            }
//                
//            else{
//                
//                addNewAddressLabel.isHidden = true
//                
//                
//            }
//        }
//        
//    }
//    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        
//        if (addNewAddressTF.text != nil)  {
//            
//            addNewAddressLabel.isHidden = true
//        }
//            
//        else{
//            
//            addNewAddressLabel.isHidden = false
//            
//        }
//        
//        
//    }
//    
//    
//    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//        
//        if addNewAddressTF.text == nil {
//            
//            self.addNewAddressLabel.isHidden = true
//            self.addNewAddressLabel.isHidden = false
//        }
//        
//        
//        
//        return true;
//    }
    
    
}
