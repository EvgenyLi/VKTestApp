//
//  ViewController.swift
//  DKVK
//
//  Created by Евгений Липадат on 01/01/2019.
//  Copyright © 2019 Евгений Липадат. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loginInButton: UIButton!
    @IBOutlet weak var registrationButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        Decorator.decorate(self)
        addTargets()
    }
    
    private func addTargets() {
        loginInButton.addTarget(self, action: #selector(signInAction), for: .touchUpInside)
        registrationButton.addTarget(self, action: #selector(signUpAction), for: .touchUpInside)
    }
    
    @objc private func signInAction() {
        
    }
    @objc private func signUpAction() {
        
    }


}


extension ViewController {
    fileprivate class Decorator {
        private init() {}
        static func decorate(_ vc: ViewController) {
            vc.loginInButton.layer.cornerRadius = 10
        }
    }
}

