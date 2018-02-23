//
//  AddaddressViewController.swift
//  PayZan
//
//  Created by Manoj on 28/12/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit

class AddaddressViewController: UIViewController,UITableViewDelegate ,UITableViewDataSource {

    
    @IBOutlet weak var addAddressTableView: UITableView!
    
    @IBOutlet weak var headerImgHeight: NSLayoutConstraint!
    
    @IBOutlet weak var headerViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var backLabel: UILabel!
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var addNewAddrsBtn: UIButton!
    
    @IBOutlet weak var addNewBtnHeight: NSLayoutConstraint!
    
    
    
    var serviceController = ServiceController()
    
    var addressResultListArr:[GetAddressResultVo] = []
    
    var userId:String? = ""
    
    var deleteAddressAry : Array<Int> = Array()
    
     var deleteAddressStr : Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addAddressTableView.delegate = self
        addAddressTableView.dataSource = self
        
        addAddressTableView.separatorStyle = .none
        
        let defaults = UserDefaults.standard
        
        if let uId = defaults.string(forKey: userIDD) {
            
            userId = uId
            
            print("userId: \(String(describing: userId))")
        }
        
        
        registerTableViewCells()
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
            headerImgHeight.constant = 150
            
            headerViewHeight.constant = 50
            
            addNewBtnHeight.constant = 60
            
            backLabel.font = UIFont.systemFont(ofSize: 16)
            
            addNewAddrsBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        }
        else {
            
            headerImgHeight.constant = 79
            
            backLabel.font = UIFont.systemFont(ofSize: 12)
            
        }
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    private func registerTableViewCells() {
        
        let nibName  = UINib(nibName: "AddaddressTableViewCell" , bundle: nil)
        addAddressTableView.register(nibName, forCellReuseIdentifier: "AddaddressTableViewCell")
        
             
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getAddressAPIService()
        
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }

    
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        
        
        return 1
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        
        return addressResultListArr.count
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat{
        return 150
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        return 150
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        

        let cell = tableView.dequeueReusableCell(withIdentifier: "AddaddressTableViewCell", for: indexPath) as! AddaddressTableViewCell
        
        let listResult:GetAddressResultVo = addressResultListArr[indexPath.row]
        
        cell.selectionStyle = .none
        
        cell.nameLabel?.text = listResult.Name
        cell.address1Label?.text = listResult.AddressLine1
        cell.address2Label?.text = listResult.AddressLine2
        
        let pinCode:Int = listResult.PostCode!
        
        cell.pinCodeLabel?.text = String(pinCode)
        
        cell.deleteBtn?.layer.setValue(indexPath.row, forKey: "index")
        
        cell.editBtn.tag = indexPath.row
        cell.deleteBtn.tag = indexPath.row
        
        cell.editBtn.addTarget(self, action: #selector(editBtnClicked), for: .touchUpInside)
        
        cell.deleteBtn.addTarget(self, action: #selector(deleteBtnClicked), for: .touchUpInside)
        
        
        return cell
        
    }
    
    
    //MARK: - UIButton Action
    
    func editBtnClicked(_ sender: UIButton){
        
        
        let indexPath:IndexPath = IndexPath(row: sender.tag, section: 0)
        
        let addList:GetAddressResultVo = addressResultListArr[indexPath.row]
        
//        let name = addList.Name
//        let add1 = addList.AddressLine1
//        let add2 = addList.AddressLine2
//        let land = addList.Landmark
//        let mobileNo = addList.MobileNumber
//        let province = addList.ProvinceName
//        let dist = addList.DistrictName
//        let mandal = addList.MandalName
//        let village = addList.VillageName
        let addId = addList.Id
        
        print("addId:\(String(describing: addId))")
        
        if let _ : AddaddressTableViewCell = self.addAddressTableView.cellForRow(at: indexPath) as? AddaddressTableViewCell {
            
            
            
        }
        
        let addNewVC = self.storyboard?.instantiateViewController(withIdentifier: "AddNewAddressViewController") as? AddNewAddressViewController
        
        
        if addId != nil {
            
            let addrsId:String = String(describing: addId!)
            
            addNewVC?.addressId = addrsId
        }
        
        
        
        
//        if name != nil {
//            
//            addNewVC?.name = name!
//        }
//        if add1 != nil {
//            
//            addNewVC?.address1 = add1!
//        }
//        if add2 != nil {
//            
//            addNewVC?.address2 = add2!
//        }
//        if land != nil {
//            
//            addNewVC?.landmark = land!
//        }
//        if mobileNo != nil {
//            
//            addNewVC?.mobileNo = mobileNo!
//        }
//        if province != nil {
//            
//            addNewVC?.selectedProvinceStr = province!
//        }
//        if dist != nil {
//            
//            addNewVC?.selectedDistrictStr = dist!
//        }
//        if mandal != nil {
//            
//            addNewVC?.selectedMandalStr = mandal!
//        }
//        if village != nil {
//            
//            addNewVC?.selectedVillageStr = village!
//        }
        
     
        self.navigationController?.pushViewController(addNewVC!, animated: true)
        
        
    }
    
    //MARK: - UIButton Action
    
    func deleteBtnClicked(_ sender: UIButton){
        
        
        let indexPath : IndexPath = IndexPath(row: sender.tag, section: 0)
        
        
        if let _ : AddaddressTableViewCell = addAddressTableView.cellForRow(at: indexPath) as? AddaddressTableViewCell {
            
            
            deleteAddressStr = deleteAddressAry[indexPath.row]
            
            let i : Int = (sender.layer.value(forKey: "index")) as! Int
            
            Utilities.sharedInstance.alertWithOkAndCancelButtonAction(vc: self, alertTitle: "app.Alert".localize(), messege: "app.Areyousurewanttodeletethisaddress?".localize()) {
                
                self.deleteAddressApiCall(deleteId: self.deleteAddressStr)
                
                
                self.deleteAddressAry.remove(at: i)
                self.addressResultListArr.remove(at: i)
                
                
                self.addAddressTableView.reloadData()
                
            }
            
            
        }
        
        
    }
    
    
    func deleteAddressApiCall(deleteId : Int) {
        
        
        let strUrl = addressDeleteUrl + String(deleteId)
        
        
        serviceController.requestDELETEURL(strURL:strUrl, success:{(result) in
            DispatchQueue.main.async()
                {
                    
                    let respVO:AddressDeleteInfoVo = Mapper().map(JSONObject: result)!
                    
                    
                    let isActive = respVO.IsSuccess
                    
                    if(isActive == true){
                        
                        let successObj = respVO.EndUserMessage
                        
                         self.view.makeToast(successObj, duration:kToastDuration, position:CSToastPositionCenter)
                        
                        
                        
                    }else if(isActive == false) {
                        
                        self.view.makeToast("Service not found", duration:kToastDuration, position:CSToastPositionCenter)
                        
                    }
                    
            }
        }, failure:  {(error) in
        })

        
        
    }
    
    
    func getAddressAPIService(){
        
        if(appDelegate.checkInternetConnectivity()){
            
            if !(userId?.isEmpty)! {
            
                let strUrl = getAddressbyUserIdUrl + "" + userId!
            
            
                serviceController.requestGETURL(strURL:strUrl, success:{(result) in
                    DispatchQueue.main.async()
                        {
                            
                            let respVO:GetAddressVo = Mapper().map(JSONObject: result)!
                            
                            
                            let isActive = respVO.IsSuccess
                            
                            
                            if(isActive == true){
                                
                                let listResultVo = respVO.ListResult
                                
                                self.addressResultListArr = listResultVo!
                                
                                self.deleteAddressAry.removeAll()
                                
                                for(_,element) in (listResultVo?.enumerated())! {
                                    
                                    self.deleteAddressAry.append(element.Id!)
                            
                                }
                                
                                
                                DispatchQueue.main.async(execute: { () -> Void in
                                    
                                    self.addAddressTableView.reloadData()
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
                                    
                                    self.getAddressAPIService()
                                    
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
        
        
    
        
    
    
    @IBAction func addNewAddressAction(_ sender: Any) {
        
        let addMoneyViewController = self.storyboard?.instantiateViewController(withIdentifier: "AddNewAddressViewController") as! AddNewAddressViewController
        
        
        
        self.navigationController?.pushViewController(addMoneyViewController, animated: true)
        

        
    }
    
    
    @IBAction func backAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)

    }

    
    
}

