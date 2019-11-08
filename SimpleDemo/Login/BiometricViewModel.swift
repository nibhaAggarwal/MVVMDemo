//
//  BiometricViewModel.swift
//  SimpleDemo
//
//  Created by Nibha Aggarwal on 01/11/19.
//  Copyright © 2019 Nibha Aggarwal. All rights reserved.
//

import Foundation
import LocalAuthentication

class BiometricViewModel: NSObject {
    
    var depency: ViewController?
    
    var completion: (_ str: String)->()?
    
    init(ref: ViewController, callback: @escaping(_ str: String)->()) {
        depency = ref
        completion = callback
//        super.init()
        
    }
    
    func localAuthentication() {
        
        print("hello there!.. You have clicked the touch ID")
        
        let myContext = LAContext()
        let myLocalizedReasonString = "Biometric Authntication testing !! "
        
        var authError: NSError?
        if #available(iOS 8.0, macOS 10.12.1, *) {
            if myContext.canEvaluatePolicy(.deviceOwnerAuthentication, error: &authError) {
                myContext.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: myLocalizedReasonString) { success, evaluateError in
                    
                    DispatchQueue.main.async {
                        if success {
                            // User authenticated successfully, take appropriate action
                            self.completion("Awesome!!... User authenticated successfully")
                        } else {
                            // User did not authenticate successfully, look at error and take appropriate action
                            self.completion("Sorry!!... User did not authenticate successfully")
                        }
                    }
                }
            } else {
                // Could not evaluate policy; look at authError and present an appropriate message to user
                self.completion("Sorry!!.. Could not evaluate policy.")
            }
        } else {
            // Fallback on earlier versions
            self.completion("Ooops!!.. This feature is not supported.")
        }
    }
}
