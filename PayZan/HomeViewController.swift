//
//  HomeViewController.swift
//  PayZan
//
//  Created by CalibrageMac02 on 05/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit

 //MARK:- For images

var imageArray = [UIImage(named:"mobileImg"),UIImage(named:"landlineImg"),UIImage(named:"dth"),UIImage(named:"broadband"),UIImage(named:"cabletv"),UIImage(named:"electricityImg"),UIImage(named:"waterImg"),UIImage(named:"datacard")]

var imageArray1 = [UIImage(named:"mobileImg"),UIImage(named:"landlineImg"),UIImage(named:"dth"),UIImage(named:"broadband"),UIImage(named:"cabletv"),UIImage(named:"electricityImg"),UIImage(named:"waterImg"),UIImage(named:"datacard")]

var imageArray2 = [UIImage(named:"mobile"),UIImage(named:"landline"),UIImage(named:"electricity"),UIImage(named:"event"),UIImage(named:"sport"),UIImage(named:"television"),UIImage(named:"water-tap"),UIImage(named:"internet")]

//  //MARK:- for label names


var namesarra1 = [String]()

var namesarra2 = ["Water","Landline","Electricity","Events","Sports","DTH","Mobile","Internet"]

var namesarra3 = ["Mobile","Landline","Electricity","Events","Sports","DTH","Water","Internet"]

  //MARK:-  for heading names

var namesarra4 = [String]()

class HomeViewController: UIViewController,UITabBarControllerDelegate,UITableViewDelegate,UITableViewDataSource,SWRevealViewControllerDelegate,UIScrollViewDelegate,UITabBarDelegate {
    
    var delegate: walletSubtitleOfIndexDelegate?


     //MARK:-  OutLets
    
    @IBOutlet weak var sideMenuBtn: UIButton!
    
    @IBOutlet weak var menuBtnItem: UIBarButtonItem!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var walletLabel: UILabel!
    
//    @IBOutlet weak var tabBar: UITabBar!
    
    @IBOutlet weak var paySendImg: UIImageView!
    
    @IBOutlet weak var addWithdrawImg: UIImageView!
    
    @IBOutlet weak var myTransactionImg: UIImageView!
    
    @IBOutlet weak var paySendBtn: UIButton!
    
    @IBOutlet weak var addWithdrawBtn: UIButton!
    
    @IBOutlet weak var myTransactionBtn: UIButton!
    
    
    @IBOutlet weak var payzanWalletLabel: UILabel!
    
    @IBOutlet weak var paySendLbl: UILabel!
    
    @IBOutlet weak var addWidthdrawLbl: UILabel!
    
    @IBOutlet weak var mytransactionLbl: UILabel!
    
    @IBOutlet weak var bellBtn: UIButton!
    
    
    @IBOutlet weak var btnViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var headerImgHeight: NSLayoutConstraint!
    
    @IBOutlet weak var headerViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var walletViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var paySendWidth: NSLayoutConstraint!
    
    @IBOutlet weak var paysendHeight: NSLayoutConstraint!
    
    @IBOutlet weak var addWithdrawHeight: NSLayoutConstraint!
    
    @IBOutlet weak var addWithdrawWidth: NSLayoutConstraint!
    
    @IBOutlet weak var paysendLabelHeight: NSLayoutConstraint!
    
    @IBOutlet weak var addwithdrawLblHeight: NSLayoutConstraint!
    
    
    //MARK:- Variables

    var sendMoney = 0
    var addMoney = 1
    var myTransaction = 3

    var loginStr = String()
    
    
    var userID:String?
    var walletID:String?
    
    var userId:String? = ""

    
    let myImages = ["baner","baner2","baner1","baner3","baner","baner1","baner2","baner3","baner"]
    
    var section1TitleArray = ["Mobile","LandLine","DTH","Electricity Bill","Payzan Wallet","Internet"]
    
     var iconsArray = [UIImage(named:"mobileImg"),UIImage(named:"mobileImg"),UIImage(named:"mobileImg"),UIImage(named:"mobileImg"),UIImage(named:"mobileImg"),UIImage(named:"home_internet_icon")]
    
