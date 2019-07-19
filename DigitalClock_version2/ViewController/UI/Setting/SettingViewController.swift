//
//  SettingViewController.swift
//  DigitalClock_version2
//
//  Created by Nguyen Thuy Thuy Vi on 7/17/19.
//  Copyright © 2019 Nguyen Thuy Thuy Vi. All rights reserved.
//

import UIKit
import EachNavigationBar

class SettingViewController: BaseViewController {
    
    var setting: [Setting] = settingItem
    
    @IBOutlet weak var settingTableview: UITableView!
    
    class func create() -> SettingViewController {
        let controller = SettingViewController(nibName: "SettingViewController", bundle: nil)
        return controller
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupUI() {
        showBackButton()
        setupTableview()
    }
    
    override func setupNavigationBar() {
        navigation.bar.backgroundColor = .black
        navigation.item.title = "Settings"
        navigation.bar.titleTextAttributes = [.foregroundColor: UIColor.white,
                                              .font: UIFont.systemFont(ofSize: 16)]
    }
    
    override func showBackButton() {
        let image = UIImage(named: "ic_setting_back")
        let backButton = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(self.backButtonTapped(_:)))
        navigation.item.leftBarButtonItem = backButton
        navigation.item.leftBarButtonItem?.tintColor = .white
    }
    
    override func backButtonTapped(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }

}

    // MARK: - TableView
extension SettingViewController {
    
    private func setupTableview(){
        settingTableview.backgroundColor = .black
        settingTableview.dataSource = self
        settingTableview.delegate = self
        
        settingTableview.registerCustomCell(SettingDetailViewCell.self)
        settingTableview.registerCustomCell(SettingViewCell.self)
    }
}

extension SettingViewController: UITableViewDataSource, UITableViewDelegate {
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return setting.count
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return setting.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 7 {
            let cell = tableView.dequeueCustomCell(SettingDetailViewCell.self)
            cell.setupData(settingItem: setting[indexPath.row])
            cell.backgroundColor = .darkGray
            return cell
        } else {
            let cell = tableView.dequeueCustomCell(SettingViewCell.self)
            cell.setupData(settingItem: setting[indexPath.row])
            cell.backgroundColor = .darkGray
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.showDisplaySetting(indexPath)
        case 2:
            self.showHourlyAlarm(indexPath)
        case 3:
            self.showAllClockSkins(indexPath)
        default:
            return
        }
    }

}

    // MARK: - Setting Items.
extension SettingViewController {
    
    private func showDisplaySetting(_ indexPath: IndexPath) {
        let controller = DisplaySettingViewController.create()
        let nav = UINavigationController(rootViewController: controller)
        nav.navigation.configuration.isEnabled = true
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    private func showHourlyAlarm(_ indexPath: IndexPath) {
        let controller = HourlyAlarmViewController.create()
        let nav = UINavigationController(rootViewController: controller)
        nav.navigation.configuration.isEnabled = true
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    private func showAllClockSkins(_ indexPath: IndexPath) {
        let controller = ThemeViewController.create()
        let nav = UINavigationController(rootViewController: controller)
        nav.navigation.configuration.isEnabled = true
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
