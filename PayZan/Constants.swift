//
//  Constants.swift
//  PayZan
//
//  Created by CalibrageMac02 on 09/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import Foundation


let baseUrl:String = "http://192.168.1.126/PayZanAPI/api/"

//let baseUrl:String = "http://payzandev1.azurewebsites.net/api/"

//let baseUrl:String = "http://payzandev.azurewebsites.net/api/Register/"

//let baseUrl:String = "http://103.211.39.50/PayZan/PayZanAPI/api/"

let kIsFirstTime:String = "kIsFirstTime"

var backgroundTaskIdentifier: UIBackgroundTaskIdentifier?

var timer: Timer = Timer.init()

var isManualLogin: Bool = false

let accessToken:String = "accessToken"

let expiresIn:String = "ExpiresIn"

let refreshTokenn:String = "RefreshToken"

let tokenType:String = "tokenType"

let walletIDD:String = "walletIDD"

let walletAmId:String = "walletAmId"


let userIDD:String = "userIDD"

let walletAmountt = "walletAmountt"

let loginSuccessfulStr : String = "loginSuccessfulStr"

let uNamee = "uNamee"

let mobileNum = "mobileNum"

let profilePicUrl = "profilePicUrl"

let emailIdd = "emailIdd"

let profileEmail = "profileEmail"

let kNetworkStatusMessage = "app.Pleasecheckyourinternetconnection".localize()

let kInternetConnection = "The Internet connection appears to be offline. Please connect to the internet"

let kToastDuration  = 3.0

let kRequestTimedOutMessage = "app.Therequesttimedout".localize()



