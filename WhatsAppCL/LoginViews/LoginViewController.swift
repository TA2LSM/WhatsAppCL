//
//  LoginViewController.swift
//  WhatsAppCL
//
//  Created by Semih ŞENOL on 12.09.2023.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // USER methods
        configureUI()
    }

    private func configureUI() {
        cornerRadius(for: loginButton)
        cornerRadius(for: registerButton)
    }
    
    @IBAction func loginBtnClicked(_ sender: Any) {
        
    }
    
    @IBAction func registerBtnClicked(_ sender: Any) {

    }
    
    // detect background touch when keyboard opened
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
