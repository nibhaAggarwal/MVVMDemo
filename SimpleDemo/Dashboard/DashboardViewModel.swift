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
                AppLoader.hideLoader()
            }
            guard response != nil else {
                AppLoader.hideLoader()
                return
            }
            AppLoader.hideLoader()
            if let usuableData = data {
                let decoder = JSONDecoder()
                AppLoader.showLoader()
                self.allDataModel = try! decoder.decode(AllDataModel.self, from: usuableData)
                self.completion(self.allDataModel!)
            }
        }
    }
}
