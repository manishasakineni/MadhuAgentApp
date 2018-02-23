//
//  RefreshResultVo.swift
//  PayZan
//
//  Created by CalibrageMac02 on 27/12/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import Foundation

class RefreshResultVo: Mappable {
    
    
    //MARK:-  Declaration of AgentReqResultVo
    
    
    var AccessToken: String?
    var RefreshToken: String?
    var ExpiresIn: Int?
    var TokenType:String?
    
    //MARK:-  initialization of AgentReqResultVo
    
    init(AccessToken:String?, RefreshToken:String?, ExpiresIn:Int?, TokenType:String?) {
        
        self.AccessToken = AccessToken
        self.RefreshToken = RefreshToken
        self.ExpiresIn = ExpiresIn
        self.TokenType = TokenType

    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        AccessToken <- map["AccessToken"]
        RefreshToken <- map["RefreshToken"]
        ExpiresIn <- map["ExpiresIn"]
        TokenType <- map["TokenType"]
        
    }
    
}
