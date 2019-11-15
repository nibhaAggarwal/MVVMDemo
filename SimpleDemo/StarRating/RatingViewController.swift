//
//  ViewController.swift
//  StarRating
//
//  Created by Vivek Gupta on 12/03/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var starMainControl: StarMainControl!
    @IBOutlet weak var starControlHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var starRating1: StarRatingView!
    @IBOutlet weak var starRatingView2: StarRatingView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       // star.loadNib()
       
        
//        starMainControl.actionsCreated = {[weak self] in
//            guard let slf = self else {
//                return
//            }
//            let alertWindow = UIWindow(frame: UIScreen.main.bounds)
//            alertWindow.rootViewController = UIViewController()
//            alertWindow.windowLevel = UIWindowLevelAlert + 1;
//            alertWindow.makeKeyAndVisible()
//            alertWindow.rootViewController?.present(slf.starMainControl.alertController, animated: true, completion: nil)
//        }
        //starRatingView2.isHidden = true
        
        starMainControl.starMainControlDelegate = self
        
        starMainControl.actions = ["Not Now" , "Cancel", "Later","Rate Now"]
        starControlHeightConstraint.constant = 520
        
        starMainControl.cancelButton.setTitle("Cancel", for: .normal)
        starMainControl.rateNowButton.setTitle("Rate Now", for: .normal)
        starRatingView2.ratingWillBeSetFromOutSide = 4.3
        starRating1.ratingWillBeSetFromOutSide = 2.7
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: StarMainControlDelegate{
    func buttonClicked(with tag: Int, buttonText: String?, ratePoints: Float?) {
        let txt = buttonText != nil ? buttonText! : "not sent from delegate"
        let pts = ratePoints != nil ? ratePoints! : 0.0
        let alert = UIAlertController(title: "Wow the rating is \(pts)/5.0", message: "You had clicked button with tag \(tag) and button text is '\(txt)'", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel) { (alertAction) in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okAction)
        self.show(alert, sender: self)
    }
    
    
    
    
}

