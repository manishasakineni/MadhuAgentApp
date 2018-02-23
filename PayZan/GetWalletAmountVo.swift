//
//  GetWalletAmountVo.swift
//  PayZan
//
//  Created by CalibrageMac02 on 05/02/18.
//  Copyright © 2018 CalibrageMac02. All rights reserved.
//

import Foundation

//{
//    "Result": {
//        "UserId": "string",
//        "WalletId": "string",
//        "Balance": 0,
//        "Id": 0,
//        "IsActive": true,
//        "CreatedBy": "string",
//        "ModifiedBy": "string",
//        "Created": "2018-02-05T09:53:17.572Z",
//        "Modified": "2018-02-05T09:53:17.572Z"
//    },
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

class GetWalletAmountVo: Mappable {
    
    //MARK:-  Declaration of ResultVo
    
    var Result: GetWalletAmResultVo?
    var IsSuccess: Bool?
    var AffectedRecords: Int?
    var EndUserMessage: String?
    var ValidationErrors: Any?
    var Exception: Any?
    
    //MARK:-  initialization of ResultVo
    
    
    init(Result:GetWalletAmResultVo?, IsSuccess:Bool?,AffectedRecords:Int?, EndUserMessage:String?,ValidationErrors:[ValidationResultVo]?, Exception:Any?) {
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


