//
//  ProfileViewController.swift
//  PayZan
//
//  Created by CalibrageMac02 on 12/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit
import Localize

class ProfileViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource,ViewControllerBDelegate {
    
    //MARK:- OutLets
 

    @IBOutlet weak var profileTVC: UITableView!
    
    var firstName  = String()
    var lastName  = String()
    
    let tab = TabsViewController()
    
    @IBOutlet weak var headerImgHeight: NSLayoutConstraint!
    
    @IBOutlet weak var headerViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var profileTitleLabel: UILabel!
    
    //MARK:- Variables

    
    var userNamee:String?
    var userEmail:String?
    var walletBal:String?
    
    var imagePic: UIImage? = nil
    
    var isUserLogin = true
    
    var labelText1:String?
    
     var addMoney = 1
    
    let languagePicker = UIPickerView()
    var toolBar = UIToolbar()
    var pickerData : Array<String> = Array()
    
//    var listArr = ["Saved Cards","Order History","Change Password","About Us","Support","Terms Of Service","Choose Language"]
    
    var listArr = [String]()
    
    var imageArray1 = [UIImage(named:"savedCards"),UIImage(named:"orderHistory"),UIImage(named:"changePassword"),UIImage(named:"terms_of_use"),UIImage(named:"about_us"),UIImage(named:"support"),UIImage(named:"terms_of_use"),UIImage(named:"choose_lang")]
    
    private var activityViewController : UIActivityViewController!
    private var isPopoverPresented  : Bool = false
    
    var walletId:String? = ""
    
