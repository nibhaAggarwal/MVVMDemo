//
//  TableCell+TableView.swift
//  SimpleDemo
//
//  Created by Nibha Aggarwal on 29/10/19.
//  Copyright © 2019 Nibha Aggarwal. All rights reserved.
//

import UIKit

extension DashboardVC: UITableViewDelegate, UITableViewDataSource {
    /************ TableView Datasources *************/
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let cellCounts = arrayData?.count else {
            return 0
        }
        return cellCounts
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell") as? TableCell
        if let responce = arrayData?[indexPath.row] {
            cell?.setData(response: responce)
        }
        return cell!
    }

    /************ TableView Delegates *************/

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? TableCell
        
        let objVC = self.storyboard?.instantiateViewController(withIdentifier: "DataShowViewController") as! DataShowViewController
        objVC.objElemet = self.arrayData?[indexPath.row]
        self.navigationController?.pushViewController(objVC, animated: true)
    }
}
