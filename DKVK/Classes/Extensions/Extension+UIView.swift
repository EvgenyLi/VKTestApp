//
//  Extension+UIView.swift
//  DKVK
//
//  Created by Евгений Липадат on 02/01/2019.
//  Copyright © 2019 Евгений Липадат. All rights reserved.
//

import UIKit

extension UIView {
     func round() {
        layer.cornerRadius = frame.height / 2
        clipsToBounds = true
    }
}
