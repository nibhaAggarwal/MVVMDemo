//
//  DashboardVC.swift
//  SimpleDemo
//
//  Created by Nibha Aggarwal on 29/10/19.
//  Copyright © 2019 Nibha Aggarwal. All rights reserved.
//

import UIKit

class DashboardVC: UIViewController {
    @IBOutlet weak var tableData: UITableView?
    var objDashViewModel: DashboardViewModel!
    var objLoginModel   : Model?
    
    var arrayData : [AllGroups]? {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.tableData?.delegate = self
                self?.tableData?.dataSource = self
                self?.tableData?.reloadData()
            }
        }
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTableCell()
        AppLoader.showLoader()
        print(objLoginModel)
        objDashViewModel = DashboardViewModel(ref: self, callBack: { [weak self] (modalDashboard) in
            self?.arrayData = modalDashboard.alldetails[0].allGroups
            AppLoader.hideLoader()
        })
        self.objDashViewModel.apiAllDetails()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    //MARK: - Registering TableCell
    private func setTableCell() {
        self.tableData?.register(UINib(nibName: "TableCell", bundle: nil), forCellReuseIdentifier: "TableCell")
    }
}
