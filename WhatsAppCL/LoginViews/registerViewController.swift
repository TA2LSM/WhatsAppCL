//
//  registerViewController.swift
//  WhatsAppCL
//
//  Created by Semih ŞENOL on 12.09.2023.
//

import UIKit

class registerViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var countryCodeTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var finishBtn: UIButton!
    @IBOutlet var profileImageGestureRecognizer: UITapGestureRecognizer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        
        profileImageGestureRecognizer.addTarget(self, action: #selector(self.profileImageClicked))
        
        profileImageView.isUserInteractionEnabled = true
        profileImageView.addGestureRecognizer(profileImageGestureRecognizer)
    }
    
    private func configureUI() {
        cornerRadius(for: finishBtn)
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
        profileImageView.clipsToBounds = true
    }
    
    private func validateFields(name: String, email: String, password: String, countryCode: String, phoneNumber: String) -> Bool {
        if isValid(email: email) && name != "" && isValid(phone: phoneNumber) && password.count >= 6 && countryCode != "" {
            return true
        }
        
        return false
    }
    
    
    @IBAction func cancelBtnClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func finishBtnClicked(_ sender: Any) {
    }
    
    @objc func profileImageClicked() {
        
    }
}
