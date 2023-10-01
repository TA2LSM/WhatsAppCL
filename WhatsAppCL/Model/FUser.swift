//
//  FUser.swift
//  WhatsAppCL
//
//  Created by Semih ŞENOL on 1.10.2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class FUser {
    let objectId: String
    var email: String
    var fullName: String
    var avatar: String
    var phoneNumber: String
    var countryCode: String
    var isOnline: Bool
    var contacts: [String]
    
    init(objectId: String, email: String, fullName: String, avatar: String, phoneNumber: String, countryCode: String, isOnline: Bool, contacts: [String]) {
        self.objectId = objectId
        self.email = email
        self.fullName = fullName
        self.avatar = avatar
        self.phoneNumber = phoneNumber
        self.countryCode = countryCode
        self.isOnline = isOnline
        self.contacts = contacts
    }
    
    init(_dictionary: NSDictionary) {
        objectId = _dictionary[kOBJECTID] as! String
        
        if let mail = _dictionary[kEMAIL] {
            email = mail as! String
        } else {
            email = ""
        }
        
        if let fname = _dictionary[kFULLNAME] {
            fullName = fname as! String
        } else {
            fullName = ""
        }
        
        if let avat = _dictionary[kAVATAR] {
            avatar = avat as! String
        } else {
            avatar = ""
        }
        
        if let isOn = _dictionary[kISONLINE] {
            isOnline = isOn as! Bool
        } else {
            isOnline = false
        }
        
        if let phoneNum = _dictionary[kPHONE] {
            phoneNumber = phoneNum as! String
        } else {
            phoneNumber = ""
        }
        
        if let coCode = _dictionary[kCOUNTRYCODE] {
            countryCode = coCode as! String
        } else {
            countryCode = ""
        }
        
        if let cont = _dictionary[kCONTACT] {
            contacts = cont as! [String]
        } else {
            contacts = []
        }
    }
    

    // MARK: Returning current user  funcs
    class func currentId() -> String {
        return Auth.auth().currentUser!.uid
    }
    
    class func currentUser() -> FUser? {
        if Auth.auth().currentUser != nil {
            if let dictionary = UserDefaults.standard.object(forKey: kCURRENTUSER) {
                return FUser.init(_dictionary: dictionary as! NSDictionary)
            }
        }
        
        return nil
    }
    
    // MARK: Login function
    class func loginUserWithEmail(email: String, password: String, completion: @escaping (_ error: Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password, completion: { (firUser, error) in
            if error != nil {
                completion(error)
                return
            } else {
                // get user from frebase
                fetchCurrentUserFromFirestore(userId: firUser!.user.uid)
                completion(error)
            }
        })
    }
    
    //49:57'den devam...
}
