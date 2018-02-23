//
//  HomeCollectionViewCell.swift
//  Payan_Naveen
//
//  Created by Nani Mac on 28/09/17.
//  Copyright © 2017 Naveen. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var productIMG: UIImageView!
    
    @IBOutlet weak var nameLBL: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        
         if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
            nameLBL.font = UIFont.systemFont(ofSize: 25)
            
            
        }
//         else {
//            
//             nameLBL.font = UIFont.systemFont(ofSize: 10)
//        }
        
        
    }

}
