//
//  CommissionsViewController.swift
//  PayZan
//
//  Created by Manoj on 20/11/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit

class CommissionsViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource {
    
    var placeholdersAry  = ["11-11-17","11-11-17","11-11-17","11-11-17","11-11-17","11-11-17","11-11-17","11-11-17","11-11-17","11-11-17"]
    
    
    
    var placeholdersAry1  = ["Airtel","Airtel","Airtel","Airtel","Airtel","Airtel","Airtel","Airtel","Airtel","Airtel"]
    
    
    var placeholdersAry2  = ["ADCD1234567","ADCD1234567","ADCD1234567","ADCD1234567","ADCD1234567","ADCD1234567","ADCD1234567","ADCD1234567","ADCD1234567","ADCD1234567"]
    
    var placeholdersAry3  = ["8008800154","8008800154","8008800154","8008800154","8008800154","8008800154","8008800154","8008800154","8008800154","8008800154"]
    
    var placeholdersAry4  = ["Rs 344","Rs 344","Rs 344","Rs 344","Rs 344","Rs 344","Rs 344","Rs 344","Rs 344","Rs 344"]
    
    
    
    var placeholdersAry5  = ["Postpaid","Postpaid","Postpaid","Postpaid","Postpaid","Postpaid","Postpaid","Postpaid","Postpaid","Postpaid"]
    
    
    @IBOutlet weak var headImgHeight: NSLayoutConstraint!
    
    
    @IBOutlet weak var uiViewHeight: NSLayoutConstraint!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var commisionOutLet: UILabel!
    
    @IBOutlet weak var fromOutLet: UILabel!
    
    @IBOutlet weak var toOutLet: UILabel!
    
    @IBOutlet weak var goOutLet: UIButton!
    
    @IBOutlet weak var dateOperetorOutLet: UILabel!
    
    @IBOutlet weak var transactionIdOutLet: UILabel!
    
    @IBOutlet weak var mobileNoOutLet: UILabel!
    
    
    @IBOutlet weak var amounttypeOutLet: UILabel!
    
    @IBOutlet weak var operatorOutLet: UILabel!
    
    
    @IBOutlet weak var typeOutLet: UILabel!
    
    @IBOutlet weak var searchbarHeight: NSLayoutConstraint!
    
    
    @IBOutlet weak var fromLblHeight: NSLayoutConstraint!
    
    @IBOutlet weak var fromTFHeight: NSLayoutConstraint!
    
    @IBOutlet weak var toLblHeight: NSLayoutConstraint!
    
    @IBOutlet weak var toTFHeight: NSLayoutConstraint!
    
    @IBOutlet weak var goBtnHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    let nibName  = UINib(nibName: "SecondTableViewCell" , bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "SecondTableViewCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
            headImgHeight.constant = 150
            uiViewHeight.constant = 50
            
            
            searchbarHeight.constant = 60

            fromLblHeight.constant = 31
            fromTFHeight.constant = 40

            toLblHeight.constant = 31
            toTFHeight.constant = 40
            goBtnHeight.constant = 35

            
            
            commisionOutLet.font = UIFont.systemFont(ofSize: 18)
            fromOutLet.font = UIFont.systemFont(ofSize: 18)
            toOutLet.font = UIFont.systemFont(ofSize: 18)
            dateOperetorOutLet.font = UIFont.systemFont(ofSize: 18)
            transactionIdOutLet.font = UIFont.systemFont(ofSize: 18)
            mobileNoOutLet.font = UIFont.systemFont(ofSize: 18)
            amounttypeOutLet.font = UIFont.systemFont(ofSize: 18)
            typeOutLet.font = UIFont.systemFont(ofSize: 18)
            operatorOutLet.font = UIFont.systemFont(ofSize: 18)

        }
            
        else{
            
            headImgHeight.constant = 79
            
        }        
        
        // Do any additional setup after loading the view, typically from a nib.
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
        
        
        return 9
        
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat{
        
        return 100
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        return 50
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        
    let cell = tableView.dequeueReusableCell(withIdentifier: "SecondTableViewCell", for: indexPath) as! SecondTableViewCell
        
    cell.dateOutLet.text = placeholdersAry[indexPath.row]
        
    cell.networkOutLet.text = placeholdersAry1[indexPath.row]
        
        
    cell.numbersOutLet.text = placeholdersAry2[indexPath.row]
        
    cell.phNoOutLet.text = placeholdersAry3[indexPath.row]
        
        
    cell.amountOutLet.text = placeholdersAry4[indexPath.row]
        
    cell.postPaidOutLet.text = placeholdersAry5[indexPath.row]
        
        
        
        
        
        
        return cell
    }
    
    
    
}

