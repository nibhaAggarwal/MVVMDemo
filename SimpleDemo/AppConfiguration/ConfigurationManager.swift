//
//  ConfigurationManager.swift
//  SimpleDemo
//
//  Created by Nibha Aggarwal on 25/10/19.
//  Copyright © 2019 Nibha Aggarwal. All rights reserved.
//

import UIKit

enum ConfigurationKeys: String {
    case kEnvironmentsPlist = "Environments"
    case kConfigurationKey  = "ActiveConfiguration"
    case kAPIEndpointKey    = "APIEndPoint"
}

class ConfigurationManager: NSObject {
    var environment: NSDictionary?
    
    //Singleton Method
    static let sharedManager: ConfigurationManager = {
        let instance = ConfigurationManager()
        // setup code
        return instance
    }()
    
    override init() {
        super.init()
        initialize()
    }
    
    private func initialize() {
        var envir: NSDictionary?
        if let environPlistPath = Bundle.main.path(forResource: ConfigurationKeys.kEnvironmentsPlist.rawValue, ofType: "plist") {
            envir = NSDictionary(contentsOfFile: environPlistPath)
        }
        self.environment = envir!.object(forKey: currentConfiguration()) as? NSDictionary
        if self.environment == nil {
            assertionFailure(NSLocalizedString("Unable to load application configuration", comment: "Unable to load application configuration"))
        }
    }
    
    // currentConfiguration
    private func currentConfiguration () -> String   {
        let configuration = Bundle.main.infoDictionary?[ConfigurationKeys.kConfigurationKey.rawValue] as? String
        return configuration!
    }
    
    // APIEndpoint
    func APIEndpoint () -> String  {
        let configuration = self.environment![ConfigurationKeys.kAPIEndpointKey.rawValue]
        return configuration as! String
    }
}
