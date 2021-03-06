//
//  AppDelegate.swift
//  PayZan
//
//  Created by CalibrageMac02 on 04/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import FBSDKLoginKit
import FacebookCore
import Google
import GoogleSignIn
import FBSDKLoginKit
import SystemConfiguration
import Localize

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,GIDSignInDelegate,SWRevealViewControllerDelegate {
    
    
    var tabController = TabsViewController()
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
    }
    
    var window: UIWindow?
    
    let tabBarController = UITabBarController()
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        let localize = Localize.shared
        // Set your localize provider.
        localize.update(provider: .json)
        // Set your file name
        localize.update(fileName: "lang")
        // Set your default languaje.
        //        localize.update(defaultLanguage: "fr")
        // If you want change a user language, different to default in phone use thimethod.
        //        localize.update(language: "en")
        //        localize.update(defaultLanguage: "si")
        //        localize.update(defaultLanguage: "ta")
        // If you want remove storaged languaje use
        //        localize.resetLanguage()
        // The used language
        print(localize.language())
        // List of aviable languajes
        print(localize.availableLanguages())
        
        
        
        // Or you can use static methods for all
        
        //        Localize.update(fileName: "lang")
        //        Localize.update(defaultLanguage: "fr")
        //        Localize.update(defaultLanguage: "si")
        //        Localize.update(defaultLanguage: "ta")
        //        Localize.update(language: "en-DE")
        
        IQKeyboardManager.sharedManager().enable = true
        
        var configureError: NSError?
        GGLContext.sharedInstance().configureWithError(&configureError)
        assert(configureError == nil, "Error configuring Google services: \(String(describing: configureError))")
        
        GIDSignIn.sharedInstance().delegate = self as GIDSignInDelegate
        
        if UserDefaults.standard.object(forKey: kIsFirstTime) as? String == "true" {
            
            
            
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = mainStoryboard.instantiateViewController(withIdentifier: "TabsViewController") as! UITabBarController
            
            viewController.tabBar.items?[1].title = "app.Login".localize()
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = viewController
            
            
            
        }
        else {
            
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            let langViewController = mainStoryboard.instantiateViewController(withIdentifier: "ChooseLanguageViewController") as! ChooseLanguageViewController
            //        self.navigationController?.pushViewController(rchargeViewController, animated: true)
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
            appDelegate.window?.rootViewController = langViewController
            
            //        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            //
            //        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "LoginNav") as! UINavigationController
            //        //                    let navigationController = UINavigationController(rootViewController: viewController)
            //        let defaults = UserDefaults.standard
            //
            //        defaults.set("backBtn", forKey: "hideBackBtn")
            //
            //        let appDelegate = UIApplication.shared.delegate as! AppDelegate
            //        appDelegate.window?.rootViewController = viewController
            
        }
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        FBSDKApplicationDelegate.sharedInstance().application(app, open: url, options: options)
        
        if #available(iOS 9.0, *) {
            GIDSignIn.sharedInstance().handle(url,sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String,annotation: options[UIApplicationOpenURLOptionsKey.annotation])
        } else {
            // Fallback on earlier versions
        }
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        
        FBSDKAppEvents.activateApp()
        
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    // MARK: - Check Internet Connectivity
    
    func checkInternetConnectivity() -> Bool {
        
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
    }
    
    
    
}

