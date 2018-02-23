//
//  ChangePasswordVo.swift
//  PayZan
//
//  Created by CalibrageMac02 on 29/12/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import Foundation

//{
//    "ListResult": [
//    {
//    "CountryName": "Sri Lanka",
//    "ProvinceName": null,
//    "DistrictName": "Amaravathi",
//    "MandalName": "Ampara",
//    "VillageName": "Amparaaa",
//    "PostCode": 12345,
//    "ProvinceId": 0,
//    "DistrictId": 1,
//    "MandalId": 1,
//    "CountryId": 1,
//    "AspNetUserId": "f88c34fd-27ce-4c0a-965e-1afed92e8987",
//    "Name": "string",
//    "AddressLine1": "string",
//    "AddressLine2": "string",
//    "Landmark": "string",
//    "MobileNumber": "string",
//    "VillageId": 1,
//    "Id": 155,
//    "IsActive": true,
//    "CreatedBy": "f88c34fd-27ce-4c0a-965e-1afed92e8987",
//    "ModifiedBy": "f88c34fd-27ce-4c0a-965e-1afed92e8987",
//    "Created": "2017-12-29T11:08:21.384557+00:00",
//    "Modified": "2017-12-29T11:08:21.384557+00:00"
//    }
//    ],
//    "IsSuccess": true,
//    "AffectedRecords": 1,
//    "EndUserMessage": "Get Addresses Successful",
//    "ValidationErrors": [],
//    "Exception": null
//}


class GetAddressVo: Mappable {
    
    //MARK:-  Declaration of AgentReqVo
    
    
    var ListResult: [GetAddressResultVo]?
    var IsSuccess: Bool?
    var AffectedRecords: Int?
    var EndUserMessage: String?
    var ValidationErrors: Any?
    var Exception: Any?
    
    //MARK:-  initialization of AgentReqVo
    
    
    init(ListResult:[GetAddressResultVo]?, IsSuccess:Bool?,AffectedRecords:Int?, EndUserMessage:String?,ValidationErrors:Any?, Exception:Any?) {
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



