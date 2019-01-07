//
//  HeaderTitleView.swift
//  DKVK
//
//  Created by Евгений Липадат on 03/01/2019.
//  Copyright © 2019 Евгений Липадат. All rights reserved.
//

import UIKit

final class HeaderTitleView: UIView {
    
    let label = UILabel()

    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        constrains()
        label.text = "Ваш пол:"
        label.textColor = .gray
        backgroundColor = .clear
    }
    
    private func constrains() {
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        label.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
 //       label.topAnchor.constraint(equalTo: topAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

}
