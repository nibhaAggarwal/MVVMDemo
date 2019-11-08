//
//  BarcodeViewController.swift
//  SimpleDemo
//
//  Created by Nibha Aggarwal on 02/11/19.
//  Copyright © 2019 Nibha Aggarwal. All rights reserved.
//

import UIKit

class BarcodeViewController: UIViewController {

    @IBOutlet weak var webview: UIWebView!
    var ul = URL(string: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlReq = URLRequest(url: ul!)
        webview.loadRequest(urlReq)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
