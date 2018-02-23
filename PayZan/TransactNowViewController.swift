//
//  TransactNowViewController.swift
//  OffersScreen
//
//  Created by Mac OS on 25/12/17.
//  Copyright © 2017 Mac OS. All rights reserved.
//

import UIKit

class TransactNowViewController: UIViewController,UITableViewDelegate ,UITableViewDataSource {

    @IBOutlet weak var transactionTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        transactionTableView.delegate = self
        transactionTableView.dataSource = self
        
        
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)

        
        registerTableViewCells() 
        
        // Do any additional setup after loading the view.
    }

    
    private func registerTableViewCells() {
        
        let nibName  = UINib(nibName: "TransactionCell" , bundle: nil)
        transactionTableView.register(nibName, forCellReuseIdentifier: "TransactionCell")
        
        
        
        let nibName1  = UINib(nibName: "TermsAndConditionCell" , bundle: nil)
        transactionTableView.register(nibName1, forCellReuseIdentifier: "TermsAndConditionCell")
        
        
        
    }
    
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        
        
        return 1
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        
        return 2
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat{
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        return UITableViewAutomaticDimension
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        if indexPath.row == 0 {
           
            let transactionCell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell", for: indexPath) as! TransactionCell
            
            return transactionCell
            
        }
        let termsAndConditionCell = tableView.dequeueReusableCell(withIdentifier: "TermsAndConditionCell", for: indexPath) as! TermsAndConditionCell
        
        
        termsAndConditionCell.transactNowButton.addTarget(self, action: #selector(TransactNowViewController.transactNow(_:)), for: .touchUpInside)

        
        
        
        return termsAndConditionCell
        
    }
    
    
    @IBAction func transactNow(_ sender: UIButton) {

        
        removeAnimate()
        
        
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
