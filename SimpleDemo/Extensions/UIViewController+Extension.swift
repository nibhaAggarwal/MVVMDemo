//
//  UIViewController+Extension.swift
//  SimpleDemo
//
//  Created by Nibha Aggarwal on 29/10/19.
//  Copyright © 2019 Nibha Aggarwal. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    //MARK: - UIAlertView
    func popUpAlert(title: String?, message: String?, actionTitles: [String], actionStyle: [UIAlertAction.Style], action:[((UIAlertAction) -> Void)]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for (index, title1) in actionTitles.enumerated() {
            let action = UIAlertAction(title: title1, style: actionStyle[index], handler: action[index])
            alert.addAction(action)
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    func alertSimple(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
