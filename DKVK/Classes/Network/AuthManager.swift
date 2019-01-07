//
//  AuchManager.swift
//  DKVK
//
//  Created by Евгений Липадат on 06/01/2019.
//  Copyright © 2019 Евгений Липадат. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseStorage
import FirebaseAuth

class AuthManager {
    static let shared = AuthManager()
    private init() {}
    
    private var sourceRef: DatabaseReference {
        return Database.database().reference()
    }
    private let auth = Auth.auth()
    
    func register(with model: RegistrModel, completion: (()->Void)) {
        guard model.isFilled else {return}
        
        guard let email = model.email, let password = model.password else { return }
        let userRef = sourceRef.child("users")
        let id = UUID().uuidString
        var dict = model.dict
        dict["id"] = id
        auth.createUser(withEmail: email, password: password) { (result, error) in
            userRef.child(id).setValue(dict)
        }
    }
}
