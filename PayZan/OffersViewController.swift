//
//  OffersViewController.swift
//  PayZan
//
//  Created by CalibrageMac02 on 09/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit


protocol changeSubtitleOfIndexDelegate {
    func nameOfItem(indexNumber: Int, countText : String)
}



class OffersViewController: UIViewController,UITabBarControllerDelegate,UITabBarDelegate,CAPSPageMenuDelegate,changeSubtitleOfIndexDelegate {
    
    //MARK:- OutLets

    var pageMenu : CAPSPageMenu?

    
    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak var headerImgHeight: NSLayoutConstraint!
    
    @IBOutlet weak var headerViewHeight: NSLayoutConstraint!

    
    
    private var controllersArray: [UIViewController] = []
    var subTitlesArray          : Array<String>     = Array()
    
    
    var allOffersVC : AllOffersViewController?
    var rechargesVC : RechargesViewController?
    var detAndBillsVC : DetAndBillsViewController?
    var mearchantVC : MearchantViewController?
    

    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    self.tabBarController?.delegate = self
        
        //MARK:- headerImgHeight For iphone and ipad

        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
            headerImgHeight.constant = 150
            
            headerViewHeight.constant = 50
        }
        else {
            
            headerImgHeight.constant = 79
            
        }
        self.createPageMenu()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if(pageMenu != nil){
            self.nameOfItem(indexNumber: 0, countText: "app.AllOffers".localize())
            self.nameOfItem(indexNumber: 1, countText: "app.Recharges".localize())
            self.nameOfItem(indexNumber: 2, countText: "app.DTH/Bills".localize())
            self.nameOfItem(indexNumber: 3, countText: "app.Merchant".localize())
        }
        
//        self.createPageMenu()
        
//        self.tabBarController?.tabBar.isHidden = true
    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        self.tabBarController?.tabBar.isHidden = false
//    }
    
    
    
    
    //MARK:- headerImgHeight For iphone and ipad
    
  
    private func createPageMenu() {
        
        
        allOffersVC = AllOffersViewController(nibName: "AllOffersViewController", bundle: nil)
        allOffersVC?.title = "app.AllOffers".localize()
        allOffersVC?.delegate  = self
        //   allOffersVC?.getLabelForPendingOrders()
        
        
        
        
        
        rechargesVC = RechargesViewController(nibName: "RechargesViewController",
                                              bundle: nil)
        rechargesVC?.title = "app.Recharges".localize()
        rechargesVC?.delegate  = self
        //   rechargesVC?.getLabelForShippedOrders()
        
        
        detAndBillsVC = DetAndBillsViewController(nibName: "DetAndBillsViewController",
                                                  bundle: nil)
        detAndBillsVC?.title = "app.DTH/Bills".localize()
        detAndBillsVC?.delegate  = self
        //     detAndBillsVC?.getLabelForAllOrders()
        
        mearchantVC = MearchantViewController(nibName: "MearchantViewController",
                                              bundle: nil)
        mearchantVC?.title = "app.Merchant".localize()
        mearchantVC?.delegate  = self
        //     mearchantVC?.getLabelForAllOrders()
        
        controllersArray.append(allOffersVC!)
        controllersArray.append(rechargesVC!)
        controllersArray.append(detAndBillsVC!)
        controllersArray.append(mearchantVC!)
        
        
        
        let parameters : [CAPSPageMenuOption] = [CAPSPageMenuOption.scrollMenuBackgroundColor(UIColor.clear),
                                                 CAPSPageMenuOption.viewBackgroundColor(UIColor.clear),
                                                 CAPSPageMenuOption.bottomMenuHairlineColor(UIColor(red: 170.0/255.0, green: 120.0/255.0, blue: 170.0/255.0, alpha: 0.5)),
                                                 CAPSPageMenuOption.menuItemFont( UIFont(name: "HelveticaNeue", size: 13.0)!),
                                                 CAPSPageMenuOption.menuHeight(36),
                                                 CAPSPageMenuOption.centerMenuItems(true),
                                                 CAPSPageMenuOption.selectedMenuItemLabelColor(UIColor.black),
                                                 CAPSPageMenuOption.unselectedMenuItemLabelColor(UIColor.lightGray),
                                                 CAPSPageMenuOption.selectionIndicatorHeight(2.5),
                                                 CAPSPageMenuOption.menuItemMargin(0.0),
                                                 CAPSPageMenuOption.useMenuLikeSegmentedControl(true),
                                                 CAPSPageMenuOption.menuItemSeparatorWidth(0.0),
                                                 CAPSPageMenuOption.menuItemSeparatorColor(UIColor.white),
                                                 CAPSPageMenuOption.enableHorizontalBounce(false),
                                                 CAPSPageMenuOption.addBottomMenuHairline(true),
                                                 CAPSPageMenuOption.menuItemWidthBasedOnTitleTextWidth(false),CAPSPageMenuOption.hideSubTitle(false)]
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
            pageMenu = CAPSPageMenu(viewControllers: controllersArray,subTitles:self.subTitlesArray,
                                    frame: CGRect.init(x: 0.0, y: 200.0, width: self.view.frame.size.width, height: self.view.frame.size.height-64),
                                    pageMenuOptions: parameters)
        }
        else {
            
            pageMenu = CAPSPageMenu(viewControllers: controllersArray,subTitles:self.subTitlesArray,
                                    frame: CGRect.init(x: 0.0, y: 120.0, width: self.view.frame.size.width, height: self.view.frame.size.height-64),
                                    pageMenuOptions: parameters)
            
        }
        
        self.addChildViewController(pageMenu!)
        pageMenu?.delegate = self
        self.view.addSubview((pageMenu?.view)!)
        pageMenu?.didMove(toParentViewController: self)
        
    }
    
    
    func nameOfItem(indexNumber: Int, countText :String ){
        let menuItem = pageMenu?.menuItems[indexNumber]
        
         menuItem?.titleLabel?.text = countText
        
//        menuItem?.subtitleLabel?.text = "  " + countText + "  "
//        menuItem?.subtitleLabel?.textAlignment = .left
//        menuItem?.subtitleLabel?.sizeToFit()
//        menuItem?.subtitleLabel?.center = CGPoint(x: (menuItem?.bounds.midX)!, y: (menuItem?.bounds.midY)! + 8)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Button Action

    
    @IBAction func backAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }

    
}
