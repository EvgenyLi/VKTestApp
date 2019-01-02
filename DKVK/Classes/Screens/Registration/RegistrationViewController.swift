//
//  RegistrationViewController.swift
//  DKVK
//
//  Created by Евгений Липадат on 02/01/2019.
//  Copyright © 2019 Евгений Липадат. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    fileprivate var models: [CellModel] = [.userInfo]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Регистрация"
        regCells()
        delegating()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func delegating() {
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func regCells() {
        tableView.register(UserInfoTableViewCell.nib, forCellReuseIdentifier: UserInfoTableViewCell.name)
    }

}

extension RegistrationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model = models[indexPath.row]
        switch model {
        case .userInfo:
            return 100
        default: return 0
        }
        
    }
}

extension RegistrationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        switch model {
        case .userInfo:
            if let cell = tableView.dequeueReusableCell(withIdentifier: UserInfoTableViewCell.name, for: indexPath) as? UserInfoTableViewCell {
                return cell
            }
        default: break
        }
        return UITableViewCell()
    }
    
    
}

extension RegistrationViewController {
    fileprivate enum CellModel {
        case userInfo
        case sex
        case birthday
    }
}
