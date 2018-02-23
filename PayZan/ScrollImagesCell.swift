//
//  ScrollImagesCell.swift
//  OffersScreen
//
//  Created by Mac OS on 22/12/17.
//  Copyright © 2017 Mac OS. All rights reserved.
//

import UIKit

class ScrollImagesCell: UITableViewCell, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var backGroundView: UIView!
    
    @IBOutlet weak var pageController: UIPageControl!
    var offSet: CGFloat = 0
    var timer : Timer!
    var counter = 0
    
    let arrImages = ["baner", "baner1", "baner2","baner3", "baner", "baner1","baner2", "baner3", "baner","baner1","baner", "baner1", "baner2","baner3", "baner", "baner1","baner2", "baner3", "baner","baner1","baner2", "baner3"]

//    struct ScreenSize {
//        
//        static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
//        static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
//        static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
//        static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
//    }
//    
//    struct DeviceType {
//        
//        static let IS_IPHONE_4_OR_LESS  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
//        static let IS_IPHONE_5          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
//        static let IS_IPHONE_6          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
//        static let IS_IPHONE_6P         = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
//        static let IS_IPAD              = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH >= 1024.0
//    }
//    
//    struct Version {
//        
//        static let SYS_VERSION_FLOAT = (UIDevice.current.systemVersion as NSString).floatValue
//        static let iOS7 = (Version.SYS_VERSION_FLOAT < 8.0 && Version.SYS_VERSION_FLOAT >= 7.0)
//        static let iOS8 = (Version.SYS_VERSION_FLOAT >= 8.0 && Version.SYS_VERSION_FLOAT < 9.0)
//        static let iOS9 = (Version.SYS_VERSION_FLOAT >= 9.0 && Version.SYS_VERSION_FLOAT < 10.0)
//        static let iOS10 = (Version.SYS_VERSION_FLOAT >= 10.0 && Version.SYS_VERSION_FLOAT < 11.0)
//    }
//    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
//        self.scrollView.frame = CGRect(x:0, y:0, width:self.frame.width, height:self.frame.height)
//
//        
        backGroundView.layer.cornerRadius = 3.0
        backGroundView.layer.shadowColor = UIColor.lightGray.cgColor
        backGroundView.layer.shadowOffset = CGSize(width: 0, height: 3)
        backGroundView.layer.shadowOpacity = 0.6
        backGroundView.layer.shadowRadius = 2.0
        
//
//        
//
//        self.scrollView.frame = CGRect(x:0, y:0, width:self.frame.width, height:self.frame.height)
//        let scrollViewWidth:CGFloat = self.scrollView.frame.width
//        let scrollViewHeight:CGFloat = self.scrollView.frame.height
//        //self.skipButton.layer.cornerRadius = 4.0
//        
//        let imgOne = UIImageView(frame: CGRect(x:0, y:0,width:scrollViewWidth, height:scrollViewHeight))
//        imgOne.contentMode = .scaleAspectFit
//        
//        if DeviceType.IS_IPAD{
//            imgOne.image = UIImage(named: "sync.png")
//        }else{
//            imgOne.image = UIImage(named: "bans.JPG")
//        }
//        
//        
//        
//        let imgTwo = UIImageView(frame: CGRect(x:scrollViewWidth, y:0,width:scrollViewWidth, height:scrollViewHeight))
//        imgTwo.contentMode = .scaleAspectFit
//        
//        if DeviceType.IS_IPAD{
//            imgTwo.image = UIImage(named: "unlike.png")
//        }else{
//            imgTwo.image = UIImage(named: "bans.JPG-1")
//        }
//        
//        
//        
//        let imgThree = UIImageView(frame: CGRect(x:scrollViewWidth*2, y:0,width:scrollViewWidth, height:scrollViewHeight))
//        imgThree.contentMode = .scaleAspectFit
//        
//        if DeviceType.IS_IPAD{
//            imgThree.image = UIImage(named: "unlike.png")
//        }else{
//            imgThree.image = UIImage(named: "ban.JPG")
//        }
//        
//        
//        
//        
//        let imgFour = UIImageView(frame: CGRect(x:scrollViewWidth*3, y:0,width:scrollViewWidth, height:scrollViewHeight))
//        imgFour.contentMode = .scaleAspectFit
//        
//        if DeviceType.IS_IPAD{
//            imgFour.image = UIImage(named: "unlike.png")
//        }else{
//            imgFour.image = UIImage(named: "ban.JPG")
//        }
//        
//        
//        
//        
//        
//        let imgFive = UIImageView(frame: CGRect(x:scrollViewWidth*4, y:0,width:scrollViewWidth, height:scrollViewHeight))
//        imgFive.contentMode = .scaleAspectFit
//        
//        if DeviceType.IS_IPAD{
//            imgFive.image = UIImage(named: "unlike.png")
//        }else{
//            imgFive.image = UIImage(named: "bans.JPG-1")
//        }
//        
//        
//        
//        
//        
//        let imgSix = UIImageView(frame: CGRect(x:scrollViewWidth*5, y:0,width:scrollViewWidth, height:scrollViewHeight))
//        imgSix.contentMode = .scaleAspectFit
//        
//        if DeviceType.IS_IPAD{
//            imgSix.image = UIImage(named: "unlike.png")
//        }else{
//            imgSix.image = UIImage(named: "bans.JPG")
//        }
//        
//        
//        
//        
//        
//        
//        self.scrollView.addSubview(imgOne)
//        self.scrollView.addSubview(imgTwo)
//        self.scrollView.addSubview(imgThree)
//        self.scrollView.addSubview(imgFour)
//        self.scrollView.addSubview(imgFive)
//        self.scrollView.addSubview(imgSix)
//        
//        
//        self.scrollView.contentSize = CGSize(width:self.scrollView.frame.width * 6, height:self.scrollView.frame.height)
//        self.scrollView.delegate = self
//        self.pageController.currentPage = 0
//        
//          timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(ScrollImagesCell.doSomeAnimation), userInfo: nil, repeats: true)
//
        
