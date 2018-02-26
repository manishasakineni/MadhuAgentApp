//
//  MyTransactionViewController.swift
//  PayZan
//
//  Created by Mac OS on 30/12/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit

class MyTransactionViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var myTransactionTableView: UITableView!
    
    @IBOutlet weak var noRecordsLabel: UILabel!
    
    var sendDelegate: sendTilteDelegate?
    
    var copyDelegate: CopyDataDelegate?
    
    
    var delegate: walletSubtitleOfIndexDelegate?
    
    var myTranResultList:[MyTranListResultVo] = []
    
    var userId:String? = ""
    var walletId:String? = ""
    
    let strUrl1 = "29,30,31,32,33,34,35,36,37,62"
    
//    let strUrl1 = "42"
    
    let serviceController = ServiceController()
    
    var array = [String]()
    
    
    var buttonArray = Array<UIButton>()
    
    var scView:UIScrollView!
    var buttonPadding:CGFloat = 10
    var xOffset:CGFloat = 10
    
    var selectedButtonString = ""
    
    let defaults = UserDefaults.standard
    
    var walletAmountId:String? = ""
    var refreshControl: UIRefreshControl!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        noRecordsLabel.isHidden = true
        

        self.array = ["app.All".localize(),"app.Paid".localize(),"app.Received".localize(),"app.Added".localize()]
        
        selectedButtonString = "All"
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
            scView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.frame.width * 2 , height: 60))
        }
        else {
            
            scView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 50))
        }
        
        view.addSubview(scView)
        
     
        
        scView.backgroundColor = UIColor.white
        scView.translatesAutoresizingMaskIntoConstraints = false
        
        myTransactionTableView.delegate = self
        myTransactionTableView.dataSource = self
        
        // Pull to refresh
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "")
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        myTransactionTableView.addSubview(refreshControl)
        
        let defaults = UserDefaults.standard
        
        if let walletid = defaults.string(forKey: walletAmId) {
            
            walletAmountId = walletid
            
            print("defaults savedString: \(walletid)")
            
        }
        
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
        
        
        myTransactionGetService(string: strUrl1)
        
        registerTableViewCells()
        

        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        self.array = ["app.All".localize(),"app.Paid".localize(),"app.Received".localize(),"app.Added".localize()]

        TransactionList()
        
        if let refreshToken : String = UserDefaults.standard.value(forKey: refreshTokenn) as? String {
            
             myTransactionGetService(string: strUrl1)
        }
        else {
            
            myTranResultList.removeAll()
            
            myTransactionTableView.reloadData()
        }
        
       
        
    }
    
    func refresh(_ sender: Any) {
        //  your code to refresh tableView
        
        print("refreshhh")
        
        GetWalletAmountService()
        
    }
    
    func GetWalletAmountService(){
        
        if(appDelegate.checkInternetConnectivity()){
            
            if !(walletAmountId?.isEmpty)! {
                
                let strUrl = getWalletAmountUrl + "" + walletAmountId!
                
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
                                    
                                    if let walletAmount = defaults.string(forKey: "walletAmount") {
                                        
                                        if let delegate = self.copyDelegate {
                                            
                                            delegate.stringToBeCopied(stringValue: walletAmount)
                                            
                                        }
                                        
                                    }
                                    
                                }
                                
                                
                                DispatchQueue.main.async(execute: { () -> Void in
                                    
                                    self.myTransactionTableView.reloadData()
                                })
                                
                                
                            }else if(isActive == false) {
                                
                                self.refreshControl.endRefreshing()
                                
                                self.view.makeToast("Service not found", duration:kToastDuration, position:CSToastPositionCenter)
                                
                            }
                            
                    }
                }, failure:  {(error) in
                    
                    self.refreshControl.endRefreshing()
                    
                    if(error == "unAuthorized"){
                        
                        self.serviceController.refreshTokenForLogin(successHandler:{(result) in
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
    
    func TransactionList(){
        
//        buttonArray.removeAll()
        
        buttonPadding = 10
        xOffset = 10
        
        for (event, _) in array.enumerated() {
            
            
            let button = UIButton()
            
            
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
                
                
                button.tag = Int(event)
                button.setTitle(array[event], for: .normal)
                button.addTarget(self, action: #selector(btnTouch), for: UIControlEvents.touchUpInside)
                button.frame = CGRect(x: xOffset, y: CGFloat(buttonPadding), width: 150, height: 40)
                button.backgroundColor = UIColor.white
                button.setTitleColor(UIColor(red: 128.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                    , for: .normal)
                
                if button.tag == 0 {
                    
                    button.backgroundColor = UIColor(red: 128.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                    button.setTitleColor(UIColor.white, for: .normal)
                }
                
                
                button.layer.borderWidth = 1
                button.layer.cornerRadius = 6
                button.layer.borderColor = UIColor(red: 128.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
                button.titleLabel!.font = UIFont(name: "Helvetica Neue" , size: 17)
                
                
                xOffset = xOffset + CGFloat(buttonPadding) + button.frame.size.width * 1.25
                
                
            }
            else {
                
                button.tag = Int(event)
                button.setTitle(array[event], for: .normal)
                button.addTarget(self, action: #selector(btnTouch), for: UIControlEvents.touchUpInside)
                button.frame = CGRect(x: xOffset, y: CGFloat(buttonPadding), width: 70, height: 30)
                button.backgroundColor = UIColor.white
                button.setTitleColor(UIColor(red: 128.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                    , for: .normal)
                
                if button.tag == 0 {
                    
                    button.backgroundColor = UIColor(red: 128.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                    button.setTitleColor(UIColor.white, for: .normal)
                }
                
               
                
                button.layer.borderWidth = 1
                button.layer.cornerRadius = 6
                button.layer.borderColor = UIColor(red: 128.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
                button.titleLabel!.font = UIFont(name: "Helvetica Neue" , size: 12)
                
                xOffset = xOffset + CGFloat(buttonPadding) + button.frame.size.width
                
            }
            
            
            
            scView.addSubview(button)
            buttonArray.append(button)
            
        }
        
        myTransactionTableView.reloadData()
        
     
    }
    
    override func viewDidLayoutSubviews()
    {
        
        scView.contentSize = CGSize(width: xOffset, height: scView.frame.height)
        
    }
    
    private func registerTableViewCells() {
      
        
        let nibName1  = UINib(nibName: "MyTransactionTableViewCell" , bundle: nil)
        myTransactionTableView.register(nibName1, forCellReuseIdentifier: "MyTransactionTableViewCell")
      
        
    }
    public func numberOfSections(in tableView: UITableView) -> Int {
        
        
        return 1
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        
        return myTranResultList.count
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat{
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        return UITableViewAutomaticDimension
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        
        let cell = Bundle.main.loadNibNamed("MyTransactionTableViewCell", owner: self, options: nil)?.first as! MyTransactionTableViewCell
        
        //        cell.ImgeVw.image = #imageLiteral(resourceName: "Thumb Sign")
        
        if !myTranResultList.isEmpty {
            
   
            
        let listResult:MyTranListResultVo = myTranResultList[indexPath.row]
        
        cell.titleLabel?.text = listResult.ReasonType
        
        let amount = String(describing: listResult.Amount!)
        
        cell.addMoneyLabel.text = amount
            
            
        let refId = String(describing: listResult.TransactionId!)
            
        cell.fromLabel.text = refId
        
       
        let dateStr = listResult.Created!
            
        let dob = self.formattedDateFromString(dateString: dateStr, withFormat: "MM/dd/yyyy")!
            
        cell.dateLabel.text = dob
            
        
      
        
         
            
        
            
        }
        else{
            
            cell.titleLabel?.text = "No records found"
        }
        
        return cell
        
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Date Formarter
    
    func formattedDateFromString(dateString: String, withFormat format: String) -> String? {
        
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        
        if let date = inputFormatter.date(from: dateString) {
            
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = format
            
            return outputFormatter.string(from: date)
        }
        
        return nil
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
                                
                                if((respVO.ListResult?.count)! > 0){
                                     self.noRecordsLabel.isHidden = true
                                }else{
                                     self.noRecordsLabel.isHidden = false
                                }
                                
                                
                                DispatchQueue.main.async(execute: { () -> Void in
                                    
                                    self.myTransactionTableView.reloadData()
                                })
                                
                                
                            }else if(isActive == false) {
                                
                                self.noRecordsLabel.isHidden = false
                                self.view.makeToast("Service not found", duration:kToastDuration, position:CSToastPositionCenter)
                                
                            }
                            
                    }
                }, failure:  {(error) in
                    
                     self.noRecordsLabel.isHidden = false
                    
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
    
    func btnTouch(sender:UIButton){
        
        
        for i in 0..<buttonArray.count{
            let button = buttonArray[i]
            if button.tag == sender.tag {
                
                if sender.tag == 0 {
                    myTransactionGetService(string: strUrl1)
                    button.backgroundColor = UIColor(red: 128.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                    button.setTitleColor(UIColor.white, for: .normal)
                    
                }else if (sender.tag == 1){
                    let paidId = "31"
            myTransactionGetService(string: paidId)
                    
                    button.backgroundColor = UIColor(red: 128.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                    button.setTitleColor(UIColor.white, for: .normal)
                    
                }else if (sender.tag == 2){
                    
                                let receivedId = "62"
                    
                                myTransactionGetService(string: receivedId)
                    
                    button.backgroundColor = UIColor(red: 128.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                    button.setTitleColor(UIColor.white, for: .normal)
                    
                }else if (sender.tag == 3){
                    
                                let addedId = "29"
                                myTransactionGetService(string: addedId)
                                
                    
                    button.backgroundColor = UIColor(red: 128.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                    button.setTitleColor(UIColor.white, for: .normal)
                }
              
            }else{
                
                button.backgroundColor = UIColor.white
                button.setTitleColor(UIColor(red: 128.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                    , for: .normal)
            }
        }
        
        myTransactionTableView.reloadData()
        
        let indexPath : IndexPath = IndexPath(row: 0, section: 0)
        
        self.myTransactionTableView.scrollToRow(at: indexPath, at: UITableViewScrollPosition.top, animated: false)
        
        
        
    }


    
}
