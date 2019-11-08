//
//  Utilities.swift



import UIKit


//MARK:  Variables
let kAppDelegate = UIApplication.shared.delegate as! AppDelegate
let kUserDefaults = UserDefaults.standard
let kLoader = Loader()

//MARK:  AppName
var applicationName: String {
    let mainBundle = Bundle.main
    let key = String(kCFBundleNameKey)
    let value = mainBundle.object(forInfoDictionaryKey: key) as? String
    return value ?? ""
}


//MARK: User Error (use this when you return custom error in NSError)
let userError = NSError(domain: "apperror", code: -1309, userInfo: ["error": "user generated error"])



//MARK: Functions
func DLog( message: AnyObject, function: String = #function, line: Int = #line, column: Int = #column) {
    #if DEBUG
        print("\(function): \(message), \(#file), \(line), \(column)")
    #endif
    //print("\(function): \(message), \(#file), \(line), \(column)")


}


//MARK:  Swift Guard
func isGuardObject(_ value: Any?) -> Bool {
    guard let _ = value else {
        return false
    }
    return true
}

 
//MARK: Thead Queues
class Utils {
    class func createMainQueue(_ block: @escaping () -> ()) {
        DispatchQueue.main.async { () -> Void in
            block()
        }
    }

    class func createBackGroundQueue(_ block: @escaping () -> ()) {
        let backGroundQueue: DispatchQueue = DispatchQueue(label: "backGroundQueue", attributes: [])
        backGroundQueue.async { () -> Void in
            block()
        }
    }

    class func delay(seconds: Double, completion: @escaping () -> ()) {
        let popTime = DispatchTime.now() + Double(Int64(Double(NSEC_PER_SEC) * seconds)) / Double(NSEC_PER_SEC)

        DispatchQueue.main.asyncAfter(deadline: popTime) {
            completion()
        }
    }
}
