//
//  NibLoadable.swift
//  DKVK
//
//  Created by Евгений Липадат on 02/01/2019.
//  Copyright © 2019 Евгений Липадат. All rights reserved.
//

import UIKit

protocol NibLoadable: class {
    static var nib: UINib { get }
}

extension NibLoadable {
    static var nib: UINib {
        return UINib(nibName: name, bundle: Bundle.init(for: self))
    }
    static var name: String {
        return String(describing: self)
    }
    
}

extension NibLoadable where Self: UIView {
    // Эта функция будет загружать ниб из файла и сразу возвращать нашу Вью. -> Self означает что вернет не UIView а именно ту Вью, которую нам необходимо будет загрузить из файла.
    static func loadFromNib() -> Self {
        guard let view = nib.instantiate(withOwner: nil, options: nil).first as? Self else {
            fatalError()
        }
        return view
    }
}
