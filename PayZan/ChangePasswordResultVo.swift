//
//  ChangePasswordResultVo.swift
//  PayZan
//
//  Created by CalibrageMac02 on 29/12/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import Foundation

class ChangePasswordResultVo: Mappable {
    
    
    //MARK:-  Declaration of AgentReqResultVo
    
    
    var Id: String?
    var UserName: String?
    var NormalizedUserName: String?
    var Email:String?
    var NormalizedEmail: String?
    var EmailConfirmed: String?
    var PasswordHash: String?
    var SecurityStamp:String?
    
    var ConcurrencyStamp: String?
    var PhoneNumber: String?
    var PhoneNumberConfirmed: String?
    var TwoFactorEnabled:String?
    var LockoutEnd: String?
    var LockoutEnabled: String?
    var AccessFailedCount: String?
    
    //MARK:-  initialization of AgentReqResultVo
    
    init(Id:String?, UserName:String?, NormalizedUserName:String?, Email:String?, NormalizedEmail:String?, EmailConfirmed:String?, PasswordHash:String?, SecurityStamp:String?, ConcurrencyStamp:String?, PhoneNumber:String?, PhoneNumberConfirmed:String?, TwoFactorEnabled:String?, LockoutEnd:String?, LockoutEnabled:String?, AccessFailedCount:String?) {
        
        self.Id = Id
        self.UserName = UserName
        self.NormalizedUserName = NormalizedUserName
        self.Email = Email
        
        self.NormalizedEmail = NormalizedEmail
        self.EmailConfirmed = EmailConfirmed
        self.PasswordHash = PasswordHash
        self.SecurityStamp = SecurityStamp
        
        self.ConcurrencyStamp = ConcurrencyStamp
        self.PhoneNumber = PhoneNumber
        self.PhoneNumberConfirmed = PhoneNumberConfirmed
        self.TwoFactorEnabled = TwoFactorEnabled
        
        self.LockoutEnd = LockoutEnd
        self.LockoutEnabled = LockoutEnabled
        self.AccessFailedCount = AccessFailedCount
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        Id <- map["Id"]
        UserName <- map["UserName"]
        NormalizedUserName <- map["NormalizedUserName"]
        Email <- map["Email"]
        
        NormalizedEmail <- map["NormalizedEmail"]
        EmailConfirmed <- map["EmailConfirmed"]
        PasswordHash <- map["PasswordHash"]
        SecurityStamp <- map["SecurityStamp"]
        
        ConcurrencyStamp <- map["ConcurrencyStamp"]
        PhoneNumber <- map["PhoneNumber"]
        PhoneNumberConfirmed <- map["PhoneNumberConfirmed"]
        TwoFactorEnabled <- map["TwoFactorEnabled"]
        
        LockoutEnd <- map["LockoutEnd"]
        LockoutEnabled <- map["LockoutEnabled"]
        AccessFailedCount <- map["AccessFailedCount"]
        
    }
    
}
