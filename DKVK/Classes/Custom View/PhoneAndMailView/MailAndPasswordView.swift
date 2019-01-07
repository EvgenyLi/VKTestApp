//
//  PhoneAndMailView.swift
//  DKVK
//
//  Created by Евгений Липадат on 03/01/2019.
//  Copyright © 2019 Евгений Липадат. All rights reserved.
//

import UIKit

final class MailAndPasswordView: UIView {
    
    private let mailView = UITextField()
    private let separator = UIView()
    private let passwordView = UITextField()
    var mailFieldVoid: ItemClouser<String>?
    var passFieldVoid: ItemClouser<String>?

    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        backgroundColor = .white
         mailViewCustomise()
        passwordViewCustomise()
        seporatorViewCustomise()
        addTargets()
    }
    
    private func addTargets() {
        mailView.addTarget(self, action: #selector(mailFieldAction(sender:)), for: .editingChanged)
        passwordView.addTarget(self, action: #selector(passFieldAction(sender:)), for: .editingChanged)
    }
    @objc func mailFieldAction(sender: UITextField) {
        mailFieldVoid?(sender.text ?? "")
    }
    @objc func passFieldAction(sender: UITextField) {
        passFieldVoid?(sender.text ?? "")
        
    }
    
    private func mailViewCustomise() {
        mailView.placeholder = "Email"
        mailView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(mailView)
        mailView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        mailView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        mailView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        mailView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    private func passwordViewCustomise() {
        passwordView.placeholder = "Password"
        passwordView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(passwordView)
        passwordView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        passwordView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        passwordView.topAnchor.constraint(equalTo: mailView.bottomAnchor, constant: 0).isActive = true
        passwordView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    private func seporatorViewCustomise() {
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = #colorLiteral(red: 0.9450980392, green: 0.9450980392, blue: 0.9450980392, alpha: 1)
        addSubview(separator)
        separator.leftAnchor.constraint(equalTo: passwordView.leftAnchor).isActive = true
        separator.rightAnchor.constraint(equalTo: passwordView.rightAnchor).isActive = true
        separator.topAnchor.constraint(equalTo: mailView.bottomAnchor, constant: 0.5).isActive = true
        separator.heightAnchor.constraint(equalToConstant: 0.8).isActive = true
        
    }

}
