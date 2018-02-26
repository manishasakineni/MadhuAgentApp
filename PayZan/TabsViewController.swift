//
//  TabsViewController.swift
//  PayZan
//
//  Created by CalibrageMac02 on 25/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit



class TabsViewController: UITabBarController,UITabBarControllerDelegate {
    
    var userId:String? = ""
    var walletId:String? = ""


        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        let defaults = UserDefaults.standard
        
        if let userid = defaults.string(forKey: userIDD) {
            
            userId = userid
            
            print("defaults savedString: \(userid)")
        }
        if let walletid = defaults.string(forKey: walletIDD) {
            
            walletId = walletid
            
            print("defaults savedString: \(walletid)")
            
        }
        
        
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
            UITabBarItem.appearance().setTitleTextAttributes([NSFontAttributeName: UIFont(name: "HelveticaNeue", size: 16)!], for: .normal)
            UITabBarItem.appearance().setTitleTextAttributes([NSFontAttributeName: UIFont(name: "HelveticaNeue", size: 16)!], for: .selected)
        }
        else {
            
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    override func viewWillLayoutSubviews() {
        
        var newTabBarFrame = tabBar.frame
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
           
    
            let newTabBarHeight: CGFloat = 60
            newTabBarFrame.size.height = newTabBarHeight
            newTabBarFrame.origin.y = self.view.frame.size.height - newTabBarHeight
            
            tabBar.frame = newTabBarFrame
        }
        else {
            
            
            
        }
        
        
        
        
    }
    
   //MARK:- tabBarController shouldSelect viewController
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        let addMoneyViewController = self.storyboard?.instantiateViewController(withIdentifier: "AddMoneyWalletViewController") as! AddMoneyWalletViewController
        
        addMoneyViewController.indexValue = 1
        addMoneyViewController.isHiddenWithdrawView = false
        addMoneyViewController.isHiddenSendView = true
        addMoneyViewController.isHiddenTransactionView = true
        
        self.navigationController?.pushViewController(addMoneyViewController, animated: true)
        
        
        return true
    }
   
    //MARK:- tabBarController didSelect item

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let index = tabBar.items?.index(of: item) else { return }
        print("the selected index is : \(index)")
        
        switch index {
        case 0:
            print("home")
            
            break
        case 1:
            print("profile")
            
            if !(walletId?.isEmpty)! && !(userId?.isEmpty)! {
                
                
                
            }
            else {
                
                let vController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                self.present(vController, animated: true, completion: nil)
                
            }

            
            break
        case 2:
            print("wallet")
            
            
                if !(walletId?.isEmpty)! && !(userId?.isEmpty)! {
                    
                    
                    
                }
                else {
                    
                    let vController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                   self.present(vController, animated: true, completion: nil)
            
            }
            
            break
        case 3:
            print("offers")
            break
        default:
            print("default")
        }
        // Do something with the index
    }
    
    //MARK:- tabBarController didSelect viewController
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController){
        switch tabBarController.selectedIndex {
        case 0:
            print("home")
            break
        case 1:
            print("account")
            break
        case 2:
            print("cart")
            break
        case 3:
            print("wishlist")
            break
        case 4:
            print("notifications")
            break
        default:
            print("default")
        }
    }

}
