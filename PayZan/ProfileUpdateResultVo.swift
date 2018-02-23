//
//  ProfileUpdateResultVo.swift
//  PayZan
//
//  Created by CalibrageMac02 on 06/01/18.
//  Copyright © 2018 CalibrageMac02. All rights reserved.
//

import Foundation


//        "AspNetUserId": "string",
//        "TitleTypeId": 0,
//        "FirstName": "string",
//        "MiddleName": "string",
//        "LastName": "string",
//        "Phone": "string",
//        "Email": "string",
//        "GenderTypeId": 0,
//        "DOB": "2018-01-06T10:58:32.797Z",
//        "Address1": "string",
//        "Address2": "string",
//        "Landmark": "string",
//        "VillageId": 0,
//        "ParentAspNetUserId": "string",
//        "EducationTypeId": 0,
//        "Id": 0,
//        "IsActive": true,
//        "CreatedBy": "string",
//        "ModifiedBy": "string",
//        "Created": "2018-01-06T10:58:32.797Z",
//        "Modified": "2018-01-06T10:58:32.797Z"
//    }

//"ImageString": "string",
//"FileExtension": "string"

class ProfileUpdateResultVo: Mappable {
    
    
    //MARK:-  Declaration of AgentReqResultVo
    
    
    var AspNetUserId: String?
    var TitleTypeId: Int?
    var FirstName: String?
    var MiddleName: String?
    var LastName: String?
    var Phone: String?
    var Email: String?
    var GenderTypeId: Int?
    
    var DOB: String?
    var Address1: String?
    var Address2:String?
    var Landmark: String?
    var VillageId: Int?
    var ParentAspNetUserId: String?
    var EducationTypeId: Int?
    
    var Id: Int?
    var IsActive: Bool?
    var ImageString: String?
    var FileExtension: String?
    var ProfilePicUrl: String?
    
    var CreatedBy: String?
    var ModifiedBy: String?
    var Created: String?
    var Modified: String?
    
    //MARK:-  initialization of AgentReqResultVo
    
    init(AspNetUserId: String?, TitleTypeId: Int?, FirstName: String?, MiddleName: String?, LastName: String?, Phone: String?, Email: String?, GenderTypeId: Int?, DOB: String?, Address1: String?, Address2: String?, Landmark:String?, ParentAspNetUserId: String?, EducationTypeId: Int?, VillageId: Int?, Id: Int?, IsActive: Bool?, ImageString:String?, FileExtension:String?,ProfilePicUrl:String?, CreatedBy: String?, ModifiedBy: String?,Created: String?, Modified: String?) {
        
        self.AspNetUserId = AspNetUserId
        self.TitleTypeId = TitleTypeId
        self.FirstName = FirstName
        self.MiddleName = MiddleName
        self.LastName = LastName
        self.Phone = Phone
        self.Email = Email
        self.GenderTypeId = GenderTypeId
        self.DOB = DOB
        self.Address1 = Address1
        self.Address2 = Address2
        self.Landmark = Landmark
        
        self.ParentAspNetUserId = ParentAspNetUserId
        self.EducationTypeId = EducationTypeId
        self.AspNetUserId = AspNetUserId
        self.VillageId = VillageId
        self.Id = Id
        self.IsActive = IsActive
        self.ImageString = ImageString
        self.FileExtension = FileExtension
        self.ProfilePicUrl = ProfilePicUrl
        
        self.CreatedBy = CreatedBy
        self.ModifiedBy = ModifiedBy
        self.Created = Created
        self.Modified = Modified
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        AspNetUserId <- map["AspNetUserId"]
        TitleTypeId <- map["TitleTypeId"]
        MiddleName <- map["MiddleName"]
        LastName <- map["LastName"]
        
        FirstName <- map["FirstName"]
        Phone <- map["Phone"]
        Email <- map["Email"]
        GenderTypeId <- map["GenderTypeId"]
        
        DOB <- map["DOB"]
        Address1 <- map["Address1"]
        Address2 <- map["Address2"]
        Landmark <- map["Landmark"]
        
        ParentAspNetUserId <- map["ParentAspNetUserId"]
        EducationTypeId <- map["EducationTypeId"]
        
        VillageId <- map["VillageId"]
        Id <- map["Id"]
        IsActive <- map["IsActive"]
        ImageString <- map["ImageString"]
        FileExtension <- map["FileExtension"]
        ProfilePicUrl <- map["ProfilePicUrl"]
        
        CreatedBy <- map["CreatedBy"]
        ModifiedBy <- map["ModifiedBy"]
        Created <- map["Created"]
        Modified <- map["Modified"]
        
    }
    
}
