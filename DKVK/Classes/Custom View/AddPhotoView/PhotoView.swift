//
//  PhotoView.swift
//  DKVK
//
//  Created by Евгений Липадат on 02/01/2019.
//  Copyright © 2019 Евгений Липадат. All rights reserved.
//

import UIKit

final class PhotoView: UIView {
    
    private let stackView = UIStackView()
    private let plusView = UIImageView()
    private let label = UILabel()

    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        addStackViewConstrains()
        plusViewCustomise()
        labelCustomise()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        Decorator.layoutSubViews(self)
    }
    
    private func plusViewCustomise() {
        plusView.translatesAutoresizingMaskIntoConstraints = false
        plusView.contentMode = .scaleAspectFit
        plusView.tintColor = #colorLiteral(red: 0.2980392157, green: 0.4588235294, blue: 0.6392156863, alpha: 1)
        plusView.image = UIImage(named: "add")
        stackView.addArrangedSubview(plusView)
    }
    private func labelCustomise() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "фото"
        label.textColor = #colorLiteral(red: 0.2980392157, green: 0.4588235294, blue: 0.6392156863, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 9)
        stackView.addArrangedSubview(label)
    }
    
    private func addStackViewConstrains() {
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
}

extension PhotoView{
    fileprivate class Decorator {
        static func decorate(_ view: PhotoView) {
            view.layer.borderColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
            view.layer.borderWidth = 1
        }
        static func layoutSubViews(_ view: PhotoView) {
            view.round()
        }
    }
}
