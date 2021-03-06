

//
//  AddMoneyWalletViewController.swift
//  PayZan
//
//  Created by CalibrageMac02 on 13/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit
import ContactsUI

class AddMoneyWalletViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate,CNContactPickerDelegate {
    
    //MARK:- OutLets

    
    @IBOutlet weak var backbuttonOutLet: UIButton!
    @IBOutlet weak var walletBalLabel: UILabel!
   
    
    @IBOutlet weak var mobileNumField: UITextField!
    
    @IBOutlet weak var sendAmountField: UITextField!
    
    @IBOutlet weak var addWalletFiled: UITextField!
    
    @IBOutlet weak var walletPromoField: UITextField!
    
    @IBOutlet weak var circleField: UITextField!
    

    @IBOutlet weak var addMoneyBtn: UIButton!
    
    @IBOutlet weak var offersView: UIView!
    
    
    @IBOutlet var addmoneyWalletView: UIView!
    
    @IBOutlet var mytransactionView: UIView!
    
    @IBOutlet var sendMoneyWalletView: UIView!
    
    @IBOutlet var mySegmentControl: UISegmentedControl!
    
    @IBOutlet var addBtn1: UIButton!
    
    @IBOutlet var addBtn2: UIButton!
    
    @IBOutlet var addBtn3: UIButton!
    
    @IBOutlet weak var myTransactionTableView: UITableView!
    
    @IBOutlet weak var phoneBookBtn: UIButton!
    
    @IBOutlet weak var allBtn: UIButton!
    
    @IBOutlet weak var paidBtn: UIButton!
    
    @IBOutlet weak var receivedBtn: UIButton!
    
    @IBOutlet weak var addedBtn: UIButton!
    
    @IBOutlet weak var headerImgHeight: NSLayoutConstraint!
    
    let strUrl1 = "29,30,31,32,33,34,35,36,37"
    let serviceController = ServiceController()

    
//    var appDelegate = AppDelegate()
    
    private var hCountInt = 0
    private var fCountInt = 0
    private var tCountInt = 0
    
    //MARK:- Variables

    
    var indexValue:Int!
    
    var hunredTitle:Int = 0
    var fivehundredTitle:Int = 0
    var thousnadTitle:Int = 0
    
    var hunredCounter:Int = 100
    var fivehundredCounter:Int = 500
    var thousnadTCounter:Int = 1000
    
    var myTranResultList:[MyTranListResultVo] = []
    
    var isHiddenSendView:Bool?
    var isHiddenWithdrawView:Bool?
    var isHiddenTransactionView:Bool?
    
    var userId:String? = ""
    var walletId:String? = ""
    
    
    var walletArr = ["PayZan Cash Received","Transferred to bank Account"]
    
