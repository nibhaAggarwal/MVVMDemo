//
//  UIImage+Extension.swift
//  SimpleDemo
//
//  Created by Nibha Aggarwal on 31/10/19.
//  Copyright © 2019 Nibha Aggarwal. All rights reserved.
//

import Foundation
import UIKit


extension UIImage {
    /// Inverts the colors from the current image. Black turns white, white turns black etc.
    func invertedColors() -> UIImage? {
        guard let ciImage = CIImage(image: self) ?? ciImage, let filter = CIFilter(name: "CIColorInvert") else { return nil }
        filter.setValue(ciImage, forKey: kCIInputImageKey)

        guard let outputImage = filter.outputImage else { return nil }
        return UIImage(ciImage: outputImage)
    }
}


//
//extension MBProgressHUD {
//    func showHUD()
//    {
//        if let app = UIApplication.shared.delegate as? AppDelegate, let window = app.window {
//            let loadingNotification = MBProgressHUD.showAdded(to: window, animated: true)
//                   loadingNotification.mode = MBProgressHUDMode.indeterminate
//                   loadingNotification.isUserInteractionEnabled = true
//                   loadingNotification.label.text = "Loading"
//        }
//       
//    }
//    
//    func showHudOffline() {
//        if let app = UIApplication.shared.delegate as? AppDelegate, let window = app.window {
//            let loadingNotification = MBProgressHUD.showAdded(to: window, animated: true)
//            loadingNotification.mode = MBProgressHUDMode.indeterminate
//            loadingNotification.label.text = "Data Saving\n Please Wait..."
//        }
//        
//    }
//    
//    func removeHUD() {
//        if let app = UIApplication.shared.delegate as? AppDelegate, let window = app.window {
//            MBProgressHUD.hide(for: window, animated: true)
//        }
//    }
//}

