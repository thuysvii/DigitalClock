//
//  AddAlarmViewController.swift
//  DigitalClock_version2
//
//  Created by Nguyen Thuy Thuy Vi on 7/19/19.
//  Copyright © 2019 Nguyen Thuy Thuy Vi. All rights reserved.
//

import UIKit
import EachNavigationBar
import PopItUp

class AddAlarmViewController: BaseViewController {
    
    var alarmItemList: [AlarmMenuItem] = alarmMenuItem
    
    @IBOutlet weak var alarmItemTableView: UITableView!
    
    class func create() -> AddAlarmViewController {
        let controller = AddAlarmViewController(nibName: "AddAlarmViewController", bundle: nil)
        return controller
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupUI() {
        showCancelButton()
        showSaveButton()
        setupTableview()
    }
    
    override func setupNavigationBar() {
        navigation.bar.backgroundColor = .black
    }
    
    override func showCancelButton() {
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelButtonTapped(_:)))
        navigation.item.leftBarButtonItem = cancelButton
        navigation.item.leftBarButtonItem?.tintColor = .green
    }
    
    override func cancelButtonTapped(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
}

// MARK: -Setup UI
extension AddAlarmViewController {
    
    private func showSaveButton() {
        let saveButton = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(self.saveButtonTapped(_:)))
        navigation.item.rightBarButtonItem = saveButton
        navigation.item.rightBarButtonItem?.tintColor = .green
    }
    
    private func setupTableview() {
        alarmItemTableView.backgroundColor = .black
        alarmItemTableView.registerCustomCell(AlarmItemViewCell.self)
        alarmItemTableView.registerCustomCell(AlarmPickerTimeViewCell.self)
        alarmItemTableView.dataSource = self
        alarmItemTableView.delegate = self
        alarmItemTableView.rowHeight = UITableView.automaticDimension
    }
    
    private func showSoundsView(_ indexPath: IndexPath) {
        let controller = SoundViewController.create()
        let nav = UINavigationController(rootViewController: controller)
        nav.navigation.configuration.isEnabled = true
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    private func showRepeatView(_ indexPath: IndexPath) {
        let controller = RepeatViewController.create()
        presentPopup(controller,
                     animated: true,
                     backgroundStyle: .blur(.dark), // present the popup with a blur effect has background
            constraints: [.width(536), .height(304)], // fix leading edge and the width
            transitioning: .slide(.bottom), // the popup come and goes from the left side of the screen
            autoDismiss: false, // when touching outside the popup bound it is not dismissed
            completion: nil)
        
    }
}

// MARK: -IBAction
extension AddAlarmViewController {
    
    @objc func saveButtonTapped(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: -Tableview
extension AddAlarmViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alarmItemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueCustomCell(AlarmPickerTimeViewCell.self)
            cell.setupView()
            cell.selectionStyle = .none
            return cell
        } else {
            let cell = tableView.dequeueCustomCell(AlarmItemViewCell.self)
            cell.setupData(alarmItem: alarmItemList[indexPath.row])
            cell.backgroundColor = .black
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 1:
            self.showRepeatView(indexPath)
        case 2:
            self.showSoundsView(indexPath)
        default:
            return 
        }
    }
    
}
