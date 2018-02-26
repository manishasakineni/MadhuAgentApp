//
//  ChooseLanguageViewController.swift
//  PayZan
//
//  Created by Manoj on 26/02/18.
//  Copyright © 2018 CalibrageMac02. All rights reserved.
//

import UIKit
import Localize

class ChooseLanguageViewController: UIViewController {
    
    
    @IBOutlet weak var languageBtn: UIButton!
    
    
    @IBOutlet weak var skipBtn: UIButton!
    

    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func languageBtnAction(_ sender: Any) {
    
    
    
    
        let actionSheet = UIAlertController(title: nil, message: "app.ChooseLanguage".localize(), preferredStyle: .actionSheet)
        for language in Localize.availableLanguages() {
            let displayName = Localize.displayNameForLanguage(language)
            let languageAction = UIAlertAction(title: displayName, style: .default, handler: {
                (alert: UIAlertAction!) -> Void in
                Localize.update(language: language)
                
                let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                
                let viewController = mainStoryboard.instantiateViewController(withIdentifier: "LoginNav") as! UINavigationController
                let defaults = UserDefaults.standard
                defaults.set("backBtn", forKey: "hideBackBtn")
                
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.window?.rootViewController = viewController
                
            })
            actionSheet.addAction(languageAction)
        }
        let cancelAction = UIAlertAction(title: "app.Cancel".localize(), style: UIAlertActionStyle.cancel, handler: {
            (alert: UIAlertAction) -> Void in
        })
        actionSheet.addAction(cancelAction)
        
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone) {
            
            
            self.present(actionSheet, animated: true, completion: nil)
        }
            
        else{
            
            let popup = UIPopoverController.init(contentViewController: actionSheet)
            
            popup.present(from: CGRect(x:self.languageBtn.frame.size.width/2, y:self.languageBtn.frame.size.height, width:0, height:0), in: self.languageBtn, permittedArrowDirections: UIPopoverArrowDirection.up, animated: true)
            
        }
    }
    
    @IBAction func skipBtnAction(_ sender: Any) {
   
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "LoginNav") as! UINavigationController
        let defaults = UserDefaults.standard
        defaults.set("backBtn", forKey: "hideBackBtn")
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = viewController
    }
    
    
    
    
    
}