    var scrollView: UIScrollView!
    var containerView = UIView()
    
    var myNewView = UIView()
    
    var walletBal:String?
    
    var refreshControl: UIRefreshControl!
    
    var walletId:String? = ""
    
    var offSet: CGFloat = 0
    var timer : Timer!
    var counter = 0
    
    let bounds = UIScreen.main.bounds
    
    var pageControl = UIPageControl()
    

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
        
        if let walletid = defaults.string(forKey: walletAmId) {
            
            walletId = walletid
            
            print("defaults savedString: \(walletid)")
            
        }
        
        
        if let walletBal = defaults.string(forKey: walletAmountt) {
            
            let wAmount = Float(walletBal)
            
            walletLabel.text = String(describing: wAmount!)
            
            print("defaults savedString: \(String(describing: walletLabel.text))")
            
            if let tabStrings = self.tabBarController?.tabBar.items
            {
                tabStrings[1].title = "MyProfile".localize(value: "My Profile")
            }
            
            
        }
        
        if let walletAmount = defaults.string(forKey: "walletAmount") {
            
            
            let wAmount = Float(walletAmount)
            
            walletBal = String(describing: wAmount!)
            
            walletLabel.text = walletBal
            
            print("defaults savedString: \(walletAmount)")
        }
        
        // Pull to refresh
        
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "")
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tableView.addSubview(refreshControl)
        
        namesarra4 = ["HRECHARGEANDBILLPAYMENT".localize(value: "Your HRECHARGEANDBILLPAYMENT"),"  BOOK ON PAYZAN","  Mera Cashback Sale"]
        
        namesarra1 = ["HMobile".localize(value: "Your HMobile"),"HLandline".localize(value: "Your HLandline"),"HDTH".localize(value: "Your HDTH"),"HBroadband".localize(value: "Your HBroadband"),"HCableTV".localize(value: "Your HCableTV"),"HElectricity".localize(value: "Your HElectricity"),"HWater".localize(value: "Your HWater"),"HDataCard".localize(value: "Your HDataCard")]
        
        
       
        
        tableView.dataSource = self
        tableView.delegate = self
        
        self.tableView.separatorStyle = .none
        
        
        
        self.scrollView = UIScrollView()
        self.scrollView.delegate = self
        
        
        //MARK:- headerImgHeight For iphone and ipad

        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
        self.scrollView.contentSize = CGSize(width: self.bounds.width, height: 200)
        self.myNewView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 200))
            
        self.pageControl = UIPageControl(frame: CGRect(x:0,y: 115, width:self.myNewView.frame.size.width - 10, height:20))
            
            for (index, image) in myImages.enumerated() {
                let image = image
                let imageView = UIImageView(image: UIImage(named: image)!)
                imageView.contentMode = .scaleAspectFit
                imageView.frame.size.width = self.bounds.size.width
                //                        imageView.center = self.scrollView.center
                imageView.frame.size.height = 120
                imageView.frame.origin.x = CGFloat(index) * self.bounds.size.width
                scrollView.addSubview(imageView)
                
                
            }
            walletLabel.layer.cornerRadius = 5
            walletLabel.layer.masksToBounds = true
            

//            }
            payzanWalletLabel.font = UIFont.systemFont(ofSize: 20)
            paySendLbl.font = UIFont.systemFont(ofSize: 20)
            addWidthdrawLbl.font = UIFont.systemFont(ofSize: 20)
            
            walletLabel.font = UIFont.systemFont(ofSize: 20)
            
            headerViewHeight.constant = 50
            
            btnViewHeight.constant = 150
            headerImgHeight.constant = 150
            
            walletViewHeight.constant = 45
            