loadScrollView()
        
    }
    
    
    func loadScrollView() {
        
        self.offSet = 0
         timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(doSomeAnimation), userInfo: nil, repeats: true)
        
        pageController.numberOfPages = arrImages.count
        scrollView.isPagingEnabled = true
        scrollView.contentSize.height = 112
        scrollView.contentSize.width = self.bounds.width * CGFloat(arrImages.count)
        scrollView.showsHorizontalScrollIndicator = false
        
        scrollView.delegate = self
        
        for (index, image) in arrImages.enumerated() {
            let image = image
            let imageView = UIImageView(image: UIImage(named: image)!)
            imageView.contentMode = .scaleAspectFit
            imageView.frame.size.width = self.bounds.size.width
            imageView.frame.size.height = 112
            imageView.frame.origin.x = CGFloat(index) * self.bounds.size.width
            scrollView.addSubview(imageView)
        }
        
//        let pageCount : CGFloat = CGFloat(arrImages.count)
//        
//        scrollView.backgroundColor = UIColor.clear
//        scrollView.delegate = self
//        scrollView.isPagingEnabled = true
//        scrollView.contentSize = CGSize(width:scrollView.frame.size.width * pageCount, height:scrollView.frame.size.height)
//        scrollView.showsHorizontalScrollIndicator = false
//        
//        pageController.numberOfPages = Int(pageCount)
//        pageController.addTarget(self, action: #selector(self.pageChanged), for: .valueChanged)
//        
//        
//        for i in 0..<Int(pageCount) {
//            //print(self.scrollView.frame.size.width)
//            let image = UIImageView(frame: CGRect(x:self.scrollView.frame.size.width * CGFloat(i), y:0, width:self.scrollView.frame.size.width, height:self.scrollView.frame.size.height))
//            image.image = UIImage(named: arrImages[i])!
//            image.contentMode = UIViewContentMode.scaleAspectFit
//            self.scrollView.addSubview(image)
//        }
    
        
    }
    
    
    func doSomeAnimation() {
        //I have four pngs in my project, which are named frame1.png ... and so on
        
//        
//        let totalPossibleOffset = CGFloat(arrImages.count - 1) * self.bounds.size.width
//        var offSet : CGFloat = 0.0
//        if offSet == totalPossibleOffset {
//            offSet = 0 // come back to the first image after the last image
//        }
//        else {
//            offSet += self.bounds.size.width
//        }
//        DispatchQueue.main.async() {
//            UIView.animate(withDuration: 0.3, delay: 0, options: UIViewAnimationOptions.curveLinear, animations: {
//                self.scrollView.contentOffset.x = CGFloat(offSet)
//            }, completion: nil)
//        }
        
        let imgsCount:CGFloat = CGFloat(arrImages.count)
        let pageWidth:CGFloat = self.scrollView.frame.width
        let maxWidth:CGFloat = pageWidth * imgsCount
        let contentOffset:CGFloat = self.scrollView.contentOffset.x
        
        var slideToX = contentOffset + pageWidth
        
        if  contentOffset + pageWidth == maxWidth{
            slideToX = 0
        }
        let currentPage:CGFloat = slideToX / pageWidth
        
        print(currentPage)
        // Change the indicator
        self.pageController.currentPage = Int(currentPage)
        self.scrollView.scrollRectToVisible(CGRect(x:slideToX, y:0, width:pageWidth, height:self.scrollView.frame.height), animated: true)
    }
    
    //MARK: UIScrollView Delegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let viewWidth: CGFloat = scrollView.frame.size.width
        // content offset - tells by how much the scroll view has scrolled.
        let pageNumber = floor((scrollView.contentOffset.x - viewWidth / 50) / viewWidth) + 1
        pageController.currentPage = Int(pageNumber)
    }
    
    //MARK: Page tap action
    func pageChanged() {
        let pageNumber = pageController.currentPage
        var frame = scrollView.frame
        frame.origin.x = frame.size.width * CGFloat(pageNumber)
        frame.origin.y = 0
        scrollView.scrollRectToVisible(frame, animated: true)
    }

    
//    func scrollImage(){
//        // Test the offset and calculate the current page after scrolling ends
//        let pageWidth:CGFloat = scrollView.frame.width
//        let currentPage:CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
//        // Change the indicator
//        self.pageController.currentPage = Int(currentPage);
//        // Change the text accordingly
//        if Int(currentPage) != 5{
//            print("Initial Page")
//            //    skipButton.isHidden = false
//            //  skipButton.setTitle("Skip", for: UIControlState.normal)
//        }else{
//            // Show the "Let's Start" button in the last slide (with a fade in animation)
//            //     skipButton.isHidden = true
//            UIView.animate(withDuration: 1.0, animations: { () -> Void in
//            })
//        }
//        
//        
//    }
//    
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView){
//      scrollImage()
//    }
  

    @IBAction func pageControllerButtonTapped(_ sender: Any) {
        
   pageChanged()
        
        
      //  scrollImage()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
