//
//  RegistrModel.swift
//  DKVK
//
//  Created by Евгений Липадат on 05/01/2019.
//  Copyright © 2019 Евгений Липадат. All rights reserved.
//

import UIKit

class RegistrModel {
    var photo: UIImage?
    var email: String?
    var password: String?
    var sex: Sex = .male
    var birdsday: Date?
    var isFilled: Bool {
        guard !(email ?? "").isEmpty, !(password ?? "").isEmpty, birdsday != nil else {
            return false
        }
        return true
    }
    
    var dict: [String: Any] {
        return [
            "email": email ?? "",
            "password": password ?? "",
            "sex": sex == .male ? "Мужчина" : "Женщина",
            "birdsday": (birdsday ?? Date()).timeIntervalSince1970
        ]
    }
    
}
