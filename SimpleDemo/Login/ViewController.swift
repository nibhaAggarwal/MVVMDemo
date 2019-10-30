//
//  ViewController.swift
//  SimpleDemo
//
//  Created by Nibha Aggarwal on 25/10/19.
//  Copyright © 2019 Nibha Aggarwal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFieldEmail: UITextField?
    @IBOutlet weak var textFieldPwd  : UITextField?
    
    var objViewModel: LoginViewModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldEmail?.text = "crocapp@gmail.com"
        textFieldPwd?.text = "welcomeca"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        objViewModel = LoginViewModel(ref: self, callBack: { [weak self] (modal) in
//            guard let strongSelf = self else { return }
            
            guard let success = modal.success else { return }
            
            if success == "True" {
                self?.popUpAlert(title: nil, message: "Success.", actionTitles: ["OK", "Cancel"], actionStyle: [.default, .cancel], action: [{ (ok) in
                    print("ok")
                    self?.navigateToDashBoard()
                }, { cancel in
                    print("cancel")
                }])
            }
            else {
                self?.alertSimple(title: nil, message: modal.message ?? "Enter Valid Credentials.")
            }
        })
    }
}


extension ViewController {
    @IBAction func signInButtonAction(_ sender: UIButton) {
        AppLoader.showLoader()
        let email: String = self.textFieldEmail?.text?.trim() ?? "crocapp@gmail.com"
        let pwd: String = self.textFieldPwd?.text?.trim() ?? "welcomeca"
        
        if !email.isEmpty && !pwd.isEmpty {
            
            _ = textFieldShouldReturn(textFieldEmail!)
            _ = textFieldShouldReturn(textFieldPwd!)

            if String.isValidEmail(email: email) && String.isValidPwd(pwd: pwd) {
                AppLoader.hideLoader()
                self.objViewModel.apiLoginApp()
            }
            else {
                self.alertSimple(title: nil, message: "Login Unsuccess.")
            }
        }
        else {
            self.alertSimple(title: nil, message: "Please fill details.")
        }
    }
    
}

extension ViewController {
    private func navigateToDashBoard() {
//        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let objVC = self.storyboard?.instantiateViewController(withIdentifier: "DashboardVC") as! DashboardVC
        objVC.objLoginModel  = objViewModel.loginModel
        self.navigationController?.pushViewController(objVC, animated: true)
    }
}
