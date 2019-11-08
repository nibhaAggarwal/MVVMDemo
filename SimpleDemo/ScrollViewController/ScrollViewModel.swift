//
//  ScrollViewModel.swift
//  SimpleDemo
//
//  Created by Nibha Aggarwal on 06/11/19.
//  Copyright © 2019 Nibha Aggarwal. All rights reserved.
//

import Foundation
import UIKit

class ScrollViewModel: NSObject {
    var dependency: ScrollViewController?
    var completion: ()->()?
        

    init(ref: ScrollViewController, callBack: @escaping()->()) {
        dependency = ref
        completion = callBack
    }
    
    
    
    func createSlides() -> [PageView] {

            let slide1:PageView = Bundle.main.loadNibNamed("PageView", owner: self, options: nil)?.first as! PageView
    //        slide1.imageView.image = UIImage(named: "ic_onboarding_1")
            slide1.labelTitle!.text = "A real-life bear"
            
            let slide2:PageView = Bundle.main.loadNibNamed("PageView", owner: self, options: nil)?.first as! PageView
    //        slide2.imageView.image = UIImage(named: "ic_onboarding_2")
            slide2.labelTitle!.text = "A real-life bear"
            
            let slide3:PageView = Bundle.main.loadNibNamed("PageView", owner: self, options: nil)?.first as! PageView
    //        slide3.imageView.image = UIImage(named: "ic_onboarding_3")
            slide3.labelTitle!.text = "A real-life bear"
            
            let slide4:PageView = Bundle.main.loadNibNamed("PageView", owner: self, options: nil)?.first as! PageView
    //        slide4.imageView.image = UIImage(named: "ic_onboarding_4")
            slide4.labelTitle!.text = "A real-life bear"
            
            
            let slide5:PageView = Bundle.main.loadNibNamed("PageView", owner: self, options: nil)?.first as! PageView
    //        slide5.imageView.image = UIImage(named: "ic_onboarding_5")
            slide5.labelTitle!.text = "A real-life bear"
            
            return [slide1, slide2, slide3, slide4, slide5]
        }


    func setupSlidescrollview(slides : [PageView]) {
//        dependency?.scrollview?.frame = CGRect(x: 0, y: 0, width: (dependency?.view.frame.width)!, height: (dependency?.view.frame.height)!)
        dependency?.scrollview?.contentSize = CGSize(width: (dependency?.scrollview?.frame.width)! * CGFloat(slides.count), height: (dependency?.scrollview?.frame.height)!)
        dependency?.scrollview?.isPagingEnabled = true
        
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: (dependency?.scrollview?.frame.width)! * CGFloat(i), y: 0, width: (dependency?.scrollview?.frame.width)!, height: (dependency?.scrollview?.frame.height)!)
            slides[i].labelTitle?.text = "\(slides[i])"
            slides[i].viewObject?.backgroundColor = .red
            dependency?.scrollview?.addSubview(slides[i])
        }
    }
}
