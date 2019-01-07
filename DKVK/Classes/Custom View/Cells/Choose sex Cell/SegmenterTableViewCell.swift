//
//  SegmenterTableViewCell.swift
//  DKVK
//
//  Created by Евгений Липадат on 03/01/2019.
//  Copyright © 2019 Евгений Липадат. All rights reserved.
//

import UIKit

class SegmenterTableViewCell: UITableViewCell, NibLoadable {
    
    var segmentedControl: UISegmentedControl!

    var segmentedIndex: ItemClouser<Int>?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        segmentedControlSettings()
        selectionStyle = .none
    }
    
    private func segmentedControlSettings() {
        let items = ["Мужчина", "Женщина"]
        segmentedControl = UISegmentedControl(items: items)
        segmentedControl.tintColor = .lightGray
        segmentedControl.addTarget(self, action: #selector(selector(sender:)), for: .valueChanged)
        contentView.addSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8).isActive = true
        segmentedControl.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        segmentedControl.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8).isActive = true
        
    }
    
    @objc private func selector(sender: UISegmentedControl) {
        segmentedIndex?(sender.selectedSegmentIndex)
    }
    
}

