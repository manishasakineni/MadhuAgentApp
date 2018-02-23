//
//  GetWalletAmResultVo.swift
//  PayZan
//
//  Created by CalibrageMac02 on 05/02/18.
//  Copyright © 2018 CalibrageMac02. All rights reserved.
//

import Foundation
//        "UserId": "string",
//        "WalletId": "string",
//        "Balance": 0,
//        "Id": 0,
//        "IsActive": true,
//        "CreatedBy": "string",
//        "ModifiedBy": "string",
//        "Created": "2018-02-05T09:53:17.572Z",
//        "Modified": "2018-02-05T09:53:17.572Z"

class GetWalletAmResultVo: Mappable {
    
    //MARK:-  Declaration of GetUserWalletVo
    
    var UserId: String?
    var WalletId: String?
    var Balance: Float?
    var Id: Int?
    var IsActive: Bool?
    var CreatedBy: String?
    var ModifiedBy: Any?
    var Created: String?
    var Modified: String?
    
    //MARK:-  initialization of GetUserWalletVo
    
    init(UserId:String?,WalletId:String?,Balance:Float?,Id:Int?,IsActive:Bool?,CreatedBy:String?,ModifiedBy:Any?,Created:String?,Modified:String?) {
        
        self.UserId = UserId
        self.WalletId = WalletId
        self.Balance = Balance
        self.Id = Id
        self.IsActive = IsActive!
        self.CreatedBy = CreatedBy
        self.ModifiedBy = ModifiedBy
        self.Created = Created
        self.Modified = Modified
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        UserId <- map["UserId"]
        WalletId <- map["WalletId"]
        Balance <- map["Balance"]
        Id <- map["Id"]
        IsActive <- map["IsActive"]
        CreatedBy <- map["CreatedBy"]
        ModifiedBy <- map["ModifiedBy"]
        Created <- map["Created"]
        Modified <- map["Modified"]
    }
    
}
