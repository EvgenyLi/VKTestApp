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
    let mailAndPasswordView = MailAndPasswordView()
    
    static var height: CGFloat {
        return 100
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        addPhotoViewConstraints()
        mailAndPasswordViewCustomise()
        contentView.backgroundColor = #colorLiteral(red: 0.9450980392, green: 0.9450980392, blue: 0.9450980392, alpha: 1)
        layer.borderColor = #colorLiteral(red: 0.9450980392, green: 0.9450980392, blue: 0.9450980392, alpha: 1)
        layer.borderWidth = 0.5
        selectionStyle = .none
    }

   private func addPhotoViewConstraints() {
        contentView.addSubview(photoView)
        photoView.translatesAutoresizingMaskIntoConstraints = false
        photoView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        photoView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        photoView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true
        photoView.widthAnchor.constraint(equalToConstant: 67.5).isActive = true
        
    }
    
    private func mailAndPasswordViewCustomise() {
        contentView.addSubview(mailAndPasswordView)
        mailAndPasswordView.translatesAutoresizingMaskIntoConstraints = false
        mailAndPasswordView.leftAnchor.constraint(equalTo: photoView.rightAnchor, constant: 16).isActive = true
        mailAndPasswordView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        mailAndPasswordView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        mailAndPasswordView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
    }
    
}
