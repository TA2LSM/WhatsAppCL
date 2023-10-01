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
    
    // MARK: Register function
    class func registerUserWithEmail(email: String, password: String, fullName:String, avatar: String, phoneNumber: String, countryCode: String, completion: @escaping (_ error: Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (firUser, error) in
            if error != nil {
                completion(error)
                return
            }
            
            let fUser = FUser(objectId: firUser!.user.uid, email: firUser!.user.email!, fullName: fullName, avatar: avatar, phoneNumber: phoneNumber, countryCode: countryCode, isOnline: false, contacts: [""] )
            
            saveUserLocally(fUser: fUser)
            saveUserToFirestore(fUser: fUser)
            completion(error)
        }
    }
    
    // MARK: Logout function
    class func logOutCurrentUser(completion: @escaping (_ success: Bool) -> Void) {
        userDefaults.removeObject(forKey: kCURRENTUSER)
        userDefaults.synchronize()
        
        do {
            try Auth.auth().signOut()
            completion(true)
        } catch let error as NSError {
            completion(false)
            print(error.localizedDescription)
        }
    }
    
    // MARK: Delete user
    class func deleteUser(completion: @escaping (_ error: Error?) -> Void) {
        let user = Auth.auth().currentUser
        
        user?.delete(completion: {(error) in
            completion(error)
        })
    }
}

// MARK: Save user functions
func saveUserToFirestore(fUser: FUser) {
    collectionReference(.User)
        .document(fUser.objectId)
        .setData(userDictionatyFrom(user: fUser) as! [String: Any]) { (error) in
            print("error is \(error?.localizeDescription)")}
}

func saveUserLocally(fUser: FUser) {
    UserDefaults.standard.set(userDictionaryFrom(user: fUser), forKey: kCURRENTUSER)
    UserDefaults.standard.synchronize()
}

// MARK: Fetch user functions
// New firestore
func fetchCurrentUserFromFirestore(userId: String) {
    collectionReference(.User)
        .document(userId)
        .getDocument { (snapshot, error) in
            guard let snapshot = snapshot else { return }
            
            if snapshot.exists {
                UserDefaults.standard.setValue(snapshot.data() as! NSDictionary, forKeyPath: kCURRENTUSER)
                UserDefaults.standard.synchronize()
            }
        }
}

func fetchCurrentUserFromFirestore(userId: String, completion: @escaping (_ user: FUser?) -> Void) {
    collectionReference(.User)
        .document(userId)
        .getDocument { (snapshot, error) in
            guard let snapshot = snapshot else { return }
            
            if snapshot.exists {
                let user = FUser(_dictionary: snapshot.data()! as NSDictionary)
                completion(user)
            } else {
                completion(nil)
            }
        }
    
}

// MARK: Helper functions




//50:52'den devam...