    var profileEmailId:String? = ""
    var refreshControl: UIRefreshControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "")
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        profileTVC.addSubview(refreshControl)
        
        let defaults = UserDefaults.standard
        
        if let walletid = defaults.string(forKey: walletAmId) {
            
            walletId = walletid
            
            print("defaults savedString: \(walletid)")
            
        }
        
        if let emaill = defaults.string(forKey: profileEmail) {
            
            userEmail = emaill
            
            print("defaults savedString: \(emaill)")
            
        }
        
        
        if let walletamount = defaults.string(forKey: walletAmountt) {
            
            
            let wAmount = Float(walletamount)
            
            walletBal = String(describing: wAmount!)
            
//            walletBal = walletamount
            
            print("defaults savedString: \(String(describing: walletBal))")
        }
        
        if let walletAmount = defaults.string(forKey: "walletAmount") {
            
            let wAmount = Float(walletAmount)
            
            walletBal = String(describing: wAmount!)
            
//            walletBal = walletAmount
            
            print("defaults savedString: \(walletAmount)")
        }
        
        
        if let userName = defaults.string(forKey: uNamee) {
            
            userNamee = userName
            
            print("userName: \(String(describing: userNamee))")
        }
        else {
            
            userNamee = "User Name"
        }
        
        if let email = defaults.string(forKey:emailIdd ) {
            
            userEmail = email
            
            print("userName: \(String(describing: userEmail))")
        }
        else {
            
            userEmail = "abc@gmail.com"
        }
        
        self.profileTVC.delegate = self
        self.profileTVC.dataSource = self
        
        self.profileTVC.separatorStyle = .none
        
        
        profileTVC.sectionIndexBackgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        profileTVC.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        
        //MARK:- NibName

        
        let nibName  = UINib(nibName: "ListTableViewCell" , bundle: nil)
        profileTVC.register(nibName, forCellReuseIdentifier: "ListTableViewCell")
        
        let nibName1  = UINib(nibName: "SignOutTableViewCell" , bundle: nil)
        profileTVC.register(nibName1, forCellReuseIdentifier: "SignOutTableViewCell")
        
        let nibName2  = UINib(nibName: "ProfileTableViewCell" , bundle: nil)
        profileTVC.register(nibName2, forCellReuseIdentifier: "ProfileTableViewCell")
        
        let nibName3  = UINib(nibName: "QRTableViewCell" , bundle: nil)
        profileTVC.register(nibName3, forCellReuseIdentifier: "QRTableViewCell")
        
        //MARK:- headerImgHeight For iphone and ipad

        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
            headerImgHeight.constant = 150
            
            headerViewHeight.constant = 50
            
            profileTitleLabel.font = UIFont.systemFont(ofSize: 22)
        }
        else {
            
            headerImgHeight.constant = 79
            
        }
        
        localize()
        
        
       listArr =  ["SCards".localize(value: "Your SCards"),"OHistory".localize(value: "Your OHistory"),"CPassword".localize(value: "Your CPassword"),"Addaress".localize(value: "Your Addaress"),"AUs".localize(value: "Your AUs"),"Support".localize(value: "Your Support"),"TService".localize(value: "Your TService"),"CLanguage".localize(value: "Your CLanguage")]
        

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- localize

    
    func localize() {
        
        
        print("app.names".localize(values: "mani", "manoj", "peater"))
        
        print("username".localize(value: "Your username"))
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(true)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.isHidden = false
        
      listArr = ["SCards".localize(value: "Your SCards"),"OHistory".localize(value: "Your OHistory"),"CPassword".localize(value: "Your CPassword"),"Addaress".localize(value: "Your Addaress"),"AUs".localize(value: "Your AUs"),"Support".localize(value: "Your Support"),"TService".localize(value: "Your TService"),"CLanguage".localize(value: "Your CLanguage")]
        
        profileTVC.reloadData()
        
        let defaults = UserDefaults.standard
        
        
//        DispatchQueue.main.async {
        
//            let defaults = UserDefaults.standard
            
            if let picUrl = defaults.string(forKey: profilePicUrl){
                
                let newString = picUrl.replacingOccurrences(of: "\\", with: "//", options: .backwards, range: nil)
                
                print("filteredUrlString:\(newString)")
                
                let url = URL(string:newString)
                
                
                let dataImg = try? Data(contentsOf: url!)
                
                if dataImg != nil {
                    
                    self.imagePic = UIImage(data: dataImg!)!
                }
                
            }
            
//        }
      
        
        if let walletAmount = defaults.string(forKey: "walletAmount") {
            
            
            let wAmount = Float(walletAmount)
            
            walletBal = String(describing: wAmount!)
            
//            walletBal = walletAmount
            
            print("defaults savedString: \(walletAmount)")
            
            profileTVC.reloadData()
        }
        
        if let emaill = defaults.string(forKey: profileEmail) {
            
            userEmail = emaill
            
            print("defaults savedString: \(emaill)")
            
            profileTVC.reloadData()
            
        }

        
        
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
                                    
                                    self.walletBal = String(describing: wAmount)
                                    
//                                    self.walletBal = String(describing: walletAm!)
                                    
                                }
                                
                                DispatchQueue.main.async(execute: { () -> Void in
                                    
                                    self.profileTVC.reloadData()
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

    
    //MARK:- textChanged
    
    func textChanged(text: String?) {
        
         labelText1 = text!
        
        print("labelText:\(String(describing: labelText1))")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewControllerB = segue.destination as? EditProfileViewController {
            viewControllerB.text = labelText1
            viewControllerB.delegate = self
            
            print("labelText1:\(String(describing: labelText1))")
        }
    }
    
    //MARK:- Tableview Datasource Methods

    
    func numberOfSections(in tableView: UITableView) -> Int {
                
        if userNamee == "User Name" {
            
            return 3
        }
        else {
            
            return 4
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if(section==0){
            return 1.0
        }
        else if(section==1) {
            
            return 1.0
        }
        else if(section==2) {
            
            return 1.0
            
        }
        else{
            
            return 1.0
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            
            return 1
        }
        else if section == 1 {
            
            return listArr.count
        }
        else if section == 2 {
            
            return 1
        }
        else{
            
            return 1
        }
        
        
    }
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        
//        return 20.0
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            
            if isUserLogin == false {
                
                if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
                    
                    return 120
                }
                else {
                    
                    return 95
                    
                }
                
                
                
            }
            
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
                
                return 120
            }
            else {
                
                return 95
                
            }
            
        }
        else if indexPath.section == 1 {
            
            
            
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
                
                return 55
            }
            else {
                
                return 45
                
            }
        }
        else if indexPath.section == 2 {
            
            
            
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
                
                return 120
            }
            else {
                
                return 100
                
            }
        }
            
        else{
            
            
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
                
               return 80
            }
            else {
                
                return 60
                
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.section == 0 {
            
            if isUserLogin == false {
                
            let cell = Bundle.main.loadNibNamed("LoginTableViewCell", owner: self, options: nil)?.first as! LoginTableViewCell
                
                cell.selectionStyle = .none
                
                cell.newAccountBtn.layer.borderWidth = 0.5
                cell.newAccountBtn.layer.borderColor = UIColor(red: 128/255.0, green: 0, blue: 0, alpha: 1.0).cgColor
                
                cell.loginBtn.addTarget(self, action: #selector(self.loginBtnClicked), for: .touchUpInside)
                cell.newAccountBtn.addTarget(self, action: #selector(self.newAccountBtnClicked), for: .touchUpInside)
                
                cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)

                
                return cell
                
            }
            
            if userNamee == "User Name"{
                
                let cell = Bundle.main.loadNibNamed("LoginTableViewCell", owner: self, options: nil)?.first as! LoginTableViewCell
                
                
                cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                
                cell.selectionStyle = .none
                
                cell.newAccountBtn.layer.borderWidth = 0.5
                cell.newAccountBtn.layer.borderColor = UIColor(red: 128/255.0, green: 0, blue: 0, alpha: 1.0).cgColor
                
                cell.loginBtn.addTarget(self, action: #selector(self.loginBtnClicked), for: .touchUpInside)
                cell.newAccountBtn.addTarget(self, action: #selector(self.newAccountBtnClicked), for: .touchUpInside)
                
                
                return cell
            }
            
            if let tabStrings = self.tabBarController?.tabBar.items
            {
                tabStrings[1].title = "app.MyProfile".localize()
            }
            
             let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as! ProfileTableViewCell
            
            cell.addMoneyBtn.addTarget(self, action: #selector(self.addMoneyAction), for: .touchUpInside)

            cell.editProfileBtn.addTarget(self, action: #selector(self.btnAction), for: .touchUpInside)
            
            cell.editBtn.addTarget(self, action: #selector(self.editAction), for: .touchUpInside)
            
         //   cell.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
         //   cell.layer.borderWidth = 0.5
         //   cell.layer.borderColor = UIColor.lightGray.cgColor
            
            
            cell.userNameLabel.text = userNamee
            
            cell.editImage.layer.cornerRadius = cell.editImage.frame.size.height/2;
            cell.editImage.layer.borderColor = UIColor.gray.cgColor
            cell.editImage.layer.borderWidth = 1
            cell.editImage.clipsToBounds = true
            
            if self.imagePic == nil {
    
                cell.editImage.image = UIImage(named: "user")
                
            }
            else {
                
                cell.editImage.image = imagePic
            }
            
            cell.emaiLabel.text = userEmail
            cell.addWalletLabel.text = walletBal
            
            profileTVC.setContentOffset(CGPoint.zero, animated: true)
            
            return cell
        }
            
        else if indexPath.section == 1 {
        
         let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as! ListTableViewCell
        
        cell.selectionStyle = .none
        cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        cell.textLbl?.text = listArr[indexPath.row]
        cell.ImgeVw.image = imageArray1[indexPath.row]
        cell.layer.backgroundColor = UIColor.white.cgColor
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = UIColor.lightGray.cgColor
        
        cell.textLbl.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        
        return cell
    }
    if indexPath.section == 2 {
                
                
          let cell = tableView.dequeueReusableCell(withIdentifier: "QRTableViewCell", for: indexPath) as! QRTableViewCell
        
        cell.shareBtn.layer.cornerRadius = 5.0
        cell.scanQRBtn.layer.cornerRadius = 5.0
        
        cell.scanQRBtn.setTitle("app.ScanQR".localize(), for: .normal)
        cell.selectionStyle = .none
        
        cell.shareBtn.tag = indexPath.row
        
        cell.shareBtn.addTarget(self, action: #selector(self.shareBtnClicked), for: .touchUpInside)
        cell.scanQRBtn.addTarget(self, action: #selector(self.scanQRBtnClicked), for: .touchUpInside)
      
        return cell
    }
    else  {
        
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "SignOutTableViewCell", for: indexPath) as! SignOutTableViewCell
            
            cell.signOutBtn.tag = indexPath.row
            cell.selectionStyle = .none
            
                if isUserLogin == true {
            
            if userNamee == "User Name" {
                
                cell.signOutBtn.isHidden = true
                
                cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                
                if let tabStrings = self.tabBarController?.tabBar.items
                {
                    tabStrings[1].title = "app.Login".localize()
                }
                
                cell.signOutBtn.addTarget(self, action: #selector(self.signOutClicked), for: .touchUpInside)
            }
            else {
            
            cell.signOutBtn.isHidden = false
                    
                if let tabStrings = self.tabBarController?.tabBar.items
                {
                    tabStrings[1].title = "app.MyProfile".localize(value: "My Profile")
                }
                
                
            cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                
            cell.signOutBtn.addTarget(self, action: #selector(self.signOutClicked), for: .touchUpInside)

                    }
                
            
        }
     return cell
        }
        
        }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
            
            // handle tap events
            print("You selected cell #\(indexPath.item)!")
        
        if indexPath.section == 1 {
            
            if indexPath.row == 0 {
                
                if let tabStrings = self.tabBarController?.tabBar.items
                {
                    let tabTitle:String! = tabStrings[1].title
                    
                    if  tabTitle == "Login" || tabTitle == "உள் நுழை" || tabTitle == "ඇතුල් වන්න"{
                        
                        let alertController = UIAlertController(title: "app.Alert".localize(), message: "app.LoginAlert".localize(), preferredStyle: UIAlertControllerStyle.alert)
                        
                        
                        let cancelAction = UIAlertAction(title: "app.Cancel".localize(), style: UIAlertActionStyle.cancel) { (result : UIAlertAction) -> Void in
                            print("Cancel")
                            
                            
                        }
                        let okAction = UIAlertAction(title: "app.Ok".localize(), style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
                            print("OK")
                            
                            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                            
                            let viewController = mainStoryboard.instantiateViewController(withIdentifier: "LoginNav") as! UINavigationController
                            //                    let navigationController = UINavigationController(rootViewController: viewController)
                            let appDelegate = UIApplication.shared.delegate as! AppDelegate
                            appDelegate.window?.rootViewController = viewController
                        }
                        alertController.addAction(cancelAction)
                        alertController.addAction(okAction)
                        self.present(alertController, animated: true, completion: nil)
                        
                        
                    }
                    else {
                        
                        let rchargeViewController = self.storyboard?.instantiateViewController(withIdentifier: "AddCardsViewController") as! AddCardsViewController
                        self.navigationController?.pushViewController(rchargeViewController, animated: true)

                    }
                }

        
            }
            else if indexPath.row == 1 {
                
                
                if let tabStrings = self.tabBarController?.tabBar.items
                {
                    let tabTitle:String! = tabStrings[1].title
                    
                    if  tabTitle == "Login" || tabTitle == "உள் நுழை" || tabTitle == "ඇතුල් වන්න"{
                        
                        let alertController = UIAlertController(title: "app.Alert".localize(), message: "app.LoginAlert".localize(), preferredStyle: UIAlertControllerStyle.alert)
                        
                        
                        let cancelAction = UIAlertAction(title: "app.Cancel".localize(), style: UIAlertActionStyle.cancel) { (result : UIAlertAction) -> Void in
                            print("Cancel")
                            
                            
                        }
                        let okAction = UIAlertAction(title: "app.Ok".localize(), style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
                            print("OK")
                            
                            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                            
                            let viewController = mainStoryboard.instantiateViewController(withIdentifier: "LoginNav") as! UINavigationController
                            //                    let navigationController = UINavigationController(rootViewController: viewController)
                            let appDelegate = UIApplication.shared.delegate as! AppDelegate
                            appDelegate.window?.rootViewController = viewController
                        }
                        alertController.addAction(cancelAction)
                        alertController.addAction(okAction)
                        self.present(alertController, animated: true, completion: nil)
                        
                        
                    }
                    else {
                        
                        let landViewController = self.storyboard?.instantiateViewController(withIdentifier: "OrderHistoryViewController") as! OrderHistoryViewController
                        self.navigationController?.pushViewController(landViewController, animated: true)
                        
                    }
                }
              
            }
            else if indexPath.row == 2 {
                
                if let tabStrings = self.tabBarController?.tabBar.items
                {
                    let tabTitle:String! = tabStrings[1].title
                    
                    if  tabTitle == "Login" || tabTitle == "உள் நுழை" || tabTitle == "ඇතුල් වන්න"{
                        
                        let alertController = UIAlertController(title: "app.Alert".localize(), message: "app.LoginAlert".localize(), preferredStyle: UIAlertControllerStyle.alert)
                        
                        
                        let cancelAction = UIAlertAction(title: "app.Cancel".localize(), style: UIAlertActionStyle.cancel) { (result : UIAlertAction) -> Void in
                            print("Cancel")
                            
                            
                        }
                        let okAction = UIAlertAction(title: "app.Ok".localize(), style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
                            print("OK")
                            
                            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                            
                            let viewController = mainStoryboard.instantiateViewController(withIdentifier: "LoginNav") as! UINavigationController
                            //                    let navigationController = UINavigationController(rootViewController: viewController)
                            let appDelegate = UIApplication.shared.delegate as! AppDelegate
                            appDelegate.window?.rootViewController = viewController
                        }
                        alertController.addAction(cancelAction)
                        alertController.addAction(okAction)
                        self.present(alertController, animated: true, completion: nil)
                        
                        
                    }
                    else {
                        
                        let dthViewController = self.storyboard?.instantiateViewController(withIdentifier: "changePasswordViewController") as! changePasswordViewController
                        self.navigationController?.pushViewController(dthViewController, animated: true)
                    }
                }
               
            }
            else if indexPath.row == 3 {
                
                if let tabStrings = self.tabBarController?.tabBar.items
                {
                    let tabTitle:String! = tabStrings[1].title
                    
                    if  tabTitle == "Login" || tabTitle == "உள் நுழை" || tabTitle == "ඇතුල් වන්න"{
                        
                        let alertController = UIAlertController(title: "app.Alert".localize(), message: "app.LoginAlert".localize(), preferredStyle: UIAlertControllerStyle.alert)
                        
                        
                        let cancelAction = UIAlertAction(title: "app.Cancel".localize(), style: UIAlertActionStyle.cancel) { (result : UIAlertAction) -> Void in
                            print("Cancel")
                            
                            
                        }
                        let okAction = UIAlertAction(title: "app.Ok".localize(), style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
                            print("OK")
                            
                            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                            
                            let viewController = mainStoryboard.instantiateViewController(withIdentifier: "LoginNav") as! UINavigationController
                            //                    let navigationController = UINavigationController(rootViewController: viewController)
                            let appDelegate = UIApplication.shared.delegate as! AppDelegate
                            appDelegate.window?.rootViewController = viewController
                        }
                        alertController.addAction(cancelAction)
                        alertController.addAction(okAction)
                        self.present(alertController, animated: true, completion: nil)
                        
                        
                    }
                    else {
                        
                        let cableViewController = self.storyboard?.instantiateViewController(withIdentifier: "AddaddressViewController") as! AddaddressViewController
                        self.navigationController?.pushViewController(cableViewController, animated: true)
                    }
                }
 
               
            }
                
            else if indexPath.row == 4 {
                
                               let cableViewController = self.storyboard?.instantiateViewController(withIdentifier: "AboutUsViewController") as! AboutUsViewController
                self.navigationController?.pushViewController(cableViewController, animated: true)
            }
                
            else if indexPath.row == 5 {
                
              
                
                
            }

            else if indexPath.row == 6 {
                
                let cableViewController = self.storyboard?.instantiateViewController(withIdentifier: "TermsOfServiceViewController") as! TermsOfServiceViewController
                self.navigationController?.pushViewController(cableViewController, animated: true)
                
                
            }
            
            else if indexPath.row == 7 {
                
                
                let actionSheet = UIAlertController(title: nil, message: "app.ChooseLanguage".localize(), preferredStyle: .actionSheet)
                for language in Localize.availableLanguages() {
                    let displayName = Localize.displayNameForLanguage(language)
                    let languageAction = UIAlertAction(title: displayName, style: .default, handler: {
                        (alert: UIAlertAction!) -> Void in
                        Localize.update(language: language)
                        
                        self.listArr = ["SCards".localize(value: "Saved Cards"),"OHistory".localize(value: "Order History"),"CPassword".localize(value: "Change Password"),"Addaress".localize(value: "Your Addaress"),"AUs".localize(value: "About Us"),"Support".localize(value: "Support"),"TService".localize(value: "Terms of Service"),"CLanguage".localize(value: "Choose Language")]
                        
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
                        
                        self.profileTVC.reloadData()
                        
                    })
                    actionSheet.addAction(languageAction)
                }
                let cancelAction = UIAlertAction(title: "app.Cancel".localize(), style: UIAlertActionStyle.cancel, handler: {
                    (alert: UIAlertAction) -> Void in
                })
                actionSheet.addAction(cancelAction)
                
                
                if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone) {
                    
                    
                    self.present(actionSheet, animated: true, completion: nil)
                }
                    
                else{
                    
                    let popup = UIPopoverController.init(contentViewController: actionSheet)
                    
                    popup.present(from: CGRect(x:self.view.frame.size.width/2, y:self.view.frame.size.height-280, width:0, height:0), in: self.view, permittedArrowDirections: UIPopoverArrowDirection.any, animated: true)
                    
            }
                
            }
            
            listArr = ["SCards".localize(value: "Your SCards"),"OHistory".localize(value: "Your OHistory"),"CPassword".localize(value: "Your CPassword"),"Addaress".localize(value: "Your Addaress"),"AUs".localize(value: "Your AUs"),"Support".localize(value: "Your Support"),"TService".localize(value: "Your TService"),"CLanguage".localize(value: "Your CLanguage")]
            
            self.profileTVC.reloadData()
            
          }
    
            
        
        
    }
    
    //MARK:- editAction

    
    func editAction(_ sender: UIButton){
        
        let editViewController = self.storyboard?.instantiateViewController(withIdentifier: "EditProfileViewController") as! EditProfileViewController
        
        editViewController.image = UIImage(named:"user")!
        
        
        self.navigationController?.pushViewController(editViewController, animated: true)
    }
    
    //MARK:- addMoneyAction

    
    func addMoneyAction(_ sender: UIButton) {
        
        
        let addMoneyViewController = self.storyboard?.instantiateViewController(withIdentifier: "WalletViewController") as! WalletViewController
        addMoneyViewController.moveToPageIndex = 1
        addMoneyViewController.showBackButton = true
        
        
        addMoneyViewController.add = String(self.addMoney)
        
        //  addMoneyViewController.indexValue = 0
        //  addMoneyViewController.isHiddenSendView = false
        //  addMoneyViewController.isHiddenTransactionView = true
        //   addMoneyViewController.isHiddenWithdrawView = true
        
        self.navigationController?.pushViewController(addMoneyViewController, animated: true)
        
//        let addMoneyViewController = self.storyboard?.instantiateViewController(withIdentifier: "AddMoneyWalletViewController") as! AddMoneyWalletViewController
//        
//        addMoneyViewController.indexValue = 1
//        addMoneyViewController.isHiddenWithdrawView = false
//        addMoneyViewController.isHiddenSendView = true
//        addMoneyViewController.isHiddenTransactionView = true
//    
//        self.navigationController?.pushViewController(addMoneyViewController, animated: true)
        
    }
    
    //MARK:- btnAction
    
    func btnAction(_ sender: UIButton) {
        
        
    }
    
    //MARK:- loginBtnClicked

    
    func loginBtnClicked(_sender: UIButton){
        
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    //MARK:- newAccountBtnClicked

    
    func newAccountBtnClicked(_sender: UIButton){
                
        let signController = self.storyboard?.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
        self.navigationController?.pushViewController(signController, animated: true)
        
    }
    
    //MARK:- shareBtnClicked

    func shareBtnClicked(_sender: UIButton){
        
        let indexPath : IndexPath = IndexPath(row: _sender.tag, section: 2)
        
        if let newCell : QRTableViewCell = profileTVC.cellForRow(at: indexPath) as? QRTableViewCell {
            
            
            let normalString = "Text to share"
            
            activityViewController = UIActivityViewController.init(activityItems: [normalString], applicationActivities: nil)
            
            let subject = "PayZan"
            activityViewController.setValue(subject, forKey: "Subject")
            
            
            if UIScreen.main.bounds.size.width > 500 {
                
                if activityViewController.responds(to: #selector(getter: UIViewController.popoverPresentationController)) {
                    
                    isPopoverPresented = true
                    if let popView = activityViewController.popoverPresentationController {
                        popView.sourceView = profileTVC
                        popView.sourceRect = profileTVC.cellForRow(at: indexPath)!.frame
                    }
                }
            }
            
            self.present(activityViewController, animated: true, completion: nil)
            
        }
        
       
        
    }
    
     //MARK:- scanQRBtnClicked
    
    func scanQRBtnClicked(_sender: UIButton){
        
        let cableViewController = self.storyboard?.instantiateViewController(withIdentifier: "QRCodeViewController") as! QRCodeViewController
        self.navigationController?.pushViewController(cableViewController, animated: true)
        
    }
    
    //MARK:- signOutClicked

    
    func signOutClicked(_sender: UIButton){
        
        
        let indexPath : IndexPath = IndexPath(row: _sender.tag, section: 3)
        
        if let newCell : SignOutTableViewCell = profileTVC.cellForRow(at: indexPath) as? SignOutTableViewCell {
 
        isUserLogin = false
        self.profileTVC .reloadData()
        let button1 = UIBarButtonItem(image: UIImage(named: "Menu"), style: .plain, target: self, action: #selector(self.action))
        
        self.navigationItem.leftBarButtonItem  = button1
        

        if userNamee == "User Name" {
            
            newCell.signOutBtn.isHidden = true
            
            newCell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            
            if let tabStrings = self.tabBarController?.tabBar.items
            {
                tabStrings[1].title = "app.MyProfile".localize()
            }
            
        }
        else {
            
            newCell.signOutBtn.isHidden = true
            
            if let tabStrings = self.tabBarController?.tabBar.items
            {
                tabStrings[1].title = "app.Login".localize()
                
//                UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
//                UserDefaults.standard.synchronize()
                
                        if UserDefaults.standard.object(forKey: accessToken) != nil {
                
                            UserDefaults.standard.removeObject(forKey: accessToken)
                            UserDefaults.standard.synchronize()
                        }
                       if UserDefaults.standard.object(forKey: expiresIn) != nil {
                    
                          UserDefaults.standard.removeObject(forKey: expiresIn)
                          UserDefaults.standard.synchronize()
                          }

                      if UserDefaults.standard.object(forKey: refreshTokenn) != nil {
                    
                         UserDefaults.standard.removeObject(forKey: refreshTokenn)
                         UserDefaults.standard.synchronize()
                        
                          }

                        if UserDefaults.standard.object(forKey: tokenType) != nil {
                
                            UserDefaults.standard.removeObject(forKey: tokenType)
                            UserDefaults.standard.synchronize()
                        }
                        if UserDefaults.standard.object(forKey: walletIDD) != nil {
                
                            UserDefaults.standard.removeObject(forKey: walletIDD)
                            UserDefaults.standard.synchronize()
                        }
                        if UserDefaults.standard.object(forKey: userIDD) != nil {
                
                            UserDefaults.standard.removeObject(forKey: userIDD)
                            UserDefaults.standard.synchronize()
                        }
                
                        if UserDefaults.standard.object(forKey: walletAmountt) != nil {
                
                            UserDefaults.standard.removeObject(forKey: walletAmountt)
                            UserDefaults.standard.synchronize()
                        }
                
                       if UserDefaults.standard.object(forKey: "walletAmount") != nil {
                    
                          UserDefaults.standard.removeObject(forKey: "walletAmount")
                           UserDefaults.standard.synchronize()
                      }
                        if UserDefaults.standard.object(forKey: uNamee) != nil {
                            
                            UserDefaults.standard.removeObject(forKey: uNamee)
                            UserDefaults.standard.synchronize()
                        }
                        if UserDefaults.standard.object(forKey: emailIdd) != nil {
                            
                            UserDefaults.standard.removeObject(forKey: emailIdd)
                            UserDefaults.standard.synchronize()
                        }
                
                      if UserDefaults.standard.object(forKey: kIsFirstTime) != nil {
                    
                    UserDefaults.standard.removeObject(forKey: kIsFirstTime)
                    UserDefaults.standard.synchronize()
                }
            }
            
           
//            profileTVC.setContentOffset(CGPoint.zero, animated: true)
            
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            let viewController = mainStoryboard.instantiateViewController(withIdentifier: "LoginNav") as! UINavigationController
            
            let defaults = UserDefaults.standard
            
            defaults.set("backBtn", forKey: "hideBackBtn")
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = viewController
        }
            
        }
        
    }
    
    //MARK:- action

    func action(_sender: UIButton){
        
        print(111111)
        
    }
    
    //MARK:- Button Actions
    
    @IBAction func backAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func searchAction(_ sender: Any) {
    }
    
    @IBAction func notificationAction(_ sender: Any) {
    }

}