paysendLabelHeight.constant = 25
            
            paysendHeight.constant = 140
            paySendWidth.constant = 200
            addWithdrawWidth.constant = 200
            
            addWithdrawHeight.constant = 140
            
            

        
        }
        
        else{
            
            
            walletLabel.layer.cornerRadius = 3
            walletLabel.layer.masksToBounds = true
             self.scrollView.contentSize = CGSize(width: self.bounds.width, height: 80)
            self.myNewView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80))
            
             self.pageControl = UIPageControl(frame: CGRect(x:0,y: 75, width:self.myNewView.frame.size.width - 10, height:20))
            
            for (index, image) in myImages.enumerated() {
                let image = image
                let imageView = UIImageView(image: UIImage(named: image)!)
                imageView.contentMode = .scaleAspectFit
                imageView.frame.size.width = self.bounds.size.width
                imageView.frame.size.height = 80
                imageView.frame.origin.x = CGFloat(index) * self.bounds.size.width
                scrollView.addSubview(imageView)
            }
            
            btnViewHeight.constant = 70
            headerImgHeight.constant = 79
            
            walletLabel.font = UIFont.systemFont(ofSize: 13)

        }
        
        
        myNewView.addSubview(scrollView)
        
        self.pageControl.pageIndicatorTintColor = UIColor.lightGray
        self.pageControl.currentPageIndicatorTintColor = UIColor.black
        
        myNewView.addSubview(pageControl)
        
        scrollView.showsHorizontalScrollIndicator = false
        
        scrollView.isScrollEnabled = true
        
        containerView.backgroundColor = UIColor.red
        
        containerView.isUserInteractionEnabled = true
        
        self.scrollView.alwaysBounceHorizontal = true
        
       
        
        self.offSet = 0
        
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(doSomeAnimation), userInfo: nil, repeats: true)
        
        pageControl.numberOfPages = myImages.count
        
        
        
        scrollView.contentSize.width = self.bounds.width * CGFloat(myImages.count)
        scrollView.showsHorizontalScrollIndicator = false
        
        scrollView.isPagingEnabled = true
        
        
        
        //MARK:- NibName

        let nibName  = UINib(nibName: "FirsrHomeTableViewCell" , bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "FirsrHomeTableViewCell")
        
        
        
        let nibName1  = UINib(nibName: "HomeTableViewCell" , bundle: nil)
        tableView.register(nibName1, forCellReuseIdentifier: "HomeTableViewCell")
        

        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "HomeCell")
        
        self.tabBarController?.delegate = self
        
     if defaults.string(forKey: "1") != nil {
        
            if let loginSuccesMsg = defaults.string(forKey: loginSuccessfulStr) {
                
                self.view.makeToast(loginSuccesMsg, duration:kToastDuration, position:CSToastPositionBottom)
                
        }
        
         defaults.removeObject(forKey: "1")
         defaults.synchronize()
        
        }
        
     
    
     
    }
    
    //MARK: UIScrollView Delegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let viewWidth: CGFloat = scrollView.frame.size.width
        let pageNumber = floor((scrollView.contentOffset.x - viewWidth / 50) / viewWidth) + 1
        pageControl.currentPage = Int(pageNumber)
    }
    
    func loadScrollView() {
        
        self.offSet = 0
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(doSomeAnimation), userInfo: nil, repeats: true)
        
        scrollView.isPagingEnabled = true
        scrollView.contentSize.height = 112
        scrollView.showsHorizontalScrollIndicator = false
        
        scrollView.delegate = self
        

    }
    
    func doSomeAnimation() {
        
        let imgsCount:CGFloat = CGFloat(myImages.count)
        let pageWidth:CGFloat = self.scrollView.frame.width
        let maxWidth:CGFloat = pageWidth * imgsCount
        let contentOffset:CGFloat = self.scrollView.contentOffset.x
        
        var slideToX = contentOffset + pageWidth
        
        if  contentOffset + pageWidth == maxWidth{
            slideToX = 0
        }
        let currentPage:CGFloat = slideToX / pageWidth
        
        // Change the indicator
        self.pageControl.currentPage = Int(currentPage)
        self.scrollView.scrollRectToVisible(CGRect(x:slideToX, y:0, width:pageWidth, height:self.scrollView.frame.height), animated: true)
    }
    
    func refresh(_ sender: Any) {
        //  your code to refresh tableView
        
        print("refreshhh")
        
        GetWalletAmountService()
        
    }
    
    
    func GetWalletAmountService(){
        
        if(appDelegate.checkInternetConnectivity()){
            
            if !(walletId?.isEmpty)! {
                
                let strUrl = getWalletAmountUrl + "" + walletId!
                
                self.refreshControl.beginRefreshing()
                
                self.refreshControl.endRefreshing()
                
                print("strUrl: \(strUrl)")
                
                serviceController.requestGETURL(strURL:strUrl, success:{(result) in
                    DispatchQueue.main.async()
                        {
                            
                            let respVO:GetWalletAmountVo = Mapper().map(JSONObject: result)!
                            
                            
                            let isActive = respVO.IsSuccess
                            
                            
                            if(isActive == true){
                                
                                self.refreshControl.endRefreshing()
                                
                                let listResultVo = respVO.Result
                                
                                if listResultVo != nil {
                                    
                                    let walletAm = listResultVo?.Balance
                                    
                                    let defaults = UserDefaults.standard
                                    
                                    defaults.set(walletAm, forKey: "walletAmount")
                                    
                                    let wAmount = Float(walletAm!)
                                    
                                    self.walletLabel.text = String(describing: wAmount)
                                    
                                    
                                }
                               
                                
                                DispatchQueue.main.async(execute: { () -> Void in
                                    
                                    self.tableView.reloadData()
                                })
                                
                                
                            }else if(isActive == false) {
                                
                                self.refreshControl.endRefreshing()
                                
                                self.view.makeToast("Service not found", duration:kToastDuration, position:CSToastPositionCenter)
                                
                            }
                            
                    }
                }, failure:  {(error) in
                    
                    self.refreshControl.endRefreshing()
                    
                    if(error == "unAuthorized"){
                        
                        serviceController.refreshTokenForLogin(successHandler:{(result) in
                            DispatchQueue.main.async()
                                {
                                    
                                   self.GetWalletAmountService()
                                    
                            }
                        }, failureHandler:  {(error) in
                            
                            DispatchQueue.main.async()
                                {
                                    
                                    let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                                    
                                    let viewController = mainStoryboard.instantiateViewController(withIdentifier: "LoginNav") as! UINavigationController
                                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                                    appDelegate.window?.rootViewController = viewController
                                    
                            }
                            
                            
                        })
                    }
                    
                    
                    
                })
            }
        }
        else {
            
            appDelegate.window?.makeToast(kNetworkStatusMessage, duration:kToastDuration, position:CSToastPositionCenter)
            return
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.isHidden = false
        
        namesarra4 = ["HRECHARGEANDBILLPAYMENT".localize(value: "Your HRECHARGEANDBILLPAYMENT"),"BOOKONPAYZAN".localize(value: "Your HRECHARGEANDBILLPAYMENT"),"MeraCashbackSale".localize(value: "Your HRECHARGEANDBILLPAYMENT")]
        
        namesarra1 = ["HMobile".localize(value: "Your HMobile"),"HLandline".localize(value: "Your HLandline"),"HDTH".localize(value: "Your HDTH"),"HBroadband".localize(value: "Your HBroadband"),"HCableTV".localize(value: "Your HCableTV"),"HElectricity".localize(value: "Your HElectricity"),"HWater".localize(value: "Your HWater"),"HDataCard".localize(value: "Your HDataCard")]
        
        tableView.reloadData()
        
        
        let defaults = UserDefaults.standard
        
        if let walletBal = defaults.string(forKey: walletAmountt) {
            
            
            let wAmount = Float(walletBal)
            
            self.walletLabel.text = String(describing: wAmount!)
            
            
            print("defaults savedString: \(String(describing: walletLabel.text))")
            
            if let tabStrings = self.tabBarController?.tabBar.items
            {
                tabStrings[1].title = "MyProfile".localize(value: "My Profile")
            }
            
            
        }
        else {
            
            walletLabel.text = "0"
        }
        
        if let walletAmount = defaults.string(forKey: "walletAmount") {
            
            let wAmount = Float(walletAmount)
            
            walletBal = String(describing: wAmount!)
            
//            walletBal = walletAmount
            
            walletLabel.text = walletBal
            
            print("defaults savedString: \(walletAmount)")
            
        }
        
        
        if let tabStrings = self.tabBarController?.tabBar.items
        {
            let tabTitle:String! = tabStrings[1].title
            
            if  tabTitle == "Login" || tabTitle == "உள் நுழை" || tabTitle == "ඇතුල් වන්න"{
                
                tabStrings[1].title = "app.Login".localize()
                
            }
            else {
                
                tabStrings[1].title = "app.MyProfile".localize()
            }
        }

    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.frame = myNewView.bounds
        containerView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)

    
    }
    
     //MARK:- iPhoneScreenSizes

    func iPhoneScreenSizes(){
        let bounds = UIScreen.main.bounds
        let height = bounds.size.height
        
        switch height {
        case 480.0:
            print("iPhone 3,4")

        case 568.0:
            print("iPhone 5")
            
        case 667.0:
            print("iPhone 6")
            
        case 736.0:
            print("iPhone 6+")
            
            
        case 1024.0:
            print("iPadAir")
            
            
        default:
            print("not an iPhone")
            
            
        }
        
        
    }
    //MARK:- Tableview Datasource Methods

    
    public func numberOfSections(in tableView: UITableView) -> Int {
        
        
        return 1
        
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat{
        
        return 100
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height:CGFloat = CGFloat()
        
        if indexPath.row == 0 {
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {

            return 260
            }
            else {
                
                height = 150
                
            }
        }

        
        if indexPath.row == 1 {
            
            
                if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
                    
                    height = 500
                }
                else {
                    
                    let bounds = UIScreen.main.bounds
                    let sHeight = bounds.size.height
                    
                    switch sHeight {
                    case 480.0:
                        print("iPhone 3,4")
                        
                        height = 180
                        
                    case 568.0:
                        print("iPhone 5")
                        
                        height = 200
                        
                    case 667.0:
                        print("iPhone 6")
                        
                        height = 230
                        
                    case 736.0:
                        print("iPhone 6+")
                        
                        height = 250
                        
                        
                    case 1024.0:
                        print("iPadAir")
                        
                        
                    default:
                        print("not an iPhone")
                        
                        
                    }
                    
                }
                
            }
        else
            
            
            if indexPath.row == 1{
                
                if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {

            height = 400
        }
        
        
        else {
            
            height = 130
            
        }
        }
        return height
        
        
        //  return 230
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        
        if(indexPath.row == 0){
            let profileCell = tableView.dequeueReusableCell(withIdentifier: "FirsrHomeTableViewCell", for: indexPath) as! FirsrHomeTableViewCell
            
            
            return profileCell
            
        }
        else {
            
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
            
            cell.homeColeectionVW.register(UINib.init(nibName: "HomeCollectionViewCell", bundle: nil),
                                           forCellWithReuseIdentifier: "HomeCollectionViewCell")
            cell.homeColeectionVW.tag = indexPath.row
            
            
            cell.homeColeectionVW.collectionViewLayout.invalidateLayout()
            
            
            cell.homeColeectionVW.delegate = self
            cell.homeColeectionVW.dataSource = self
            
            cell.homeColeectionVW.reloadData()
            
            
            return cell
        }
        
        
        
    }
    
    func addAgentAction(_ sender: UIButton) {
        
        let addMoneyViewController = self.storyboard?.instantiateViewController(withIdentifier: "RequestForAgentViewController") as! RequestForAgentViewController
        
        self.navigationController?.pushViewController(addMoneyViewController, animated: true)
        
    }
    
    
    @IBAction func menuAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func paySendAction(_ sender: Any) {
        
        let addMoneyViewController = self.storyboard?.instantiateViewController(withIdentifier: "TransactionsViewController") as! TransactionsViewController
        
        
        self.navigationController?.pushViewController(addMoneyViewController, animated: true)
        
    }
    
    @IBAction func addWithdrawAction(_ sender: Any) {
        
        let addMoneyViewController = self.storyboard?.instantiateViewController(withIdentifier: "CommissionsViewController") as! CommissionsViewController
        
        
        
        self.navigationController?.pushViewController(addMoneyViewController, animated: true)
    }
    
    @IBAction func myTransactionAction(_ sender: Any) {
        
        let addMoneyViewController = self.storyboard?.instantiateViewController(withIdentifier: "AddMoneyWalletViewController") as! AddMoneyWalletViewController
        
        addMoneyViewController.indexValue = 2
        addMoneyViewController.isHiddenTransactionView = false
        addMoneyViewController.isHiddenWithdrawView = true
        addMoneyViewController.isHiddenSendView = true
        
        self.navigationController?.pushViewController(addMoneyViewController, animated: true)
    }
    
}

 //MARK:- Collectionview Extension

