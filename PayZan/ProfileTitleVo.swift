//
//  ProfileTitleVo.swift
//  PayZan
//
//  Created by CalibrageMac02 on 06/01/18.
//  Copyright © 2018 CalibrageMac02. All rights reserved.
//

import Foundation
//{
//    "ListResult": [
//    {
//    "ClassName": "TitleType",
//    "Id": 17,
//    "ClassTypeId": 4,
//    "Description": "Mr.",
//    "TableName": "UserInfo",
//    "ColumnName": "TitleTypeId",
//    "SortOrder": "0",
//    "IsActive": true,
//    "CreatedBy": "05e3b552-21f3-486f-9b6c-41cdf738f2b8",
//    "Created": "2017-10-25T10:34:33.367761+00:00",
//    "ModifiedBy": "05e3b552-21f3-486f-9b6c-41cdf738f2b8",
//    "Modified": "2017-10-25T10:34:33.367761+00:00"
//    }
//    ],
//    "IsSuccess": true,
//    "AffectedRecords": 3,
//    "EndUserMessage": "Get All Successful",
//    "ValidationErrors": [],
//    "Exception": null
//}


class ProfileTitleVo: Mappable {
    
    //MARK:-  Declaration of GetProfileVo
    
    
    var ListResult:[ProfileTitleResultVo]?
    var IsSuccess:Bool?
    var AffectedRecords:Int?
    var EndUserMessage:String?
    var ValidationErrors:AnyObject?
    var Exception:Any?
    
    //MARK:-  initialization of GetProfileVo
    
    
    init(ListResult:[ProfileTitleResultVo]?, IsSuccess:Bool?, AffectedRecords:Int?,EndUserMessage:String?,ValidationErrors:AnyObject?, Exception:Any?) {
        
        self.ListResult = ListResult
        self.IsSuccess = IsSuccess
        self.AffectedRecords = AffectedRecords
        self.EndUserMessage = EndUserMessage
        self.ValidationErrors = ValidationErrors
        self.Exception = Exception
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        ListResult <- map["ListResult"]
        IsSuccess <- map["IsSuccess"]
        AffectedRecords <- map["AffectedRecords"]
        EndUserMessage <- map["EndUserMessage"]
        ValidationErrors <- map["ValidationErrors"]
        Exception <- map["Exception"]
        
    }
}

