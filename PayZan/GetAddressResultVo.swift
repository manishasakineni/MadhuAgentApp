//
//  ChangePasswordResultVo.swift
//  PayZan
//
//  Created by CalibrageMac02 on 29/12/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import Foundation

//"CountryName": "Sri Lanka",
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

class GetAddressResultVo: Mappable {
    
    
    //MARK:-  Declaration of AgentReqResultVo
    
    
    var CountryName: String?
    var ProvinceName: String?
    var DistrictName: String?
    var MandalName: String?
    var VillageName: String?
    var PostCode: Int?
    var ProvinceId: Int?
    var DistrictId: Int?
    
    var MandalId: Int?
    var CountryId: Int?
    var AspNetUserId: String?
    var Name:String?
    var AddressLine1: String?
    var AddressLine2: String?
    var Landmark: String?
    
    var MobileNumber: String?
    var VillageId: Int?
    var Id: Int?
    var IsActive: Bool?
    var CreatedBy: String?
    var ModifiedBy: String?
    var Created: String?
    var Modified: String?
    
    //MARK:-  initialization of AgentReqResultVo
    
    init(CountryName: String?, ProvinceName: String?, DistrictName: String?, MandalName: String?, VillageName: String?, PostCode: Int?, ProvinceId: Int?, DistrictId: Int?, MandalId: Int?, CountryId: Int?, AspNetUserId: String?, Name:String?, AddressLine1: String?, AddressLine2: String?, Landmark: String?, MobileNumber: String?, VillageId: Int?, Id: Int?, IsActive: Bool?, CreatedBy: String?, ModifiedBy: String?,Created: String?, Modified: String?) {
        
        self.CountryName = CountryName
        self.ProvinceName = ProvinceName
        self.DistrictName = DistrictName
        self.MandalName = MandalName
        self.VillageName = VillageName
        self.PostCode = PostCode
        self.ProvinceId = ProvinceId
        self.DistrictId = DistrictId
        
        self.MandalId = MandalId
        self.CountryId = CountryId
        self.AspNetUserId = AspNetUserId
        self.Name = Name
        self.AddressLine1 = AddressLine1
        self.AddressLine2 = AddressLine2
        self.Landmark = Landmark
        
        self.MobileNumber = MobileNumber
        self.VillageId = VillageId
        self.Id = Id
        self.IsActive = IsActive
        self.CreatedBy = CreatedBy
        self.ModifiedBy = ModifiedBy
        self.Created = Created
        self.Modified = Modified
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        CountryName <- map["CountryName"]
        ProvinceName <- map["ProvinceName"]
        DistrictName <- map["DistrictName"]
        MandalName <- map["MandalName"]
        
        VillageName <- map["VillageName"]
        PostCode <- map["PostCode"]
        ProvinceId <- map["ProvinceId"]
        DistrictId <- map["DistrictId"]
        
        MandalId <- map["MandalId"]
        CountryId <- map["CountryId"]
        AspNetUserId <- map["AspNetUserId"]
        Name <- map["Name"]
        
        AddressLine1 <- map["AddressLine1"]
        AddressLine2 <- map["AddressLine2"]
        Landmark <- map["Landmark"]
        
        MobileNumber <- map["MobileNumber"]
        VillageId <- map["VillageId"]
        Id <- map["Id"]
        IsActive <- map["IsActive"]
        
        CreatedBy <- map["CreatedBy"]
        ModifiedBy <- map["ModifiedBy"]
        Created <- map["Created"]
        Modified <- map["Modified"]
        
    }
    
}
