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
    fileprivate var models: [HeaderModel] = [.userInfo, .sex, .birthday]
    private let sex: [Sex] = [.male, .female]
    let datePicker: UIDatePicker = {
        let dp = UIDatePicker()
        dp.maximumDate = Date()
        return dp
    }()
    let registrModel = RegistrModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.keyboardDismissMode = .onDrag
        tableView.backgroundColor = #colorLiteral(red: 0.9450980392, green: 0.9450980392, blue: 0.9450980392, alpha: 1)
        tableView.separatorColor = .clear
        title = "Регистрация"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.contentInset = UIEdgeInsets(top: 26, left: 0, bottom: 0, right: 0)
        regCells()
        delegating()
        datePickerTarget()
        addBarButton()
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
        tableView.register(SegmenterTableViewCell.nib, forCellReuseIdentifier: SegmenterTableViewCell.name)
        tableView.register(BirdsdayTableViewCell.nib, forCellReuseIdentifier: BirdsdayTableViewCell.name)
    }
    
    //MARK: UIDatePicker
    private func datePickerTarget() {
        datePicker.addTarget(self, action: #selector(datePickerAction(sender:)), for: .valueChanged)
    }
    
    @objc private func datePickerAction(sender: UIDatePicker) {
        self.registrModel.birdsday = sender.date
    }
    
    //MARK: UIBarButtonItem
    
    private func addBarButton() {
        let barButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonAction(sender:)))
        navigationItem.rightBarButtonItem = barButton
    }
    @objc private func doneButtonAction(sender: UIBarButtonItem) {
        guard registrModel.isFilled else {
            showAlert(with: "Error", and: "Fill in all fields")
            return
        }
        AuthManager.shared.register(with: registrModel) {
            self.showAlert(with: "Success", and: "You are successfully registered")
        }
    }
    
    
    
}

//MARK: UITableViewDelegate

extension RegistrationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model = models[indexPath.section].cellModel[indexPath.row]
        switch model {
        case .userInfo:
            return 100
        case .sex, .birthday:
            return 44
        }
        
    }
}
//MARK: UITableViewDataSource
extension RegistrationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].cellModel.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerModel = models[section]
        switch headerModel {
        case .sex:
            let view = HeaderTitleView()
            return view
        default:
            return nil
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let headerModel = models[section]
        switch headerModel {
        case .sex:
            return 44
        case .birthday:
            return 34
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].cellModel[indexPath.row]
        switch model {
        case .userInfo:
            if let cell = tableView.dequeueReusableCell(withIdentifier: UserInfoTableViewCell.name, for: indexPath) as? UserInfoTableViewCell {
                cell.photoView.clicked = self.photoViewClicked
                cell.photoView.set(image: registrModel.photo)
                cell.mailAndPasswordView.mailFieldVoid = {text in
                    self.registrModel.email = text
                }
                cell.mailAndPasswordView.passFieldVoid = {text in
                    self.registrModel.password = text
                }
                return cell
            }
        case .sex:
            if let cell = tableView.dequeueReusableCell(withIdentifier: SegmenterTableViewCell.name, for: indexPath) as? SegmenterTableViewCell {
                cell.segmentedIndex = { index in
                    self.registrModel.sex = self.sex[index]
                }
                return cell
            }
        case .birthday:
            if let cell = tableView.dequeueReusableCell(withIdentifier: BirdsdayTableViewCell.name, for: indexPath) as? BirdsdayTableViewCell {
                cell.label.inputView = datePicker
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    
}

extension RegistrationViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //MARK: photoViewClicked
    private func photoViewClicked() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = UIImagePickerController.SourceType.photoLibrary
        picker.allowsEditing = false
        self.present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.originalImage] else {
            return
        }
        self.registrModel.photo = image as? UIImage
        tableView.reloadData()
        picker.dismiss(animated: true, completion: nil)
    }
}

extension RegistrationViewController {
    fileprivate enum CellModel {
        case userInfo
        case sex
        case birthday
    }
    
    fileprivate enum HeaderModel: CellHeaderProtocol {
        typealias CellType = CellModel
        case userInfo
        case sex
        case birthday
        var cellModel: [RegistrationViewController.CellModel] {
            switch self {
            case .userInfo: return [.userInfo]
            case .sex: return [.sex]
            case .birthday: return [.birthday]
            }
        }
    }
}
