//
//  AddressInsertInfoVo.swift
//  PayZan
//
//  Created by Manoj on 29/12/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import Foundation

class AddressInsertInfoVo: Mappable {
    
    //MARK:-  Declaration of GetProfileVo
    

    
    var Result:AddressInsertResultVo?
    var IsSuccess:Bool?
    var AffectedRecords:Int?
    var EndUserMessage:String?
    var ValidationErrors:AnyObject?
    var Exception:Any?
    
    //MARK:-  initialization of GetProfileVo
    
    
    init(Result:AddressInsertResultVo?, IsSuccess:Bool?, AffectedRecords:Int?,EndUserMessage:String?,ValidationErrors:AnyObject?, Exception:Any?) {
        
        self.Result = Result
        self.IsSuccess = IsSuccess
        self.AffectedRecords = AffectedRecords
        self.EndUserMessage = EndUserMessage
        self.ValidationErrors = ValidationErrors
        self.Exception = Exception
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        Result <- map["Result"]
        IsSuccess <- map["IsSuccess"]
        AffectedRecords <- map["AffectedRecords"]
        EndUserMessage <- map["EndUserMessage"]
        ValidationErrors <- map["ValidationErrors"]
        Exception <- map["Exception"]
        
    }
}

