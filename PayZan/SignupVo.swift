//
//  SignupVo.swift
//  PayZan
//
//  Created by CalibrageMac02 on 05/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import Foundation

class SignupVo: Mappable {
    
    //MARK:-  Declaration of SignupVo

    var Result: SignUpResultVo?
    var IsSuccess: Bool?
    var AffectedRecords: Int?
    var EndUserMessage: String?
    
    //MARK:-  initialization of SignupVo

    init(Result:SignUpResultVo?,IsSuccess:Bool?,AffectedRecords:Int?,EndUserMessage:String?) {
        self.Result = Result
        self.IsSuccess = IsSuccess
        self.AffectedRecords = AffectedRecords
        self.EndUserMessage = EndUserMessage
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        Result <- map["Result"]
        IsSuccess <- map["IsSuccess"]
        AffectedRecords <- map["AffectedRecords"]
        EndUserMessage <- map["EndUserMessage"]
    }
}
