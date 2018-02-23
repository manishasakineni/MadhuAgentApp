//
//  AddCardsViewController.swift
//  NewScreens
//
//  Created by Manoj on 23/11/17.
//  Copyright © 2017 Manoj. All rights reserved.
//

import UIKit

class AddCardsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    //MARK:- OutLets
    
    @IBOutlet weak var addableView: UITableView!
    
    @IBOutlet weak var headerImgHeight: NSLayoutConstraint!
    
    @IBOutlet weak var headerViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var backLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK:- NibName

        
        let nibName  = UINib(nibName: "AddCardsTableViewCell" , bundle: nil)
        addableView.register(nibName, forCellReuseIdentifier: "AddCardsTableViewCell")
        
        
        let nibName1  = UINib(nibName: "AddNewCardsTableViewCell" , bundle: nil)
        addableView.register(nibName1, forCellReuseIdentifier: "AddNewCardsTableViewCell")
        

        
        
        addableView.dataSource = self
        addableView.delegate = self
        
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
        
        
        return 2
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        
        
    
        
        if section == 0 {
            
            return 4
        }
        
        return 1
        
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        return UITableViewAutomaticDimension
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat{
        
        return UITableViewAutomaticDimension
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        
        
        if indexPath.section == 0 {
            
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddCardsTableViewCell", for: indexPath) as! AddCardsTableViewCell
            
            cell.selectionStyle = .none
        
        return cell
        
        }
        
        else{
            
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "AddNewCardsTableViewCell", for: indexPath) as! AddNewCardsTableViewCell
            
            cell2.selectionStyle = .none
            
            cell2.addNewCardsOutLet.addTarget(self, action: #selector(AddCardsViewController.transactNow(_:)), for: .touchUpInside)


            
            
            
            return cell2
            
            
        }

    }
    
    
    
    
    
    
    
    @IBAction func transactNow(_ sender: UIButton) {
        
        

        
        let addNewVC = self.storyboard?.instantiateViewController(withIdentifier: "SavedCardsViewController") as? SavedCardsViewController
        
        
        self.navigationController?.pushViewController(addNewVC!, animated: true)

        
    }
    

}
