//
//  Extension+ViewController.swift
//  DKVK
//
//  Created by Евгений Липадат on 05/01/2019.
//  Copyright © 2019 Евгений Липадат. All rights reserved.
//

import UIKit

extension UIViewController {

func showAlert(with title: String, and message: String) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
    }
}