extension HomeViewController:UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        if collectionView.tag == 0 {
            
            return imageArray.count
            
        } else if collectionView.tag == 1{
            
            return imageArray1.count
        }
        else if collectionView.tag == 2{
                
                return imageArray2.count
        }
        
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        
        cell.productIMG.image =   imageArray[indexPath.row]
        
        cell.nameLBL.text = namesarra1[indexPath.row]
        return cell
    }
    
     //MARK:- Collectionview didSelectItemAt indexPath
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
        
        if indexPath.item == 0 {
            
            let rchargeViewController = self.storyboard?.instantiateViewController(withIdentifier: "RechargeViewController") as! RechargeViewController
            self.navigationController?.pushViewController(rchargeViewController, animated: true)
        }
        else if indexPath.item == 1 {
            
            let landViewController = self.storyboard?.instantiateViewController(withIdentifier: "LandlineViewController") as! LandlineViewController
            self.navigationController?.pushViewController(landViewController, animated: true)
            
            
        }
        else if indexPath.item == 2 {
            
            let dthViewController = self.storyboard?.instantiateViewController(withIdentifier: "DTHViewController") as! DTHViewController
            self.navigationController?.pushViewController(dthViewController, animated: true)
            
            
        }
        else if indexPath.item == 3 {
            
            let cableViewController = self.storyboard?.instantiateViewController(withIdentifier: "BroadbandViewController") as! BroadbandViewController
            self.navigationController?.pushViewController(cableViewController, animated: true)
        }
        else if indexPath.item == 4 {
            
            let cableViewController = self.storyboard?.instantiateViewController(withIdentifier: "CableTvViewController") as! CableTvViewController
            self.navigationController?.pushViewController(cableViewController, animated: true)
        }
        else if indexPath.item == 5 {
            
            let electricityViewController = self.storyboard?.instantiateViewController(withIdentifier: "ElectricityViewController") as! ElectricityViewController
            self.navigationController?.pushViewController(electricityViewController, animated: true)
        }
            
        else if indexPath.item == 6 {
            
            let cableViewController = self.storyboard?.instantiateViewController(withIdentifier: "WaterViewController") as! WaterViewController
            self.navigationController?.pushViewController(cableViewController, animated: true)
        }
        else if indexPath.item == 7 {
            
            let dthViewController = self.storyboard?.instantiateViewController(withIdentifier: "DatacardViewController") as! DatacardViewController
            self.navigationController?.pushViewController(dthViewController, animated: true)
        }
    }
    
      //MARK:- Collectionview sizeForItemAt indexPath
    
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
            let cellsPerRow = 4
            
            let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
            let marginsAndInsets = flowLayout.sectionInset.left + flowLayout.sectionInset.right + flowLayout.minimumInteritemSpacing * CGFloat(cellsPerRow - 1)
            let itemWidth = ((collectionView.bounds.size.width - marginsAndInsets) / CGFloat(cellsPerRow)).rounded(.down)
            return CGSize(width: itemWidth, height: itemWidth)
        }
        else {
            

            let cellsPerRow = 4
            
            let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
            let marginsAndInsets = flowLayout.sectionInset.left + flowLayout.sectionInset.right + flowLayout.minimumInteritemSpacing * CGFloat(cellsPerRow - 1)
            let itemWidth = ((collectionView.bounds.size.width - marginsAndInsets) / CGFloat(cellsPerRow)).rounded(.down)
            return CGSize(width: itemWidth, height: itemWidth)
            
        }
        
      
    }
}

