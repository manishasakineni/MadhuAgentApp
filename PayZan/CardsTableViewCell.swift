//
//  CardsTableViewCell.swift
//  PayZan
//
//  Created by N@n!'$ Mac on 18/01/18.
//  Copyright © 2018 CalibrageMac02. All rights reserved.
//

import UIKit

class CardsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var netbankingHeight: NSLayoutConstraint!
    @IBOutlet weak var netbankingWidth: NSLayoutConstraint!
    @IBOutlet weak var creditWidth: NSLayoutConstraint!
    @IBOutlet weak var creditHeight: NSLayoutConstraint!
    @IBOutlet weak var debitWidth: NSLayoutConstraint!
    @IBOutlet weak var debitHeight: NSLayoutConstraint!
    
    
    @IBOutlet weak var savedWidth: NSLayoutConstraint!
    @IBOutlet weak var savedHeight: NSLayoutConstraint!
    
    @IBOutlet weak var uiViewheight: NSLayoutConstraint!
    @IBOutlet weak var uiViewOutLet: UIView!
    
    
    @IBOutlet weak var savedBtn: UIButton!
    
    @IBOutlet weak var creditBtn: UIButton!

    @IBOutlet weak var debitBtn: UIButton!
    
    @IBOutlet weak var netBankingBtn: UIButton!
    
    @IBOutlet weak var payingAmount: UILabel!
    
    @IBOutlet weak var savedCardLabel: UILabel!
    
    @IBOutlet weak var debitCardLabel: UILabel!
    
    @IBOutlet weak var creditCardLabel: UILabel!
    
    @IBOutlet weak var netbankingLabel: UILabel!
    
    
    @IBOutlet weak var selectAnOptionLabel: UILabel!
    
    @IBOutlet weak var lineLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
          if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
            
            self.uiViewheight.constant = 150
            self.savedHeight.constant = 120
            self.savedWidth.constant = 120
            self.debitHeight.constant = 120
            self.debitWidth.constant = 120
            self.creditWidth.constant = 120
            self.creditHeight.constant = 120
            self.netbankingWidth.constant = 120
            self.netbankingHeight.constant = 120
        savedCardLabel.font = UIFont.systemFont(ofSize: 15)
            debitCardLabel.font = UIFont.systemFont(ofSize: 15)
            creditCardLabel.font = UIFont.systemFont(ofSize: 15)
            netbankingLabel.font = UIFont.systemFont(ofSize: 15)
            
            payingAmount.font = UIFont.systemFont(ofSize: 20)
            
            selectAnOptionLabel.font = UIFont.systemFont(ofSize: 20)



            
          }else{
           
            self.savedHeight.constant = 60
            self.savedWidth.constant = 60
            self.debitHeight.constant = 60
            self.debitWidth.constant = 60
            self.creditWidth.constant = 60
            self.creditHeight.constant = 60
            self.netbankingWidth.constant = 60
            self.netbankingHeight.constant = 60
            
            

            
            
            
        }
        // Initialization code
        
        // if let mapTableViewCell : MapTableViewCell = self.newRegTableview.cellForRow(at: indexPath) as? MapTableViewCell {
    }
    
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
