//
//  Label+Extension.swift
//  SimpleDemo
//
//  Created by Nibha Aggarwal on 30/10/19.
//  Copyright © 2019 Nibha Aggarwal. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    //set cornerRadius
//    func cornerRadius(){
//        self.layoutIfNeeded()
//        self.layer.cornerRadius = self.frame.height / 2
//        self.clipsToBounds = true
//    }
    
    //set bordercolor
    func setLayoutOfOutlets(pColor: UIColor, pWidth: CGFloat, pRadius: CGFloat){
        self.layer.borderColor = pColor.cgColor
        self.layer.borderWidth = pWidth
        self.layer.cornerRadius = pRadius
    }
    
//    //set borderWidth
//    func borderWidth(size:CGFloat){
//        self.layer.borderWidth = size
//    }
}
