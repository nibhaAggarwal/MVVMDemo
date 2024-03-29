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
    @IBOutlet weak var imageView: UIImageView?
    let iconImage = UIImage()
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
        
//        imageView?.image = iconImage.withRenderingMode(.alwaysTemplate)

        self.setTableCell()
        DispatchQueue.main.async {
            kLoader.showLoader(self.view)
        }
        objDashViewModel = DashboardViewModel(ref: self, callBack: { [weak self] (modalDashboard) in
            DispatchQueue.main.async {
                kLoader.hideLoader(self!.view)
            }
            self?.arrayData = modalDashboard.alldetails[0].allGroups
        })
        self.objDashViewModel.apiAllDetails()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if arrayData?.count ?? 0 > 0{
            self.tableData?.reloadData()
        }
    }
    
    //MARK: - Registering TableCell
    private func setTableCell() {
        self.tableData?.register(UINib(nibName: "TableCell", bundle: nil), forCellReuseIdentifier: "TableCell")
    }
    
    @IBAction func scrollBtnAction(_ sender: UIButton) {
        let objVC = self.storyboard?.instantiateViewController(withIdentifier: "ScrollViewController") as! ScrollViewController
        self.navigationController?.pushViewController(objVC, animated: true)
    }
    
    // MARK: - Dark Mode Support
    private func updateImageForCurrentTraitCollection() {
        if traitCollection.userInterfaceStyle == .dark {
//            imageView.image = originalImage?.invertedColors()
        } else {
//            imageView.image = originalImage
        }
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updateImageForCurrentTraitCollection()
    }
    
}
