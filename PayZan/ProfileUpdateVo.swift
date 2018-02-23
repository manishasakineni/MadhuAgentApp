//
//  ProfileUpdateVo.swift
//  PayZan
//
//  Created by CalibrageMac02 on 06/01/18.
//  Copyright © 2018 CalibrageMac02. All rights reserved.
//

import Foundation

//{
//    "Result": {
//    "IsSuccess": true,
//    "AffectedRecords": 0,
//    "EndUserMessage": "string",
//    "ValidationErrors": [
//    {
//    "Name": "string",
//    "Description": "string"
//    }
//    ],
//    "Exception": {}
//}

class ProfileUpdateVo: Mappable {
    
    //MARK:-  Declaration of AgentReqVo
    
    
    var Result: ProfileUpdateResultVo?
    var IsSuccess: Bool?
    var AffectedRecords: Int?
    var EndUserMessage: String?
    var ValidationErrors: Any?
    var Exception: Any?
    
    //MARK:-  initialization of AgentReqVo
    
    
    init(Result:ProfileUpdateResultVo?, IsSuccess:Bool?,AffectedRecords:Int?, EndUserMessage:String?,ValidationErrors:Any?, Exception:Any?) {
        
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
