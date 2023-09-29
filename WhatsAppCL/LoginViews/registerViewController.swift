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
    
    var avatarString = ""
    
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
    
    // detect background touch when keyboard opened
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @objc func profileImageClicked() {
        showActionSheet()
    }
    
    func showActionSheet() {
        // declaring action sheet
        let sheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        // declaring library button
        let library = UIAlertAction(title: "Photo Library", style: .default) { (action) in
                // checking availability of photo library
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                self.showPicker(with: .photoLibrary)
            }
        }
        
        // declaring cancel button
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        // adding buttons to the sheet
        sheet.addAction(library)
        sheet.addAction(cancel)
        
        // present action sheet to the user
        self.present(sheet, animated: true, completion: nil)
    }
    
    func showPicker(with source: UIImagePickerController.SourceType) {
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = source
        
        present(picker, animated: true, completion: nil)
    }
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey(rawValue: convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.editedImage))] as? UIImage
        
        let picturePath = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        
        // assign selected picture to profileImageView
        self.profileImageView.image = picturePath
        
        let pictureData = image?.jpegData(compressionQuality: 0.4)!
        avatarString = (pictureData?.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0)))!
        
        dismiss(animated: true, completion: nil)
    }
    
    private func getAvatar() -> String {
        if avatarString == "" {
            var avatarStr = ""
            
            imageFromInitials(name: nameTextField.text!) { (avatarInitials) in
                let avatarImg = avatarInitials.jpegData(compressionQuality: 0.7)
                avatarStr = avatarImg!.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
            }
            
            return avatarStr
        } else {
            return avatarString
        }
    }
}

fileprivate func convertFromUIImagePickerControllerInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
    return input.rawValue
}
