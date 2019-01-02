//
//  Router.swift
//  DKVK
//
//  Created by Евгений Липадат on 01/01/2019.
//  Copyright © 2019 Евгений Липадат. All rights reserved.
//

import UIKit.UIWindow

final class Router {
    
   static let shared = Router()
    
    private init() {}
    
    private let rootViewController: UIViewController = ViewController()
    
    func root(_ window: inout UIWindow?) {
        let frame = UIScreen.main.bounds
        window = UIWindow(frame: frame)
        window?.rootViewController = UINavigationController(rootViewController: rootViewController)
        window?.makeKeyAndVisible()
    }
}
