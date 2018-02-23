//
//  MyTranListResultVo.swift
//  PayZan
//
//  Created by CalibrageMac02 on 30/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import Foundation

class MyTranListResultVo: Mappable {
    
    //MARK:-  Declaration of MyTranListResultVo

    
    var Id: Int?
    var WalletId: String?
    var Amount: Float?
    var TransactionTypeId: Int?
    var TransactionType: String?
    var TransactionId: Any?
    var ReasonTypeId: Int?
    var ReasonType: String?
    var IsActive: Bool?
    var Created: String?
    var Modified: String?
    
    //MARK:-  initialization of MyTranListResultVo

    init(Id:Int?,WalletId:String?,Amount:Float?,TransactionTypeId:Int?,TransactionType:String?,TransactionId:Any,ReasonTypeId:Int?,ReasonType:String?,IsActive:Bool?,Created:String?,Modified:String?) {
        

        self.Id = Id
        self.Amount = Amount
        self.WalletId = WalletId
        self.TransactionTypeId = TransactionTypeId
        self.TransactionType = TransactionType
        self.TransactionId = TransactionId
        self.ReasonTypeId = ReasonTypeId
        self.ReasonType = ReasonType
        self.IsActive = IsActive
        self.Created = Created
        self.Modified = Modified
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        
        Id <- map["Id"]
        WalletId <- map["WalletId"]
        Amount <- map["Amount"]
        TransactionTypeId <- map["TransactionTypeId"]
        TransactionType <- map["TransactionType"]
        TransactionId <- map["TransactionId"]
        ReasonTypeId <- map["ReasonTypeId"]
        ReasonType <- map["ReasonType"]
        IsActive <- map["IsActive"]
        Created <- map["Created"]
        Modified <- map["Modified"]
    }
    
}
