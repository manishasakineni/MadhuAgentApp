//
//  OrderHistoryViewController.swift
//  NewScreens
//
//  Created by Manoj on 22/11/17.
//  Copyright © 2017 Manoj. All rights reserved.
//

import UIKit

class OrderHistoryViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    //MARK:- OutLets


    @IBOutlet weak var orderTableView: UITableView!
    
    @IBOutlet weak var headerImgHeight: NSLayoutConstraint!
    
    @IBOutlet weak var headerViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var backLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK:- NibName

        
        let nibName  = UINib(nibName: "OrderHistoryTableViewCell1" , bundle: nil)
        orderTableView.register(nibName, forCellReuseIdentifier: "OrderHistoryTableViewCell1")
        
        
        
        
        orderTableView.dataSource = self
        orderTableView.delegate = self

        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
            headerImgHeight.constant = 150
            
            headerViewHeight.constant = 50
            
            backLabel.font = UIFont.systemFont(ofSize: 16)
        }
        else {
            
            headerImgHeight.constant = 79
            
            backLabel.font = UIFont.systemFont(ofSize: 12)
            
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
    
    //MARK:- Button Action

    
    @IBAction func backAction(_ sender: Any) {
        
         self.navigationController?.popViewController(animated: true)
    }
    
    
   //MARK:- UITableView Datasource Methods 
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        
        return 4
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        return 100
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat{
        
        return 100
        
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
                   let cell = tableView.dequeueReusableCell(withIdentifier: "OrderHistoryTableViewCell1", for: indexPath) as! OrderHistoryTableViewCell1
            
            return cell
     
    }



}
