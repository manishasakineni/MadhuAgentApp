//
//  RespVo.swift
//  PayZan
//
//  Created by CalibrageMac02 on 05/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import Foundation


class RespVo: Mappable {
    
    //MARK:-  Declaration of RespVo

    var User:UserVo?
    var Roles:[RolesVo]?
    var ActivityRights:Any?
    var UserWallet:GetUserWalletVo?
    var AccessToken:String?
    var RefreshToken:String?
    var ExpiresIn:Int?
    var TokenType:String?
    
    //MARK:-  initialization of RespVo

    init(User:UserVo?, Roles:[RolesVo]?, ActivityRights:Any?, UserWallet:GetUserWalletVo?, AccessToken:String?,RefreshToken:String?, ExpiresIn:Int?, TokenType:String?) {
    
            self.User = User
            self.Roles = Roles
            self.ActivityRights = ActivityRights
            self.UserWallet = UserWallet
            self.AccessToken = AccessToken
            self.RefreshToken = RefreshToken
            self.ExpiresIn = ExpiresIn
            self.TokenType = TokenType
    }
    
    required init?(map: Map) {
    
    }
    
    func mapping(map: Map) {
    
      User <- map["User"]
      Roles <- map["Roles"]
      ActivityRights <- map["ActivityRights"]
      UserWallet <- map["UserWallet"]
      AccessToken <- map["AccessToken"]
      RefreshToken <- map["RefreshToken"]
      ExpiresIn <- map["ExpiresIn"]
      TokenType <- map["TokenType"]
    
        }
    
    
    
    
}
