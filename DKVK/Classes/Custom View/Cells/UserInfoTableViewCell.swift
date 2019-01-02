//
//  UserInfoTableViewCell.swift
//  DKVK
//
//  Created by Евгений Липадат on 02/01/2019.
//  Copyright © 2019 Евгений Липадат. All rights reserved.
//

import UIKit

class UserInfoTableViewCell: UITableViewCell, StaticCellProtocol {
    
    let photoView = PhotoView()
    
    static var height: CGFloat {
        return 100
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        addPhotoViewConstraints()
    }

    func addPhotoViewConstraints() {
        contentView.addSubview(photoView)
        photoView.translatesAutoresizingMaskIntoConstraints = false
        photoView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        photoView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        photoView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true
        photoView.widthAnchor.constraint(equalToConstant: 67.5).isActive = true
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
