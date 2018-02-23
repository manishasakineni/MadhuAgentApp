//
//  AllOffersViewController.swift
//  OffersScreen
//
//  Created by Mac OS on 21/12/17.
//  Copyright © 2017 Mac OS. All rights reserved.
//

import UIKit

class AllOffersViewController: UIViewController,UITableViewDelegate ,UITableViewDataSource,UIScrollViewDelegate{

    
    @IBOutlet weak var allOffersTableView: UITableView!
    var delegate: changeSubtitleOfIndexDelegate?
    
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var textView: UITextView!
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var skipButton: UIButton!
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!

    
    
    let arrImages = ["baner", "baner1", "baner2","baner3", "baner", "baner1","baner2", "baner3", "baner","baner1"]


    
    override func viewDidLoad() {
        super.viewDidLoad()

        allOffersTableView.delegate = self
        allOffersTableView.dataSource = self
        
        
        // Do any additional setup after loading the view, typically from a nib.
        //1
        
        registerTableViewCells()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    private func registerTableViewCells() {
    
//        let nibName  = UINib(nibName: "PageControllCell" , bundle: nil)
//        allOffersTableView.register(nibName, forCellReuseIdentifier: "PageControllCell")
//        
        
        let nibName2  = UINib(nibName: "ScrollImagesCell" , bundle: nil)
        allOffersTableView.register(nibName2, forCellReuseIdentifier: "ScrollImagesCell")
        
        let nibName1  = UINib(nibName: "AllOffersCell" , bundle: nil)
        allOffersTableView.register(nibName1, forCellReuseIdentifier: "AllOffersCell")
        
        
       
        
        
//        upDateCounter = 0
//        
//        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(AllOffersViewController.updateTimer), userInfo: nil, repeats: true)

        
        
//        let nibName1  = UINib(nibName: "HeaderSectionCell" , bundle: nil)
//        inSpectionProTableView.register(nibName1, forCellReuseIdentifier: "HeaderSectionCell")
        
    }
    
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        
        
        return 1
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
     
        return 10
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat{
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        return UITableViewAutomaticDimension
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        
       if indexPath.row == 0 {
          
     //       let pageControllCell = tableView.dequeueReusableCell(withIdentifier: "PageControllCell", for: indexPath) as! PageControllCell
     //       pageControllCell.pageingImageView.image = UIImage(named:imageView[indexPath.row])

          //  if (upDateCounter <= 10) {

         //   pageControllCell.pageController.currentPage = upDateCounter
         //   pageControllCell.pageingImageView.image = UIImage(named:String(upDateCounter+1))
//            upDateCounter = upDateCounter + 1
//            }else{
//                
//                upDateCounter = 0
//            }

      //      return pageControllCell
let scrollImagesCell = tableView.dequeueReusableCell(withIdentifier: "ScrollImagesCell", for: indexPath) as! ScrollImagesCell
        
        
        return scrollImagesCell
        
        }
        
        let allOffersCell = tableView.dequeueReusableCell(withIdentifier: "AllOffersCell", for: indexPath) as! AllOffersCell
        
    
        
        allOffersCell.titleImageView.image =   UIImage(named: arrImages[indexPath.row])
        allOffersCell.subTitleImageView.image =   UIImage(named: arrImages[indexPath.row])

        return allOffersCell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
//        
//        if (indexPath.row == 0){
//       
//            
//            let reOrderPopOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TransactNowViewController") as! TransactNowViewController
//            // reOrderPopOverVC.delegate = self
//            
//            self.addChildViewController(reOrderPopOverVC)
//            reOrderPopOverVC.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
//            self.view.addSubview(reOrderPopOverVC.view)
//            reOrderPopOverVC.didMove(toParentViewController: self)
//            print("AllOfferViewController Button Tapped......")
//            
//        }
        
//        let reOrderPopOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TransactNowViewController") as! TransactNowViewController
//       // reOrderPopOverVC.delegate = self
//        
//        self.addChildViewController(reOrderPopOverVC)
//        reOrderPopOverVC.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
//        self.view.addSubview(reOrderPopOverVC.view)
//        reOrderPopOverVC.didMove(toParentViewController: self)
//        print("AllOfferViewController Button Tapped......")

        
        
        
    }
    
    internal func updateTimer(){
//        
//        if (upDateCounter <= 10) {
//            
//            pageController.currentPage = upDateCounter
//            pageingImageView.image = UIImage(named: String(upDateCounter+1))
//            upDateCounter = upDateCounter + 1
//        }
//        else{
//            
//            upDateCounter = 0
//        }
//        
//        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    
//    @IBAction func skipClicked(_ sender: UIButton) {
//        
//        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "rootVC") as! CCKFNavDrawer
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        appDelegate.window?.rootViewController = viewController
//        //
//    }
    
//    @IBAction func loginClicked(_ sender: UIButton) {
//        
//        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "rootVC") as! CCKFNavDrawer
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        appDelegate.window?.rootViewController = viewController
//        
//    }

}
