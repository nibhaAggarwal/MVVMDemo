//
//  DataShowViewController.swift
//  SimpleDemo
//
//  Created by Nibha Aggarwal on 05/11/19.
//  Copyright © 2019 Nibha Aggarwal. All rights reserved.
//

import UIKit

class DataShowViewController: UIViewController {
    @IBOutlet weak var textFieldGroupName: UITextField?
    @IBOutlet weak var textFieldGroupCode: UITextField?
    @IBOutlet weak var textFieldAvailable: UITextField?
    @IBOutlet weak var textFieldTotal: UITextField?
    @IBOutlet weak var textFieldDate: UITextField?
    
    var objElemet : AllGroups?
    var objDataViewModel: DataShowViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(objElemet)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.updateUI()
    }
}


extension DataShowViewController {
    @IBAction func saveChangesButton(_ sender: UIButton) {
        objDataViewModel = DataShowViewModel(ref: self, callBack: { [weak self](model) in
            print(model)
            self?.navigationController?.popViewController(animated: true)
        })
        objDataViewModel?.saveChangesOnDashboard(objElemet!)
    }
    
    func updateUI() {
        textFieldGroupName?.text = objElemet?.groupname
        textFieldGroupCode?.text = objElemet?.groupcode
        textFieldAvailable?.text = objElemet?.available
        textFieldTotal?.text = objElemet?.total
        
    }
}
