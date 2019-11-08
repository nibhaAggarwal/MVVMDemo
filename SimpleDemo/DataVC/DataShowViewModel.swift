//
//  DataShowViewModel.swift
//  SimpleDemo
//
//  Created by Nibha Aggarwal on 06/11/19.
//  Copyright © 2019 Nibha Aggarwal. All rights reserved.
//

import Foundation


class DataShowViewModel : NSObject {
    var dependency: DataShowViewController?
    var completion: (_ model: AllGroups)->()?
//    var objViewModel: AllGroups?
    

    init(ref: DataShowViewController, callBack: @escaping(_ model: AllGroups)->()) {
        dependency = ref
        completion = callBack
    }
    
    func saveChangesOnDashboard(_ model: AllGroups) {
        
        dependency?.objElemet?.groupname = dependency?.textFieldGroupName?.text
        dependency?.objElemet?.groupcode = dependency?.textFieldGroupCode?.text
        dependency?.objElemet?.available = dependency?.textFieldAvailable?.text
        dependency?.objElemet?.total = dependency?.textFieldTotal?.text
        completion(model)
    }
}
