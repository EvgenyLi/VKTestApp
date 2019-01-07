//
//  BirdsdayTableViewCell.swift
//  DKVK
//
//  Created by Евгений Липадат on 05/01/2019.
//  Copyright © 2019 Евгений Липадат. All rights reserved.
//

import UIKit

class BirdsdayTableViewCell: UITableViewCell, NibLoadable {
    
    let label = UITextField()

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        labelSettings()
    }
    

    private func labelSettings() {
        label.text = "Дата рождения"
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        label.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        label.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
    }
    
}
