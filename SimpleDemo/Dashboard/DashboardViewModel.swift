//
//  DashboardViewModel.swift
//  SimpleDemo
//
//  Created by Nibha Aggarwal on 29/10/19.
//  Copyright © 2019 Nibha Aggarwal. All rights reserved.
//

import Foundation

class DashboardViewModel: NSObject {
    
    var allDataModel : AllDataModel?
    var dependency : DashboardVC?
    
    var completion: (_ mObject: AllDataModel) -> ()?
    
    init(ref: DashboardVC, callBack: @escaping(_ mObject: AllDataModel)->()){
        dependency = ref
        completion = callBack
    }
    
    
    func apiAllDetails() {
        APIManager.createRequest(qMes: Constants.BaseURL+MethodName.alldetails.rawValue, method: HTTPMethod.get.rawValue) { (data, response, error) in
            if error != nil {
                kLoader.hideLoader(self.dependency!.view)
            }
            guard response != nil else {
                kLoader.hideLoader(self.dependency!.view)
                return
            }
//            Utils.createBackGroundQueue {
//                kLoader.hideLoader(self.dependency!.view)
//            }
            
            if let usuableData = data {
                let decoder = JSONDecoder()
                
                self.allDataModel = try! decoder.decode(AllDataModel.self, from: usuableData)
                print(self.allDataModel?.alldetails[0].allGroups)
                self.saveGroupTable(model: self.allDataModel?.alldetails[0].allGroups)
                self.completion(self.allDataModel!)
            }
        }
    }
    
    
    //MARK: - Save Table
    private func saveGroupTable(model: [AllGroups]?) {
        var data = [[String:Any]]()
        for i in 0..<model!.count {
            data.append(["groupname": model![i].groupname!, "groupcode": model![i].groupcode!, "total": model![i].total!, "available": model![i].available!])
        }
        CoreDataMethods.insertRecords(entity: "GroupTable", attributeKey: nil, objectToSave: data)
    }
}
