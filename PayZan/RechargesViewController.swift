//
//  RechargesViewController.swift
//  OffersScreen
//
//  Created by Mac OS on 21/12/17.
//  Copyright © 2017 Mac OS. All rights reserved.
//

import UIKit

class RechargesViewController: UIViewController,UITableViewDelegate ,UITableViewDataSource{

    @IBOutlet weak var rechargeTableView: UITableView!
    var delegate: changeSubtitleOfIndexDelegate?

    
    
    let arrImages = ["baner", "baner1", "baner2","baner3", "baner", "baner1","baner2", "baner3", "baner","baner1"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rechargeTableView.delegate = self
        rechargeTableView.dataSource = self
        
        
        // Do any additional setup after loading the view, typically from a nib.
        //1
        
        
        
        
        registerTableViewCells()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    private func registerTableViewCells() {
        
        let nibName1  = UINib(nibName: "AllOffersCell" , bundle: nil)
        rechargeTableView.register(nibName1, forCellReuseIdentifier: "AllOffersCell")
        
        
    }
    
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        
        
        return 1
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        
        return arrImages.count
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat{
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        return UITableViewAutomaticDimension
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let allOffersCell = tableView.dequeueReusableCell(withIdentifier: "AllOffersCell", for: indexPath) as! AllOffersCell
        
        allOffersCell.titleImageView.image =   UIImage(named: arrImages[indexPath.row])
        allOffersCell.subTitleImageView.image =   UIImage(named: arrImages[indexPath.row])
        
        
        return allOffersCell
        
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
   
    
}

