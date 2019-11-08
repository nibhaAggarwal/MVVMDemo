//
//  AppLoader.swift


import Foundation
import UIKit

class Loader {
    
    var container: UIView = UIView()
    var loadingView: UIView = UIView()
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()

    /*
        Show customized activity indicator,
        actually add activity indicator to passing view
    
        @param uiView - add activity indicator to this view
    */
    func showLoader(_ uiView: UIView) {
        container.frame = uiView.frame
        container.center = uiView.center
        container.backgroundColor = UIColorFromHex(rgbValue: 0xffffff, alpha: 0.3)
    
        loadingView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        loadingView.center = uiView.center
        loadingView.backgroundColor = UIColorFromHex(rgbValue: 0x444444, alpha: 0.7)
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
    
        activityIndicator.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0);
        activityIndicator.style = .large
        activityIndicator.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2);

        loadingView.addSubview(activityIndicator)
        container.addSubview(loadingView)
        uiView.addSubview(container)
        activityIndicator.startAnimating()
    }

    /*
        Hide activity indicator
        Actually remove activity indicator from its super view
    
        @param uiView - remove activity indicator from this view
    */
    func hideLoader(_ uiView: UIView) {
        activityIndicator.stopAnimating()
        container.removeFromSuperview()
    }

    /*
        Define UIColor from hex value
        
        @param rgbValue - hex color value
        @param alpha - transparency level
    */
    func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
    
}

//MARK: - Not Working
class AppLoader {

    class func setConfig() {
        var config: SwiftLoader.Config = SwiftLoader.Config()
        config.size = 100
        config.backgroundColor = UIColor.black
        let appTheamColor = UIColor(red: 48.0 / 255.0, green: 160 / 255, blue: 254.0 / 255.0, alpha: 1)
        config.spinnerColor = appTheamColor
        config.titleTextColor = UIColor.red
        config.spinnerLineWidth = 2.0
        config.foregroundColor = UIColor.black
        config.foregroundAlpha = 0.5
        SwiftLoader.setConfig(config)
    }

    class func showLoader() {
        SwiftLoader.hide()
//        UIApplication.shared.endIgnoringInteractionEvents()
//        UIApplication.shared.beginIgnoringInteractionEvents()
        Utils.delay(seconds: 0.2) { () -> () in
            AppLoader.setConfig()
            SwiftLoader.show(animated: true)
        }
    }

    class func hideLoader() {
        DispatchQueue.main.async {
//            UIApplication.shared.endIgnoringInteractionEvents()
            Utils.delay(seconds: 0.2) { () -> () in
                SwiftLoader.hide()
            }
        }
    }

    class func showLoaderWithoutBlockUI() {
        DispatchQueue.main.async {
            Utils.delay(seconds: 0.2) { () -> () in
                AppLoader.setConfig()
                SwiftLoader.show(animated: true)
            }
        }
    }

}
