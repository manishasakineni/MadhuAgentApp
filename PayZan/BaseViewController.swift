//
//  BaseViewController.swift
//  eSahai
//
//  Created by eSahai on 04/07/17.
//  Copyright © 2017 MiMiTech. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var appDelegate = AppDelegate()
    let sharedController = ServiceController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appDelegate = UIApplication.shared.delegate as! AppDelegate

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: -
    
    func showAlertView1WithTitle(_ title:String,message:String,buttonTitle:String)
    {

    let alertController = UIAlertController(title: "", message: "" , preferredStyle: UIAlertControllerStyle.alert)
    
    let DestructiveAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.destructive) { (result : UIAlertAction) -> Void in
    }
    alertController.addAction(DestructiveAction)
    self.present(alertController, animated: true, completion: nil)
        
    }
    
    func showAlertViewWithTitle(_ title:String,message:String,buttonTitle:String)
    {
        let alertView:UIAlertView = UIAlertView();
        alertView.title=title
        alertView.message=message
        alertView.addButton(withTitle: buttonTitle)
        alertView.show()
    }
    
    func showAlertViewWithTitleAndButtons(_ title:String,message:String,arrButtons:
        
        NSArray,delegate:AnyObject)
    {
        let alertView:UIAlertView = UIAlertView();
        alertView.title=title
        alertView.message=message
        alertView.delegate=delegate
        for  buttonTitle in arrButtons
        {
            alertView.addButton(withTitle: buttonTitle as! String)
        }
        alertView.show()
    }

    //MARK: - resize Image
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
}
    extension BaseViewController{
        
      
    }


