

import Foundation
import UIKit


//MARK:- API END POINTS
enum MethodName: String {
    case contact = "/contacts.json"
    case missingPP = "/images/missing.png"
    case detailContact = "/contacts"
    case extUrl = ".json"
    case login      = "users/apilogin.php?"
    case alldetails = "singlepen/alldata.php?"
}

//MARK:- CONSTANTS
struct Constants {
    static let BaseURL = Constants.apiBaseURL()
    static let appName = "CrocDemo"
    static let ok = "Ok"
    
    static func apiBaseURL() -> String {
        return ConfigurationManager.sharedManager.APIEndpoint()
    }
    
//    //MARK:- StoryBoards
//    struct StoryBoard {
//        static let MainStoryboard           = "Main"
//        static let UserTabBarStoryboard     = "Tabbar"
//    }
    
    //MARK:- API Urls
    struct API {
        static let resetAlbum                 = BaseURL
        static func apiURL(_ methodName: String) -> String {
            return BaseURL + methodName
        }
        
    }
    
    
//    struct methodName {
//        static let contact = "/contacts.json"
//        static let missingPP = "/images/missing.png"
//        static let detailContact = "/contacts"
//        static let extUrl = ".json"
//    }
    
    //MARK:- Data Limits For API Call
    struct dataLimits {
        static let page =  "1"
        static let limit =  "50"
        static let oauth_consumer_key =  "nt416zygfd0o6h2gabjv2qy4nj0wcdyo"
        static let ios =  "1"
        static let language =  "en"
        static let oauth_consumer_secret =  "f2ax3r6yzki9yiiby7g0v4rlbnl16dio"
        static let _IOS_VERSION =  "2.1.6"
    }
    
    //MARK:- Server Keys
    struct ServerKey {
        static let page = "page"
        static let limit = "limit"
        static let oauth_consumer_key = "oauth_consumer_key"
        static let ios = "ios"
        static let language = "language"
        static let oauth_consumer_secret = "oauth_consumer_secret"
        static let _IOS_VERSION = "_IOS_VERSION"
        
    }
    
    //MARK:- SETTING COLOR CODE
    struct Colors {
        static var lightPurple = UIColor(red:90/255, green: 50/255, blue: 120/255, alpha: 1)
        static var darkPurple = UIColor(red:70/255, green: 38/255, blue: 92/255, alpha: 1)
        static var white = UIColor(red:255/255, green: 255/255, blue: 255/255, alpha: 1)
    }
    
    //MARK:- Button Title
    struct AppColorHexCode {
        static let appThemeColor        = "FFFFFF"
        static let appThemeColorLight   = "cbb398"
        static let imageDetail          = "FFFFFF"
        static let Edit                 = "50E3C2"
        static let textlabel            = "4A4A4A"
        
    }
}
