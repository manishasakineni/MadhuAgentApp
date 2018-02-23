//
//  TransactionsViewController.swift
//  PayZan
//
//  Created by Manoj on 20/11/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit

class TransactionsViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var headTransactionOutLet: UILabel!
    
    @IBOutlet weak var tableview: UITableView!
    
    @IBOutlet weak var headImgHeight: NSLayoutConstraint!
    
    
    @IBOutlet weak var uiViewHeight: NSLayoutConstraint!
    
    
    @IBOutlet weak var operatorOutLet: UILabel!
    
    @IBOutlet weak var transactionOutLet: UILabel!
    
    
    @IBOutlet weak var amtOutLet: UILabel!
    
    
    @IBOutlet weak var comisionOutLet: UILabel!
    
    @IBOutlet weak var operatorHeight: NSLayoutConstraint!
    
    @IBOutlet weak var operatorWidth: NSLayoutConstraint!
    
    @IBOutlet weak var transactionHeight: NSLayoutConstraint!
    
    @IBOutlet weak var transactionWidth: NSLayoutConstraint!
    
    @IBOutlet weak var amtWidth: NSLayoutConstraint!
    
    
    @IBOutlet weak var amtHeight: NSLayoutConstraint!
    
    
    @IBOutlet weak var comisionWidth: NSLayoutConstraint!
    
    
    @IBOutlet weak var comisionHeight: NSLayoutConstraint!
    
    
    var placeholdersAry  = ["Airtel","Airtel","Airtel","Airtel","Airtel","Airtel","Airtel","Airtel","Airtel","Airtel"]
    
    
    var placeholdersAry1  = ["1234","1234","1234","1234","1234","1234","1234","1234","1234","1234"]
    
    var placeholdersAry2  = ["10,000","10,000","10,000","10,000","10,000","10,000","10,000","10,000","10,000","10,000"]
    
    var placeholdersAry3  = ["1000","1000","1000","1000","1000","1000","1000","1000","1000","1000"]
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    let nibName  = UINib(nibName: "FirstTableViewCell" , bundle: nil)
        tableview.register(nibName, forCellReuseIdentifier: "FirstTableViewCell")
        
        tableview.dataSource = self
        tableview.delegate = self
        
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
            uiViewHeight.constant = 50
            headImgHeight.constant = 150
            
            operatorHeight.constant = 25
            operatorWidth.constant = 140
            transactionHeight.constant = 25
            transactionWidth.constant = 170
            amtWidth.constant = 170
            amtHeight.constant = 25
            comisionWidth.constant = 350
            comisionHeight.constant = 25
            
            headTransactionOutLet.font = UIFont.systemFont(ofSize: 18)
            operatorOutLet.font = UIFont.systemFont(ofSize: 18)
            transactionOutLet.font = UIFont.systemFont(ofSize: 18)
            amtOutLet.font = UIFont.systemFont(ofSize: 18)
            comisionOutLet.font = UIFont.systemFont(ofSize: 18)

            
            
            
        }
            
        else{
            
            
            
            uiViewHeight.constant = 35
            headImgHeight.constant = 77
            
            
        }

        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    

    
    
    @IBAction func backAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        
        return 5
        
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat{
        
        return 100
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        return 50
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FirstTableViewCell", for: indexPath) as! FirstTableViewCell
        
        cell.netWorkOutLet.text = placeholdersAry[indexPath.row]
        
        cell.transactionsOutLet.text = placeholdersAry1[indexPath.row]
        
        
        cell.amountOutLet.text = placeholdersAry2[indexPath.row]
        
        cell.commissionOutLet.text = placeholdersAry3[indexPath.row]
        
        
        
        
        
        return cell
    }
    
    
}
