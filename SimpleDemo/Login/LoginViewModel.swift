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
                Loader().hideLoader(self.dependency!.view)
            }
            guard response != nil else {
                Loader().hideLoader(self.dependency!.view)
                return
            }
            Loader().hideLoader(self.dependency!.view)
            if let usuableData = data {
                Utils.createMainQueue {
                    let decoder = JSONDecoder()
                    self.loginModel = try! decoder.decode(Model.self, from: usuableData)
                    print(self.loginModel)
                    self.saveUserTable(model: self.loginModel)
                    self.fetchAllData()
                    self.completion(self.loginModel)
                }
            }
        }
    }
    //MARK: - Save Table
    private func saveUserTable(model: Model) {
        let data: [[String: Any]] = [["email": model.username!, "fname": model.fname!, "lname": model.lname!, "graderId": model.graderid!, "password":dependency?.textFieldPwd?.text! ?? ""]]
        CoreDataMethods.insertRecords(entity: "UserTable", attributeKey: nil, objectToSave: data)
    }
    
    //MARK: - Fetch From Table
    private func fetchAllData() {
        CoreDataMethods.fetchAllData(entityName: "UserTable") { (array) in
//            print(array!)
        }
    }
}
