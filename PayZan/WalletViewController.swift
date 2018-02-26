//
//  WalletViewController.swift
//  PayZan
//
//  Created by Mac OS on 30/12/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

protocol walletSubtitleOfIndexDelegate {
    func nameOfItem(indexNumber: Int, countText : String)
}

protocol CopyDataDelegate {
    func stringToBeCopied(stringValue : String)
}

protocol sendTilteDelegate {
    func sendString(stringValue : String)
}

class WalletViewController: UIViewController ,CAPSPageMenuDelegate,walletSubtitleOfIndexDelegate,CopyDataDelegate,sendTilteDelegate {
    
    var pageMenu : CAPSPageMenu?
    
    var sendDelegate:sendTilteDelegate?
    
    @IBOutlet weak var backButtonOutLet: UIButton!
    
    @IBOutlet weak var myWalletLabel: UILabel!
    
    var emptyString3        : String = "0"

    private var controllersArray: [UIViewController] = []
    var subTitlesArray          : Array<String>     = Array()
    
    @IBOutlet weak var walletBalLabel: UILabel!
    
    
    @IBOutlet weak var headerImgHeight: NSLayoutConstraint!
    
    @IBOutlet weak var headerViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var backLabel: UILabel!
    
    @IBOutlet weak var walletTextLabel: UILabel!
    
    
    var allOffersVC : SendMoneyToWalletViewController?
    var rechargesVC : AddMoneyToWalletViewController?
    var detAndBillsVC : MyTransactionViewController?
    
    var add:String? = "Add"

    let strUrl1 = "29,30,31,32,33,34,35,36,37"
    let serviceController = ServiceController()
    var myTranResultList:[MyTranListResultVo] = []
    
    var isIndexValue = false
    var moveToPageIndex = 0
    var selectedIndex = false

    var isFromPageMenu = false
    private var isFromOutdoor = false

    var strr:String! = "app.SendMoneytowallet".localize()
    
    var showBackButton = false

    
    var userId:String? = ""
    var walletId:String? = ""
    
    var sendTitleStr:String!
    

    override func viewDidLoad() {
        super.viewDidLoad()

       
        
        let defaults = UserDefaults.standard
        
        if let userid = defaults.string(forKey: userIDD) {
            
            userId = userid
            
            print("defaults savedString: \(userid)")
        }
        if let walletid = defaults.string(forKey: walletIDD) {
            
            walletId = walletid
            
            print("defaults savedString: \(walletid)")
            
        }
        
        if let walletBal = defaults.string(forKey: walletAmountt) {
            
            walletBalLabel.text = walletBal
            
            print("defaults savedString: \(String(describing: walletBalLabel.text))")
        }
        
        if let walletAmount = defaults.string(forKey: "walletAmount") {
            
            
            walletBalLabel.text = walletAmount
            
            print("defaults savedString: \(walletAmount)")
        }

        
        self.createPageMenu()
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
            headerImgHeight.constant = 150
            
            headerViewHeight.constant = 50
            
            backLabel.font = UIFont.systemFont(ofSize: 16)
            
            walletTextLabel.font = UIFont.systemFont(ofSize: 17)
            
            walletBalLabel.font = UIFont.systemFont(ofSize: 17)
        }
        else {
            
            headerImgHeight.constant = 79
            
            backLabel.font = UIFont.systemFont(ofSize: 12)
            
            walletTextLabel.font = UIFont.systemFont(ofSize: 14)
            
            walletBalLabel.font = UIFont.systemFont(ofSize: 14)
            
            
            
        }

        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
         self.tabBarController?.tabBar.isHidden = false
        
        
        if(pageMenu != nil){
            self.nameOfItem(indexNumber: 0, countText: "app.SendMoneytowallet".localize())
            self.nameOfItem(indexNumber: 1, countText: "app.AddMoneytowallet".localize())
            self.nameOfItem(indexNumber: 2, countText: "app.MyTransactions".localize())
        }
        
        let defaults = UserDefaults.standard
        
        if let walletBal = defaults.string(forKey: walletAmountt) {
            
            let wAmount = Float(walletBal)
            
            walletBalLabel.text = String(describing: wAmount!)
            
            
            print("defaults savedString: \(String(describing: walletBalLabel.text))")
        }
        else {
            
            walletBalLabel.text = "0.00"
        }
        
