//
//  ValidationResultVo.swift
//  PayZan
//
//  Created by CalibrageMac02 on 29/01/18.
//  Copyright © 2018 CalibrageMac02. All rights reserved.
//

import Foundation

class ValidationResultVo: Mappable {
    
    //MARK:-  Declaration of WalletVo
    
    var Description: String?
    var Name: String?
    
    //MARK:-  initialization of WalletVo
    
    init(Description:String?,Name:String?) {
        
        self.Description = Description
        self.Name = Name
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        Description <- map["Description"]
        Name <- map["Name"]
    }
    
}
