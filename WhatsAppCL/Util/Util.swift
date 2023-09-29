//
//  Util.swift
//  WhatsAppCL
//
//  Created by Semih ŞENOL on 12.09.2023.
//

import Foundation
import UIKit

func cornerRadius(for view: UIView) {
    view.layer.cornerRadius = 5
    view.layer.masksToBounds = true
}

//---------------------------------------------------------------------
func isValid(email: String) -> Bool {
    let regex = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    let test = NSPredicate(format: "SELF MATCHES %@", regex)
    let result = test.evaluate(with: email)
    
    return result
}

func isValid(phone: String) -> Bool {
    let regex = "[0-9]{10,}"
    let test = NSPredicate(format: "SELF MATCHES %@", regex)
    let result = test.evaluate(with: phone)
    
    return result
}

//---------------------------------------------------------------------
func showAlert(title: String, message: String, in vc: UIViewController) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
    
    alert.addAction(ok)
    vc.present(alert, animated: true, completion: nil)
}

func instantiateViewController(identifier: String, animated: Bool, by vc: UIViewController, completion: (() -> Void)?) {
    let newViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier)
    
    newViewController.modalPresentationStyle = .fullScreen
    vc.present(newViewController, animated: animated, completion: completion)
}

func imageFromInitials(name: String?, withBlock: @escaping (_ image: UIImage) -> Void) {
    var fullName: String!
    var size = 36
    
    let delimiter = " "
    let token = name!.components(separatedBy: delimiter)
    let firstName = token[0]
    
    var lastName = ""
    if token.count > 1 { lastName = token[1] }
    
    if firstName != "" && lastName != "" {
        fullName = String(firstName.first!).uppercased() + String(lastName.first!).uppercased()
    } else {
        fullName = String(firstName.first!).uppercased()
        size = 72
    }
    
    let lblNameInitialize = UILabel()
    lblNameInitialize.frame.size = CGSize(width: 100, height: 100)
    lblNameInitialize.textColor = .white
    lblNameInitialize.font = UIFont(name: lblNameInitialize.font.fontName, size: CGFloat(size))
    lblNameInitialize.text = fullName
    lblNameInitialize.textAlignment = NSTextAlignment.center
    lblNameInitialize.backgroundColor = UIColor.lightGray
    lblNameInitialize.layer.cornerRadius = 25
    
    UIGraphicsBeginImageContext(lblNameInitialize.frame.size)
    lblNameInitialize.layer.render(in: UIGraphicsGetCurrentContext()!)
    
    let img = UIGraphicsImageRendererContext().currentImage
    UIGraphicsEndImageContext()
    
    withBlock(img)
}

let dateFormat = "ddMMyyyHHmmss"

func dateFormatter() -> DateFormatter {
    let dateFormatter = DateFormatter()
    
    dateFormatter.timeZone = TimeZone(secondsFromGMT: TimeZone.current.secondsFromGMT())
    dateFormatter.dateFormat = dateFormat
    
    return dateFormatter
}