        if let walletAmount = defaults.string(forKey: "walletAmount") {
            
            let wAmount = Float(walletAmount)
            
            walletBalLabel.text = String(describing: wAmount!)
            
            
            print("defaults savedString: \(walletAmount)")
        }
        
        
        
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        
    }
    
    func sendString(stringValue :String){
        
        
        self.sendTitleStr = stringValue
        
    }
    
    
    private func createPageMenu() {
     

        allOffersVC = SendMoneyToWalletViewController(nibName: "SendMoneyToWalletViewController", bundle: nil)
        
        
        allOffersVC?.copyDelegate  = self
        allOffersVC?.sendDelegate  = self
        allOffersVC!.title = "app.SendMoneytowallet".localize()
//        strr.removeAll()
        allOffersVC?.delegate = self
        
        controllersArray.append(allOffersVC!)
        

        
        
            rechargesVC = AddMoneyToWalletViewController(nibName: "AddMoneyToWalletViewController",
                                                         bundle: nil)
            rechargesVC?.title = "app.AddMoneytowallet".localize()
            rechargesVC?.copyDelegate  = self
            rechargesVC?.delegate  = self
        
        
        controllersArray.append(rechargesVC!)
        
        
        
        detAndBillsVC = MyTransactionViewController(nibName: "MyTransactionViewController",
                                                  bundle: nil)
        detAndBillsVC?.title = "app.MyTransactions".localize()
        detAndBillsVC?.copyDelegate  = self
        detAndBillsVC?.delegate  = self
        
        
        
        controllersArray.append(detAndBillsVC!)
        
        
       
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
            
            let parameters : [CAPSPageMenuOption] = [CAPSPageMenuOption.scrollMenuBackgroundColor(UIColor.white),
                                                     CAPSPageMenuOption.viewBackgroundColor(UIColor.clear),
                                                     CAPSPageMenuOption.bottomMenuHairlineColor(UIColor(red: 170.0/255.0, green: 170.0/255.0, blue: 170.0/255.0, alpha: 0.5)),
                                                     CAPSPageMenuOption.menuItemFont( UIFont(name: "HelveticaNeue", size: 18.0)!),
                                                     CAPSPageMenuOption.menuHeight(36),
                                                     CAPSPageMenuOption.centerMenuItems(true),
                                                     CAPSPageMenuOption.selectedMenuItemLabelColor(UIColor.black),
                                                     CAPSPageMenuOption.unselectedMenuItemLabelColor(UIColor.black),
                                                     CAPSPageMenuOption.selectedMenuItemLabelColor(#colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1)),
                                                     CAPSPageMenuOption.selectionIndicatorHeight(2.5),
                                                     CAPSPageMenuOption.menuItemMargin(0.0),
                                                     CAPSPageMenuOption.useMenuLikeSegmentedControl(true),
                                                     CAPSPageMenuOption.menuItemSeparatorWidth(0.0),
                                                     CAPSPageMenuOption.menuItemSeparatorColor(UIColor.white),
                                                     CAPSPageMenuOption.enableHorizontalBounce(false),
                                                     CAPSPageMenuOption.addBottomMenuHairline(true),
                                                     CAPSPageMenuOption.menuItemWidthBasedOnTitleTextWidth(false),CAPSPageMenuOption.hideSubTitle(false)]
            
            headerImgHeight.constant = 150
            
            pageMenu = CAPSPageMenu(viewControllers: controllersArray,subTitles:self.subTitlesArray,
                                    frame: CGRect.init(x: 0.0, y: 300.0, width: self.view.frame.size.width, height: self.view.frame.size.height-64),
                                    pageMenuOptions: parameters)

        }
        else {
            
            
            let parameters : [CAPSPageMenuOption] = [CAPSPageMenuOption.scrollMenuBackgroundColor(UIColor.white),
                                                     CAPSPageMenuOption.viewBackgroundColor(UIColor.clear),
                                                     CAPSPageMenuOption.bottomMenuHairlineColor(UIColor(red: 170.0/255.0, green: 170.0/255.0, blue: 170.0/255.0, alpha: 0.5)),
                                                     CAPSPageMenuOption.menuItemFont( UIFont(name: "HelveticaNeue", size: 10.0)!),
                                                     CAPSPageMenuOption.menuHeight(36),
                                                     CAPSPageMenuOption.centerMenuItems(true),
                                                     CAPSPageMenuOption.selectedMenuItemLabelColor(UIColor.black),
                                                     CAPSPageMenuOption.unselectedMenuItemLabelColor(UIColor.black),
                                                     CAPSPageMenuOption.selectedMenuItemLabelColor(#colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1)),
                                                     CAPSPageMenuOption.selectionIndicatorHeight(2.5),
                                                     CAPSPageMenuOption.menuItemMargin(0.0),
                                                     CAPSPageMenuOption.useMenuLikeSegmentedControl(true),
                                                     CAPSPageMenuOption.menuItemSeparatorWidth(0.0),
                                                     CAPSPageMenuOption.menuItemSeparatorColor(UIColor.white),
                                                     CAPSPageMenuOption.enableHorizontalBounce(false),
                                                     CAPSPageMenuOption.addBottomMenuHairline(true),
                                                     CAPSPageMenuOption.menuItemWidthBasedOnTitleTextWidth(false),CAPSPageMenuOption.hideSubTitle(false)]
            
            headerImgHeight.constant = 79
            
            pageMenu = CAPSPageMenu(viewControllers: controllersArray,subTitles:self.subTitlesArray,
                                    frame: CGRect.init(x: 0.0, y: 210.0, width: self.view.frame.size.width, height: self.view.frame.size.height-64),
                                    pageMenuOptions: parameters)

            
        }

        
        
        self.addChildViewController(pageMenu!)
        pageMenu?.delegate = self
        
        if showBackButton == true {
            pageMenu?.moveToPage(moveToPageIndex)
            backButtonOutLet.isHidden = false
            myWalletLabel.isHidden = false
            
        }else{
            
            pageMenu?.moveToPage(moveToPageIndex)
            backButtonOutLet.isHidden = true
             myWalletLabel.isHidden = true
        }
        
       
       
        
        self.view.addSubview((pageMenu?.view)!)
        pageMenu?.didMove(toParentViewController: self)
        
        
    }
    
   
    
    func nameOfItem(indexNumber: Int, countText :String ){
        let menuItem = pageMenu?.menuItems[indexNumber]
        menuItem?.titleLabel?.text = countText
   
        
    }
    

    func stringToBeCopied(stringValue :String){

        
        let wAmount = Float(stringValue)
        
        self.walletBalLabel.text = String(describing: wAmount!)
        
        
    }
    

    @IBAction func walletBackButtonClicked(_ sender: Any) {
        
        
        self.navigationController?.popViewController(animated: true)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
