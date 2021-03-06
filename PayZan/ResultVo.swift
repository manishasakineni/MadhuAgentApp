//
//  ResultVo.swift
//  PayZan
//
//  Created by CalibrageMac02 on 14/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import Foundation


class ResultVo: Mappable {
    
    //MARK:-  Declaration of ResultVo

    var Result: WalletVo?
    var IsSuccess: Bool?
    var AffectedRecords: Int?
    var EndUserMessage: String?
    var ValidationErrors: [ValidationResultVo]?
    var Exception: Any?

    //MARK:-  initialization of ResultVo

    
    init(Result:WalletVo?, IsSuccess:Bool?,AffectedRecords:Int?, EndUserMessage:String?,ValidationErrors:[ValidationResultVo]?, Exception:Any?) {
        self.Result = Result
        self.IsSuccess = IsSuccess
        self.AffectedRecords = AffectedRecords
        self.EndUserMessage = EndUserMessage
        self.ValidationErrors = ValidationErrors
        self.Exception = Exception
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        Result <- map["Result"]
        IsSuccess <- map["IsSuccess"]
        AffectedRecords <- map["AffectedRecords"]
        EndUserMessage <- map["EndUserMessage"]
        ValidationErrors <- map["ValidationErrors"]
        Exception <- map["Exception"]
    }
}

