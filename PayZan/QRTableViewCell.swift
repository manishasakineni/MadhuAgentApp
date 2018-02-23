//
//  QRTableViewCell.swift
//  PayZan
//
//  Created by CalibrageMac02 on 13/12/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit

class QRTableViewCell: UITableViewCell {
    
    @IBOutlet weak var scanQRBtn: UIButton!
    
    @IBOutlet weak var shareBtn: UIButton!
    
    @IBOutlet weak var scanQrBtnHeight: NSLayoutConstraint!
    
    @IBOutlet weak var shareBtnHeight: NSLayoutConstraint!
    
    @IBOutlet weak var scanQrWidth: NSLayoutConstraint!
    
    @IBOutlet weak var shareWidth: NSLayoutConstraint!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
            scanQrBtnHeight.constant = 50
            shareBtnHeight.constant = 50
            
            scanQrWidth.constant = 100
            shareWidth.constant = 100
            scanQRBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            shareBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        }
        else {
            
            scanQrBtnHeight.constant = 35
            shareBtnHeight.constant = 35
            
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
