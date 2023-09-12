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

