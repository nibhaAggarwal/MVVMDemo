//
//  LoginViewModel.swift
//  SimpleDemo
//
//  Created by Nibha Aggarwal on 26/10/19.
//  Copyright © 2019 Nibha Aggarwal. All rights reserved.
//

import UIKit

class LoginViewModel: NSObject {
    
    var loginModel = Model()
    var dependency  : ViewController?
    
    /********** Creating Closure**********/
    var completion: (_ modal: Model) -> ()?
    init(ref: ViewController, callBack: @escaping (_ modal: Model)->()) {
        dependency = ref
        completion = callBack
    }
    
    
    /*
     private func getParams(_ dic: NSMutableDictionary)->[String:Any]{
         do {
             let jsonData = try JSONSerialization.data(withJSONObject: dic, options: .prettyPrinted)
             let decoded = try JSONSerialization.jsonObject(with: jsonData, options: [])
             if let dictFromJSON = decoded as? [String: Any] {
                 return dictFromJSON
             }
         } catch {
             print(error.localizedDescription)
         }
         return [:]
     }
     */
    
    
    private func getParams() -> [String: Any] {
        return ["email": dependency?.textFieldEmail?.text ?? "crocapp@gmail.com",
                "pwd": dependency?.textFieldPwd?.text ?? "welcomeca"]
    }
    
    
    func apiLoginApp() {
        APIManager.createRequest(qMes: (URL(string: Constants.API.resetAlbum+MethodName.login.rawValue)?.appendingQueryItems(getParams()))!, method: HTTPMethod.get.rawValue) { (data, response, error) in
            if error != nil {
                AppLoader.hideLoader()
            }
            guard response != nil else {
                AppLoader.hideLoader()
                return
            }
            AppLoader.hideLoader()
            if let usuableData = data {
                Utils.createMainQueue {
                    let decoder = JSONDecoder()
                    self.loginModel = try! decoder.decode(Model.self, from: usuableData)
                    print(self.loginModel)
                    self.completion(self.loginModel)
                }
            }
        }
    }
}