    private func imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width:  1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor);
        context!.fill(rect);
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mySegmentControl.setTitle("app.SendMoneytowallet".localize(), forSegmentAt: 0)
        mySegmentControl.setTitle("app.AddMoneytowallet".localize(), forSegmentAt: 1)
        mySegmentControl.setTitle("app.MyTransactions".localize(), forSegmentAt: 2)
        
        self.backbuttonOutLet.isHidden = false
        
        iPhoneScreenSizes()
                
        //MARK:- TextField Colors

        
        myTransactionTableView.dataSource = self
        myTransactionTableView.delegate = self
        
        mobileNumField.layer.borderWidth = 0.5
        mobileNumField.layer.borderColor = UIColor.lightGray.cgColor
        mobileNumField.layer.cornerRadius = 3
        mobileNumField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        
        sendAmountField.layer.borderWidth = 0.5
        sendAmountField.layer.borderColor = UIColor.lightGray.cgColor
        sendAmountField.layer.cornerRadius = 3
        sendAmountField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        
        addWalletFiled.layer.borderWidth = 0.5
        addWalletFiled.layer.borderColor = UIColor.lightGray.cgColor
        addWalletFiled.layer.cornerRadius = 3
        addWalletFiled.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        
        walletPromoField.layer.borderWidth = 0.5
        walletPromoField.layer.borderColor = UIColor.lightGray.cgColor
        walletPromoField.layer.cornerRadius = 3
        walletPromoField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        
        circleField.layer.borderWidth = 0.5
        circleField.layer.borderColor = UIColor.lightGray.cgColor
        circleField.layer.cornerRadius = 3
        circleField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        

        
        if indexValue != nil {
            
        mySegmentControl.selectedSegmentIndex = indexValue
            
        }
        
        addBtn1.layer.borderWidth = 1
        addBtn2.layer.borderWidth = 1
        addBtn3.layer.borderWidth = 1
        
        addBtn1.layer.borderColor = UIColor.init(red: 113/255.0, green: 25/255.0, blue: 34/255.0, alpha: 1.0).cgColor
        addBtn2.layer.borderColor = UIColor.init(red: 113/255.0, green: 25/255.0, blue: 34/255.0, alpha: 1.0).cgColor
        addBtn3.layer.borderColor = UIColor.init(red: 113/255.0, green: 25/255.0, blue: 34/255.0, alpha: 1.0).cgColor
        
        if isHiddenSendView != nil {
            
            sendMoneyWalletView.isHidden = isHiddenSendView!
        }
        if isHiddenWithdrawView != nil {
            
            addmoneyWalletView.isHidden = isHiddenWithdrawView!
        }
        if isHiddenTransactionView != nil {
            
            mytransactionView.isHidden = isHiddenTransactionView!
        }
        

        
        mobileNumField.keyboardType = .phonePad
        addWalletFiled.keyboardType = .numberPad
        sendAmountField.keyboardType = .numberPad
        
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
        
        
        borderColors()
        
        
        //MARK:- headerImgHeight For iphone and ipad

        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
            headerImgHeight.constant = 150
        }
        else {
            
            headerImgHeight.constant = 79
            
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.addWalletFiled.text! = ""
        
        self.hCountInt = 0
        self.fCountInt = 0
        self.tCountInt = 0
        
        mySegmentControl.setTitle("app.SendMoneytowallet".localize(), forSegmentAt: 0)
        mySegmentControl.setTitle("app.AddMoneytowallet".localize(), forSegmentAt: 1)
        mySegmentControl.setTitle("app.MyTransactions".localize(), forSegmentAt: 2)

        let defaults = UserDefaults.standard
        
        if let userid = defaults.string(forKey: userIDD) {
            
            userId = userid
            
            print("defaults savedString: \(userid)")
        }
        else {
            
            userId = ""
        }
        
        if let walletid = defaults.string(forKey: walletIDD) {
            
            walletId = walletid
            
            print("defaults savedString: \(walletid)")
            
        }
        else {
            
            walletId = ""
            
            myTranResultList.removeAll()
            myTransactionTableView.reloadData()
            
        }
        
        if let walletBal = defaults.string(forKey: walletAmountt) {
            
            walletBalLabel.text = walletBal
            
            print("defaults savedString: \(String(describing: walletBalLabel.text))")
        }
        else {
            
            
            walletBalLabel.text = "00.0"
        }
        
        if let walletAmount = defaults.string(forKey: "walletAmount") {
            
            
            walletBalLabel.text = walletAmount
            
            print("defaults savedString: \(walletAmount)")
        }
        
        
    }
    
    //MARK:- borderColors

    
    func borderColors(){
        
        allBtn.layer.borderWidth = 0.5
        
        allBtn.layer.borderColor = UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0).cgColor
        
        allBtn.layer.cornerRadius = 10
        
        
        paidBtn.layer.borderWidth = 0.5
        paidBtn.layer.borderColor = UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0).cgColor
        paidBtn.layer.cornerRadius = 10
        
        
        
        receivedBtn.layer.borderWidth = 0.5
        receivedBtn.layer.borderColor = UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0).cgColor
        receivedBtn.layer.cornerRadius = 10
        
        
        addedBtn.layer.borderWidth = 0.5
        addedBtn.layer.borderColor = UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0).cgColor
        addedBtn.layer.cornerRadius = 10
        
    }
    
    //MARK:- iPhoneScreenSizes

    func iPhoneScreenSizes(){
        let bounds = UIScreen.main.bounds
        let height = bounds.size.height
        
        switch height {
        case 480.0:
            print("iPhone 3,4")
            
            mySegmentControl.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            mySegmentControl.setTitleTextAttributes([NSFontAttributeName:UIFont(name:"Helvetica Neue", size:9.0)!,NSForegroundColorAttributeName:#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)], for:UIControlState.normal)
            
            mySegmentControl.setTitleTextAttributes([NSFontAttributeName:UIFont(name:"Helvetica Neue", size:9.0)!,NSForegroundColorAttributeName:#colorLiteral(red: 0.4438641369, green: 0.09910114855, blue: 0.1335680187, alpha: 1)], for:UIControlState.selected)
            
            mySegmentControl.setDividerImage(self.imageWithColor(color: UIColor.clear), forLeftSegmentState: UIControlState.normal, rightSegmentState: UIControlState.normal, barMetrics: UIBarMetrics.default)
            
            mySegmentControl.setBackgroundImage(self.imageWithColor(color: UIColor.clear), for:UIControlState.normal, barMetrics:UIBarMetrics.default)
            
            
            for  borderview in mySegmentControl.subviews {
                
                
                let upperBorder: CALayer = CALayer()
                upperBorder.backgroundColor = UIColor.init(red: 113/255.0, green: 25/255.0, blue: 34/255.0, alpha: 1.0).cgColor
                upperBorder.frame = CGRect(x:0, y:borderview.frame.size.height-1, width:view.frame.size.width, height:1.0)
                borderview.layer.addSublayer(upperBorder);
                
            }
        case 568.0:
            print("iPhone 5")
            
            mySegmentControl.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            mySegmentControl.setTitleTextAttributes([NSFontAttributeName:UIFont(name:"Helvetica Neue", size:9.0)!,NSForegroundColorAttributeName:#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)], for:UIControlState.normal)
            
            mySegmentControl.setTitleTextAttributes([NSFontAttributeName:UIFont(name:"Helvetica Neue", size:9.0)!,NSForegroundColorAttributeName:#colorLiteral(red: 0.4438641369, green: 0.09910114855, blue: 0.1335680187, alpha: 1)], for:UIControlState.selected)
            
            mySegmentControl.setDividerImage(self.imageWithColor(color: UIColor.clear), forLeftSegmentState: UIControlState.normal, rightSegmentState: UIControlState.normal, barMetrics: UIBarMetrics.default)
            
            mySegmentControl.setBackgroundImage(self.imageWithColor(color: UIColor.clear), for:UIControlState.normal, barMetrics:UIBarMetrics.default)
            
            
            for  borderview in mySegmentControl.subviews {
                
                
                
                
                
                let upperBorder: CALayer = CALayer()
                upperBorder.backgroundColor = UIColor.init(red: 113/255.0, green: 25/255.0, blue: 34/255.0, alpha: 1.0).cgColor
                upperBorder.frame = CGRect(x:0, y:borderview.frame.size.height-1, width:view.frame.size.width, height:1.0)
                borderview.layer.addSublayer(upperBorder);
                
            }
            
            
        case 667.0:
            print("iPhone 6")
            
            mySegmentControl.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            mySegmentControl.setTitleTextAttributes([NSFontAttributeName:UIFont(name:"Helvetica Neue", size:11.0)!,NSForegroundColorAttributeName:#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)], for:UIControlState.normal)
            
            mySegmentControl.setTitleTextAttributes([NSFontAttributeName:UIFont(name:"Helvetica Neue", size:11.0)!,NSForegroundColorAttributeName:#colorLiteral(red: 0.4438641369, green: 0.09910114855, blue: 0.1335680187, alpha: 1)], for:UIControlState.selected)
            
            mySegmentControl.setDividerImage(self.imageWithColor(color: UIColor.clear), forLeftSegmentState: UIControlState.normal, rightSegmentState: UIControlState.normal, barMetrics: UIBarMetrics.default)
            
            mySegmentControl.setBackgroundImage(self.imageWithColor(color: UIColor.clear), for:UIControlState.normal, barMetrics:UIBarMetrics.default)
            
            
            for  borderview in mySegmentControl.subviews {
                
                
                let upperBorder: CALayer = CALayer()
                upperBorder.backgroundColor = UIColor.init(red: 113/255.0, green: 25/255.0, blue: 34/255.0, alpha: 1.0).cgColor
                upperBorder.frame = CGRect(x:0, y:borderview.frame.size.height-1, width:view.frame.size.width, height:1.0)
                borderview.layer.addSublayer(upperBorder);
                
            }
            
        case 736.0:
            print("iPhone 6+")
            
            mySegmentControl.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            mySegmentControl.setTitleTextAttributes([NSFontAttributeName:UIFont(name:"Helvetica Neue", size:11.0)!,NSForegroundColorAttributeName:#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)], for:UIControlState.normal)
            
            mySegmentControl.setTitleTextAttributes([NSFontAttributeName:UIFont(name:"Helvetica Neue", size:11.0)!,NSForegroundColorAttributeName:#colorLiteral(red: 0.4438641369, green: 0.09910114855, blue: 0.1335680187, alpha: 1)], for:UIControlState.selected)
            
            mySegmentControl.setDividerImage(self.imageWithColor(color: UIColor.clear), forLeftSegmentState: UIControlState.normal, rightSegmentState: UIControlState.normal, barMetrics: UIBarMetrics.default)
            
            mySegmentControl.setBackgroundImage(self.imageWithColor(color: UIColor.clear), for:UIControlState.normal, barMetrics:UIBarMetrics.default)
            
            
            for  borderview in mySegmentControl.subviews {
                
                
                let upperBorder: CALayer = CALayer()
                upperBorder.backgroundColor = UIColor.init(red: 113/255.0, green: 25/255.0, blue: 34/255.0, alpha: 1.0).cgColor
                upperBorder.frame = CGRect(x:0, y:borderview.frame.size.height-1, width:view.frame.size.width, height:1.0)
                borderview.layer.addSublayer(upperBorder);
                
            }
            
        case 1024.0:
            print("iPadAir")
            
            mySegmentControl.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            mySegmentControl.setTitleTextAttributes([NSFontAttributeName:UIFont(name:"Helvetica Neue", size:17.0)!,NSForegroundColorAttributeName:#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)], for:UIControlState.normal)
            
            mySegmentControl.setTitleTextAttributes([NSFontAttributeName:UIFont(name:"Helvetica Neue", size:17.0)!,NSForegroundColorAttributeName:#colorLiteral(red: 0.4438641369, green: 0.09910114855, blue: 0.1335680187, alpha: 1)], for:UIControlState.selected)
            
            mySegmentControl.setDividerImage(self.imageWithColor(color: UIColor.clear), forLeftSegmentState: UIControlState.normal, rightSegmentState: UIControlState.normal, barMetrics: UIBarMetrics.default)
            
            mySegmentControl.setBackgroundImage(self.imageWithColor(color: UIColor.clear), for:UIControlState.normal, barMetrics:UIBarMetrics.default)
            
            
            for  borderview in mySegmentControl.subviews {
                
                
                let upperBorder: CALayer = CALayer()
                upperBorder.backgroundColor = UIColor.init(red: 113/255.0, green: 25/255.0, blue: 34/255.0, alpha: 1.0).cgColor
                upperBorder.frame = CGRect(x:0, y:borderview.frame.size.height-1, width:view.frame.size.width, height:1.0)
                borderview.layer.addSublayer(upperBorder);
                

                
            }
            
            
        default:
            print("not an iPhone")
            
       
        
        }
        
        
    }
    
    //MARK:- UITableView DataSource Methods

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return myTranResultList.count
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
            return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = Bundle.main.loadNibNamed("MyTransactionTableViewCell", owner: self, options: nil)?.first as! MyTransactionTableViewCell
        
        //        cell.ImgeVw.image = #imageLiteral(resourceName: "Thumb Sign")
        
        let listResult:MyTranListResultVo = myTranResultList[indexPath.row]
        
        cell.titleLabel?.text = listResult.TransactionType
        
        let amount = String(describing: listResult.Amount!)
        
        cell.addMoneyLabel.text = amount
        
        let dateStr = listResult.Created
        
        print("dateStr:\(String(describing: dateStr))")
        
        let currentStr:String = String(dateStr!.characters.prefix(10))
        
        print("currentStr:\(String(describing: currentStr))")
        
        
        
        
        let formatter = DateFormatter()
        formatter.dateFormat = currentStr
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        
        let myString = formatter.string(from: Date())
        let yourDate = formatter.date(from: myString)
        formatter.dateFormat = "MMM dd,yyyy"
        let myStringafd = formatter.string(from: yourDate!)
        
        print(myStringafd)
        
        cell.dateLabel.text = myStringafd
        cell.fromLabel.text = listResult.Modified
        
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
    }
    
    func myTransactionGetService(string:String!){
        
        if(appDelegate.checkInternetConnectivity()){
            
            if !(walletId?.isEmpty)! {
            
            let strUrl = myTransactionsUrl + "/" + walletId!
            
            let stringUrl = strUrl + "/" + string
            
            print("strUrl: \(stringUrl)")
            
            
            serviceController.requestGETURL(strURL:stringUrl, success:{(result) in
                DispatchQueue.main.async()
                    {
                        
                        let respVO:MyTransactionsVo = Mapper().map(JSONObject: result)!
                        
                        
                        let isActive = respVO.IsSuccess
                        
                        
                        if(isActive == true){
                            
                            let listResultVo = respVO.ListResult
                            
                            self.myTranResultList = listResultVo!
                            
                            
                            DispatchQueue.main.async(execute: { () -> Void in
                                
                                self.myTransactionTableView.reloadData()
                            })
                            
                            
                        }else if(isActive == false) {
                            
                            self.view.makeToast("Service not found", duration:kToastDuration, position:CSToastPositionCenter)
                            
                        }

                }
            }, failure:  {(error) in
                
                if(error == "unAuthorized"){
                    self.serviceController.refreshTokenForLogin(successHandler:{(result) in
                        DispatchQueue.main.async()
                            {
                                
                                self.myTransactionGetService(string: self.strUrl1)
                                
                        }
                    }, failureHandler:  {(error) in
                        
                        DispatchQueue.main.async()
                            {
                                
                    let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                                
                    let viewController = mainStoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
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
    
    //MARK:- postWalletMoneyService

    
   func postWalletMoneyService(){
    
    
    if !(walletId?.isEmpty)! && !(userId?.isEmpty)! {
        
        let walletField:String = addWalletFiled.text!
        
        let  strUrl = walletUrl
    
    let currentDate = GlobalSupportingClass.getCurrentDate()
    
    print("currentDate\(currentDate)")
    
        let dictParams = ["WalletId":walletId!,"Amount":walletField,"TransactionTypeId":1,"ReasonTypeId":1,"Id":0,"IsActive":true,"CreatedByUserId":userId!,"CreatedDate":currentDate,"UpdatedByUserId":userId!,"UpdatedDate":currentDate] as NSDictionary
        
        print("dic params \(dictParams)")
        
        let dictHeaders = ["":"","":""] as NSDictionary
    
    
      print("dictHeader:\(dictHeaders)")
    
        serviceController.requestPOSTURL(strURL: strUrl as NSString, postParams: dictParams, postHeaders: dictHeaders, successHandler:{(result) in
            DispatchQueue.main.async()
                {
                    
                    print("result:\(result)")
                    
                    let respVO:ResultVo = Mapper().map(JSONObject: result)!
                    
                    
                    print("responseString = \(respVO)")
                    
                    
                    let statusCode = respVO.IsSuccess
                    
                    print("StatusCode:\(String(describing: statusCode))")
                    
                    
                    if statusCode == true
                    {
                        
                        let successMsg = respVO.EndUserMessage
                        
                        let waleetBalance = respVO.Result?.Balance
                        
                        let defaults = UserDefaults.standard
                        
                        defaults.set(waleetBalance, forKey: "walletAmount")
                        
                        
                        if let walletAmount = defaults.string(forKey: "walletAmount") {
                            
                            
                            self.walletBalLabel.text = walletAmount
                            
                        
                            
                            print("defaults savedString: \(walletAmount)")
                        }
                        
                        self.addWalletFiled.text! = ""
                        
                        self.hCountInt = 0
                        self.fCountInt = 0
                        self.tCountInt = 0
                        
                        
                        
                        self.appDelegate.window?.makeToast(successMsg!, duration:kToastDuration, position:CSToastPositionCenter)

                        
                    }
                    else if statusCode == false{
                        
                        let failMsg = respVO.EndUserMessage
                        
                        self.showAlertViewWithTitle("Failed", message: failMsg!, buttonTitle: "Ok")
                        
                        
                    }
                        
                    else
                    {
                        
                        let failMsg = respVO.EndUserMessage
                        
                        self.showAlertViewWithTitle("Failed", message: failMsg!, buttonTitle: "Ok")
                        
                    }
            }
        }, failureHandler: {(error) in
            
            if(error == "unAuthorized"){
                self.serviceController.refreshTokenForLogin(successHandler:{(result) in
                    DispatchQueue.main.async()
                        {
                            
                            self.postWalletMoneyService()
                            
                    }
                }, failureHandler:  {(error) in
                    
                    DispatchQueue.main.async()
                        {
                            
                    let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                            
                    let viewController = mainStoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    appDelegate.window?.rootViewController = viewController
                            
                    }
                    
                    
                })
            }
            
        })
    }
    
    
    }

    //MARK:- Button Action

    
    @IBAction func addMoneyAction(_ sender: Any) {
        
        if(appDelegate.checkInternetConnectivity()){
            
            if !(addWalletFiled.text?.isEmpty)! {
                
                if !(walletId?.isEmpty)! && !(userId?.isEmpty)! {
                
                postWalletMoneyService()
                    
                }
                else {
                    
                    let alertController = UIAlertController(title: "app.Alert".localize(), message: "app.LoginAlert".localize(), preferredStyle: UIAlertControllerStyle.alert)
                    
                    
                    let cancelAction = UIAlertAction(title: "app.Cancel".localize(), style: UIAlertActionStyle.cancel) { (result : UIAlertAction) -> Void in
                        print("Cancel")
                        
                        
                    }
                    let okAction = UIAlertAction(title: "app.Ok".localize(), style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
                        print("OK")
                        
                        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                        
                        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "LoginNav") as! UINavigationController
                        let appDelegate = UIApplication.shared.delegate as! AppDelegate
                        appDelegate.window?.rootViewController = viewController
                    }
                    alertController.addAction(cancelAction)
                    alertController.addAction(okAction)
                    self.present(alertController, animated: true, completion: nil)
                    
                }
                
            }
            else {
                
                self.showAlertViewWithTitle("app.Alert".localize(), message: "app.Pleaseenterwalletamount".localize(), buttonTitle: "app.Ok".localize())
            
            }
            
        }
        else {
            
        appDelegate.window?.makeToast(kNetworkStatusMessage, duration:kToastDuration, position:CSToastPositionCenter)
            return
            
        }
        
        
    }
    //MARK:- sendMoneyToWalletService

    
    func sendMoneyToWalletService(){
        
        
        if !(walletId?.isEmpty)! && !(userId?.isEmpty)! {
        
        let walletField:String = sendAmountField.text!
        
        let phone:String = mobileNumField.text!
        
        let  strUrl = sendWalletUrl
        
        
        let currentDate = GlobalSupportingClass.getCurrentDate()
        
        print("currentDate\(currentDate)")
        
        let dictParams = ["userWalletHistory": [
            "WalletId": walletId!,
            "Amount": walletField,
            "TransactionTypeId": "9",
            "ReasonTypeId": "10",
            "Id": 0,
            "IsActive": true,
            "CreatedBy": userId!,
            "ModifiedBy": userId!,
            "Created": currentDate,
            "Modified": currentDate
            ],"recieverUserName": phone] as NSDictionary
        
        print("dic params \(dictParams)")
        
        let dictHeaders = ["":"","":""] as NSDictionary
        
        
        print("dictHeader:\(dictHeaders)")
        
        serviceController.requestPOSTURL(strURL: strUrl as NSString, postParams: dictParams, postHeaders: dictHeaders, successHandler:{(result) in
            DispatchQueue.main.async()
                {
                    
                    print("result:\(result)")
                    
                    let respVO:SendWalletVo = Mapper().map(JSONObject: result)!
                    
                    
                    print("responseString = \(respVO)")
                    
                    
                    let statusCode = respVO.IsSuccess
                    
                    print("StatusCode:\(String(describing: statusCode))")
                    
                    
                    if statusCode == true
                    {
                        
                        let successMsg = respVO.EndUserMessage
                        
                        let waleetBalance = respVO.Result?.Balance
                        
                        let defaults = UserDefaults.standard
                        
                        
                        defaults.set(waleetBalance, forKey: "walletAmount")
                        
                        
                        if let walletAmount = defaults.string(forKey: "walletAmount") {
                            
                            
                            self.walletBalLabel.text = walletAmount
                            
                            print("defaults savedString: \(walletAmount)")
                        }
                        
                        
                        self.sendAmountField.text! = ""
                        self.mobileNumField.text! = ""
                        
                        
                        self.appDelegate.window?.makeToast(successMsg!, duration:kToastDuration, position:CSToastPositionCenter)

                        
                        
                    }
                    else if statusCode == false{
                        
                        let failMsg = respVO.EndUserMessage
                        
                        self.showAlertViewWithTitle("Failed", message: failMsg!, buttonTitle: "Ok")

                        
                        
                    }
                        
                    else
                    {
                        
                        let failMsg = respVO.EndUserMessage
                        
                        self.showAlertViewWithTitle("Failed", message: failMsg!, buttonTitle: "Ok")
                        
                    }
            }
        }, failureHandler: {(error) in
            
            
            if(error == "unAuthorized"){
                self.serviceController.refreshTokenForLogin(successHandler:{(result) in
                    DispatchQueue.main.async()
                        {
                            
                            self.sendMoneyToWalletService()
                            
                    }
                }, failureHandler:  {(error) in
                    
                    DispatchQueue.main.async()
                        {
                            
                let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                            
                let viewController = mainStoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.window?.rootViewController = viewController
                            
                    }
                    
                    
                })
            }
        })
        }
        
        
    }
    
    //MARK:- Button Action

    
    @IBAction func sendMoneyAction(_ sender: Any) {
        
        if validateSendMoneyFields(){
        
        if(appDelegate.checkInternetConnectivity()){
            
            if !(walletId?.isEmpty)! && !(userId?.isEmpty)! {
                
                sendMoneyToWalletService()
                
            }
            else {
                
                let alertController = UIAlertController(title: "app.Alert".localize(), message: "app.LoginAlert".localize(), preferredStyle: UIAlertControllerStyle.alert)
                
                
                let cancelAction = UIAlertAction(title: "app.Cancel".localize(), style: UIAlertActionStyle.cancel) { (result : UIAlertAction) -> Void in
                    print("Cancel")
                    
                    
                }
                let okAction = UIAlertAction(title: "app.Ok".localize(), style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
                    print("OK")
                    
                    let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    
                    let viewController = mainStoryboard.instantiateViewController(withIdentifier: "LoginNav") as! UINavigationController
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    appDelegate.window?.rootViewController = viewController
                }
                alertController.addAction(cancelAction)
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
                
            }
            
            
        }
        else {
            
            self.appDelegate.window?.makeToast(kNetworkStatusMessage, duration:kToastDuration, position:CSToastPositionCenter)
            return
            
        }
            
        }
    }
    
    //MARK:- validateSendMoneyFields

    
    func validateSendMoneyFields() -> Bool
    {
        mobileNumField.text=mobileNumField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
        sendAmountField.text=sendAmountField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
        
        let mnumb:NSString = mobileNumField.text! as NSString
        let sendAmount:NSString = sendAmountField.text! as NSString
        
        
        //Check whether textField are left empty or not
        var errorMessage:NSString?
        
        if (mnumb.length<=0) {
            errorMessage=GlobalSupportingClass.blankPhoneNumberErrorMessage() as String as String as NSString?
        }
        else if (mnumb.length<=9) {
            errorMessage=GlobalSupportingClass.invalidPhoneNumberErrorMessage() as String as String as NSString?
        }
            
        else if (sendAmount.length<=0) {
            errorMessage=GlobalSupportingClass.blankSendAmountErrorMessage() as String as String as NSString?
        }
        
        if let errorMsg = errorMessage{
            
            self.showAlertViewWithTitle("app.Alert".localize(), message: errorMsg as String, buttonTitle: "app.Retry".localize())
            return false;
        }
        return true
    }
    
    //MARK:- Button Actions
    
    
    @IBAction func backAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
   
    @IBAction func searchAction(_ sender: Any) {
    }

    @IBAction func notificationAction(_ sender: Any) {
    }
    
    @IBAction func hundredBtnAction(_ sender: Any) {
        
        self.addWalletFiled.text = ""
        
        hCountInt += 100
        addWalletFiled.text = "\(((Int(hCountInt) + fCountInt) + (Int(tCountInt))))"
        

    }
    
    @IBAction func fiveHunredBtnAction(_ sender: Any) {
        
        self.addWalletFiled.text = ""
        
        fCountInt += 500
        addWalletFiled.text = "\(((Int(hCountInt) + fCountInt) + (Int(tCountInt))))"
        

    }
    
    @IBAction func thousandBtnAction(_ sender: Any) {
        
        self.addWalletFiled.text = ""
        
        tCountInt += 1000
        addWalletFiled.text = "\(((Int(hCountInt) + fCountInt) + (Int(tCountInt))))"
        

    }
    
    @IBAction func phoneBookAction(_ sender: Any) {
        
        if #available(iOS 9.0, *) {
            let cnPicker = CNContactPickerViewController()
            cnPicker.delegate = self
            self.present(cnPicker, animated: true, completion: nil)
        } else {
            // Fallback on earlier versions
        }
        
        
    }
    
    //MARK:- CNContactPickerDelegate Method
    
    @available(iOS 9.0, *)
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contacts: [CNContact]) {
        contacts.forEach { contact in
            for number in contact.phoneNumbers {
                let phoneNumber = number.value
                print("number is = \(phoneNumber)")
                
                mobileNumField.text = phoneNumber.stringValue
                
                
            }
            
            let cnContacts = [CNContact]()
            
            for contact in cnContacts {
                let fullName = CNContactFormatter.string(from: contact, style: .fullName) ?? "No Name"
                print("\(fullName): \(contact.phoneNumbers.description)")
            }
        }
    }
        
    
    @IBAction func mySegmentAction(_ sender: Any) {
        
        
        switch mySegmentControl.selectedSegmentIndex {
        case 0:
            sendMoneyWalletView.isHidden = false
            addmoneyWalletView.isHidden = true
            mytransactionView.isHidden = true
            
            self.addWalletFiled.text! = ""
            
            self.hCountInt = 0
            self.fCountInt = 0
            self.tCountInt = 0
            
        case 1:
            sendMoneyWalletView.isHidden = true
            addmoneyWalletView.isHidden = false
            mytransactionView.isHidden = true
            
            self.sendAmountField.text! = ""
            self.mobileNumField.text! = ""
            
        case 2:
            sendMoneyWalletView.isHidden = true
            addmoneyWalletView.isHidden = true
            mytransactionView.isHidden = false
            
            self.sendAmountField.text! = ""
            self.mobileNumField.text! = ""
            
            self.addWalletFiled.text! = ""
            
            self.hCountInt = 0
            self.fCountInt = 0
            self.tCountInt = 0
            
            self.myTransactionGetService(string: self.strUrl1)
            
        default:
            break;
        }
    }
    
    @IBAction func allBtnAction(_ sender: Any) {
        
        myTransactionGetService(string: strUrl1)
        
        allBtn.backgroundColor = UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)
        
        paidBtn.backgroundColor = UIColor.white
        receivedBtn.backgroundColor = UIColor.white
        addedBtn.backgroundColor = UIColor.white
        
        
        allBtn.setTitleColor(UIColor.white, for: .normal)
        
        paidBtn.setTitleColor(UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0), for: .normal)
        receivedBtn.setTitleColor(UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0), for: .normal)
        addedBtn.setTitleColor(UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0), for: .normal)
        

        
    }
    
    @IBAction func paidBtnAction(_ sender: Any) {
        
        let paidId = "33"
        
        myTransactionGetService(string: paidId)
        
        paidBtn.backgroundColor = UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)
        
        allBtn.backgroundColor = UIColor.white
        receivedBtn.backgroundColor = UIColor.white
        addedBtn.backgroundColor = UIColor.white
        
        paidBtn.setTitleColor(UIColor.white, for: .normal)
        
        allBtn.setTitleColor(UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0), for: .normal)
        receivedBtn.setTitleColor(UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0), for: .normal)
        addedBtn.setTitleColor(UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0), for: .normal)
    }
    
    @IBAction func receivedAction(_ sender: Any) {
        
        let receivedId = "37"
        
        myTransactionGetService(string: receivedId)
        
        receivedBtn.backgroundColor = UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)
        
        paidBtn.backgroundColor = UIColor.white
        addedBtn.backgroundColor = UIColor.white
        allBtn.backgroundColor = UIColor.white
        
        receivedBtn.setTitleColor(UIColor.white, for: .normal)
        
        paidBtn.setTitleColor(UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0), for: .normal)
        allBtn.setTitleColor(UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0), for: .normal)
        addedBtn.setTitleColor(UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0), for: .normal)
    }
    
    @IBAction func addedBtnAction(_ sender: Any) {
        
        let addedId = "32"
        
        myTransactionGetService(string: addedId)
        
        addedBtn.backgroundColor = UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)
        
        paidBtn.backgroundColor = UIColor.white
        receivedBtn.backgroundColor = UIColor.white
        allBtn.backgroundColor = UIColor.white
        
        addedBtn.setTitleColor(UIColor.white, for: .normal)
        
        paidBtn.setTitleColor(UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0), for: .normal)
        receivedBtn.setTitleColor(UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0), for: .normal)
        allBtn.setTitleColor(UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0), for: .normal)
    }
    
    
}

    //MARK:- customizeAppearance

extension UISegmentedControl {
    
    func customizeAppearance(for height: Int) {
        
        setTitleTextAttributes([NSFontAttributeName:UIFont(name:"Helvetica Neue", size:13.0)!,NSForegroundColorAttributeName:UIColor.white], for:.normal)
        setTitleTextAttributes([NSFontAttributeName:UIFont(name:"Helvetica Neue", size:13.0)!,NSForegroundColorAttributeName:UIColor.white], for:.selected)
        setDividerImage(UIImage().colored(with: .clear, size: CGSize(width: 1, height: height)), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        setBackgroundImage(UIImage().colored(with: .clear, size: CGSize(width: 1, height: height)), for: .normal, barMetrics: .default)
        setBackgroundImage(UIImage().colored(with: UIColor.init(red: 215/255.0, green: 0.0, blue: 30/255.0, alpha: 1.0), size: CGSize(width: 1, height: height)), for: .selected, barMetrics: .default);
        
        for  borderview in subviews {
            let upperBorder: CALayer = CALayer()
            upperBorder.backgroundColor = UIColor.init(red: 215/255.0, green: 0.0, blue: 30/255.0, alpha: 1.0).cgColor
            upperBorder.frame = CGRect(x: 0, y: borderview.frame.size.height-1, width: borderview.frame.size.width, height: 1)
            borderview.layer.addSublayer(upperBorder)
        }
        
    }
    
    //MARK:- removeBorders

    
    func removeBorders() {
        setBackgroundImage(imageWithColor(color: backgroundColor!), for: .normal, barMetrics: .default)
        setBackgroundImage(imageWithColor(color: tintColor!), for: .selected, barMetrics: .default)
        setDividerImage(imageWithColor(color: UIColor.clear), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
    }
    
    //MARK:- imageWithColor

    
    private func imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width:  1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor);
        context!.fill(rect);
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image!
    }
}

//MARK:- extension  UIImage

extension UIImage {
    
    func colored(with color: UIColor, size: CGSize) -> UIImage {
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor);
        let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: size)
        context!.fill(rect);
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image!
    }
}
