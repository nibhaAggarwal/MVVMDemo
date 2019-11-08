//
//  ViewController.swift
//  SimpleDemo
//
//  Created by Nibha Aggarwal on 25/10/19.
//  Copyright © 2019 Nibha Aggarwal. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {

    @IBOutlet weak var textFieldEmail: UITextField?
    @IBOutlet weak var textFieldPwd  : UITextField?
    var objViewModel: LoginViewModel!

    //******//
    @IBOutlet weak var successLabel  : UILabel!
    var objBioViewModel: BiometricViewModel?
    //******//
    
    
    //******//
    @IBOutlet weak var videoPreview: UIView!
    var stringURL = String()
    
    enum error: Error {
        case noCamera
        case videoInputInitFail
    }
    //*****//
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldEmail?.text = "crocapp@gmail.com"
        textFieldPwd?.text = "welcomeca"
        
        do {
            try scanQRCode()
        }catch {
            print("Failed to scan QRCode")
        }
        
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

//MARK: - ViewController Actions
extension ViewController {
    @IBAction func signInButtonAction(_ sender: UIButton) {
        kLoader.showLoader(self.view)
        let email: String = self.textFieldEmail?.text?.trim() ?? "crocapp@gmail.com"
        let pwd: String = self.textFieldPwd?.text?.trim() ?? "welcomeca"
        
        if !email.isEmpty && !pwd.isEmpty {
            _ = textFieldShouldReturn(textFieldEmail!)
            _ = textFieldShouldReturn(textFieldPwd!)
            
            if String.isValidEmail(email: email) && String.isValidPwd(pwd: pwd) {
                self.objViewModel.apiLoginApp()
            }
            else {
                kLoader.hideLoader(self.view)
                self.alertSimple(title: nil, message: "Login Unsuccess.")
            }
        }
        else {
            kLoader.hideLoader(self.view)
            self.alertSimple(title: nil, message: "Please fill details.")
        }
    }
    
    
    //MARK: - Touch ID
    @IBAction func touchIdAction(_ sender: UIButton) {
        objBioViewModel = BiometricViewModel(ref: self, callback: calBackAuth(str:))
        objBioViewModel?.localAuthentication()
    }
    
    private func calBackAuth(str:String){
        self.successLabel.text = str
    }
    
    //MARK: - CAMERA
    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection) {
        if metadataObjects.count > 0 {
            let machineReadableCode = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
            if machineReadableCode.type == AVMetadataObject.ObjectType.qr {
                stringURL = machineReadableCode.stringValue!
                performSegue(withIdentifier: "openLink", sender: self)
            }
        }
    }
    
    
    func scanQRCode() throws {
        let avCaptureSession = AVCaptureSession()
        guard let avcaptureDevice = AVCaptureDevice.default(for: AVMediaType.video) else {
            print("no camera")
            throw error.noCamera
        }
        guard let avCaptureinput = try? AVCaptureDeviceInput(device: avcaptureDevice) else {
            print("Failted to intii camera")
            throw error.videoInputInitFail
        }
        
        let avCaptureMetaDataOutput = AVCaptureMetadataOutput()
        avCaptureMetaDataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        
        avCaptureSession.addInput(avCaptureinput)
        avCaptureSession.addOutput(avCaptureMetaDataOutput)
        
        avCaptureMetaDataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        
        let avCaptureVideoPriviewLayer = AVCaptureVideoPreviewLayer(session: avCaptureSession)
        avCaptureVideoPriviewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        avCaptureVideoPriviewLayer.frame = videoPreview.bounds
        self.videoPreview.layer.addSublayer(avCaptureVideoPriviewLayer)
        
        avCaptureSession.startRunning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "openLink" {
            let destination = segue.destination as! BarcodeViewController
            destination.ul = URL(string: stringURL)
        }
    }
}

//MARK: - ViewController Navigate
extension ViewController {
    private func navigateToDashBoard() {
//        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let objVC = self.storyboard?.instantiateViewController(withIdentifier: "DashboardVC") as! DashboardVC
        objVC.objLoginModel  = objViewModel.loginModel
        self.navigationController?.pushViewController(objVC, animated: true)
    }
}
