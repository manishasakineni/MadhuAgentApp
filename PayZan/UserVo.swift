//
//  UserVo.swift
//  PayZan
//
//  Created by CalibrageMac02 on 13/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import Foundation

class UserVo: Mappable {
    
    //MARK:-  Declaration of UserVo

    
        var Id: String?
        var Email: String?
        var UserName: String?
        var PhoneNumber: String?
        var ProfilePicUrl: String?
    
    //MARK:-  initialization of UserVo

    init(Id:String?, Email:String?, UserName:String?, PhoneNumber:String?, ProfilePicUrl:String?) {
    
            self.Id = Id
            self.Email = Email
            self.UserName = UserName
            self.PhoneNumber = PhoneNumber
            self.ProfilePicUrl = ProfilePicUrl
        }
    
        required init?(map: Map) {
    
        }
    
        func mapping(map: Map) {
    
            Id <- map["Id"]
            Email <- map["Email"]
            UserName <- map["UserName"]
            PhoneNumber <- map["PhoneNumber"]
            ProfilePicUrl <- map["ProfilePicUrl"]
    
        }
    
}
