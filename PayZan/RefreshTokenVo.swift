//
//  RefreshTokenVo.swift
//  PayZan
//
//  Created by CalibrageMac02 on 27/12/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import Foundation
//{
//    "Result": {
//        "AccessToken": "eyJhbGc4",
//        "ExpiresIn": 3600,
//        "TokenType": "Bearer"
//    },
//    "IsSuccess": true,
//    "AffectedRecords": 0,
//    "EndUserMessage": "Request Refresh Token successful",
//    "ValidationErrors": [],
//    "Exception": null
//}

class RefreshTokenVo: Mappable {
    
    //MARK:-  Declaration of AgentReqVo
    
    
    var Result: RefreshResultVo?
    var IsSuccess: Bool?
    var AffectedRecords: Int?
    var EndUserMessage: String?
    var ValidationErrors: Any?
    var Exception: Any?
    
    //MARK:-  initialization of AgentReqVo
    
    
    init(Result:RefreshResultVo?, IsSuccess:Bool?,AffectedRecords:Int?, EndUserMessage:String?,ValidationErrors:Any?, Exception:Any?) {
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

