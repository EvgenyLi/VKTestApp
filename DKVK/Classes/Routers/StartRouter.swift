//
//  StartRouter.swift
//  DKVK
//
//  Created by Евгений Липадат on 02/01/2019.
//  Copyright © 2019 Евгений Липадат. All rights reserved.
//

import UIKit

final class StartRouter {
    static let shared = StartRouter()
    private init() {}
     func goToRegistrationScreen(from source: UIViewController) {
        let vc = RegistrationViewController()
        source.navigationController?.pushViewController(vc, animated: true)
    }
    
}
