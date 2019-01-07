//
//  PhotoView.swift
//  DKVK
//
//  Created by Евгений Липадат on 02/01/2019.
//  Copyright © 2019 Евгений Липадат. All rights reserved.
//

import UIKit

final class PhotoView: UIView {
    
    private let plusView = UIImageView()
    private let label = UILabel()
    private var imageView = UIImageView()
    var clicked: (() -> Void)?

    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        backgroundColor = .white
        plusViewCustomise()
        labelCustomise()
        addImageView()
    }
    
    func set(image: UIImage?) {
        self.imageView.image = image
        imageView.isHidden = image == nil
    }
    
    private func addImageView() {
        imageView.contentMode = .scaleAspectFill
        imageView.isHidden = true
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        imageView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        clicked?()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        Decorator.layoutSubViews(self)
        Decorator.decorate(self)
    }
    
    private func plusViewCustomise() {
        plusView.translatesAutoresizingMaskIntoConstraints = false
        plusView.contentMode = .scaleAspectFit
        plusView.tintColor = #colorLiteral(red: 0.2980392157, green: 0.4588235294, blue: 0.6392156863, alpha: 1)
        plusView.image = UIImage(named: "add")
        addSubview(plusView)
        
        plusView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        plusView.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        plusView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        plusView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
    }
    private func labelCustomise() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "фото"
        label.textColor = #colorLiteral(red: 0.2980392157, green: 0.4588235294, blue: 0.6392156863, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        addSubview(label)
        
        label.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        label.topAnchor.constraint(equalTo: plusView.bottomAnchor, constant: 2).isActive = true
        label.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        label.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    

    
}

extension PhotoView{
    fileprivate class Decorator {
        static func decorate(_ view: PhotoView) {
            view.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            view.layer.borderWidth = 1
        }
        static func layoutSubViews(_ view: PhotoView) {
            view.round()
        }
    }
}
