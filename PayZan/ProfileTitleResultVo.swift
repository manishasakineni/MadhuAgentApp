//
//  ProfileTitleResultVo.swift
//  PayZan
//
//  Created by CalibrageMac02 on 06/01/18.
//  Copyright © 2018 CalibrageMac02. All rights reserved.
//

import Foundation


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

class ProfileTitleResultVo: Mappable {
    
    
    //MARK:-  Declaration of AgentReqResultVo
    
    
    var ClassName: String?
    var Id: Int?
    var ClassTypeId: Int?
    var Description: String?
    var TableName: String?
    var ColumnName: String?
    var SortOrder: String?
    var IsActive: Bool?
    var CreatedBy: String?
    var ModifiedBy: String?
    var Created: String?
    var Modified: String?
    
    //MARK:-  initialization of AgentReqResultVo
    
    init(ClassName: String?, Id: Int?, ClassTypeId: Int?, Description: String?, TableName: String?, ColumnName: String?, SortOrder: String?, IsActive: Bool?, CreatedBy: String?, ModifiedBy: String?,Created: String?, Modified: String?) {
        
        self.ClassName = ClassName
        self.Id = Id
        self.ClassTypeId = ClassTypeId
        self.Description = Description
        self.TableName = TableName
        self.ColumnName = ColumnName
        self.SortOrder = SortOrder
        self.IsActive = IsActive
        self.CreatedBy = CreatedBy
        self.ModifiedBy = ModifiedBy
        self.Created = Created
        self.Modified = Modified
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        ClassName <- map["ClassName"]
        Id <- map["Id"]
        ClassTypeId <- map["ClassTypeId"]
        Description <- map["Description"]
        TableName <- map["TableName"]
        
        ColumnName <- map["ColumnName"]
        SortOrder <- map["SortOrder"]
        IsActive <- map["IsActive"]
        
        CreatedBy <- map["CreatedBy"]
        ModifiedBy <- map["ModifiedBy"]
        Created <- map["Created"]
        Modified <- map["Modified"]
        
    }
    
}
