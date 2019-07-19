//
//  HourlyAlarmViewController.swift
//  DigitalClock_version2
//
//  Created by Nguyen Thuy Thuy Vi on 7/18/19.
//  Copyright © 2019 Nguyen Thuy Thuy Vi. All rights reserved.
//

import UIKit
import EachNavigationBar

class HourlyAlarmViewController: BaseViewController {
    
    var hourlyAlarmItems: [HourlyAlarmItem] = hourlyAlarmIList
    
    @IBOutlet weak var hourlyAlarmTableView: UITableView!

    class func create() -> HourlyAlarmViewController {
        let controller = HourlyAlarmViewController(nibName: "HourlyAlarmViewController", bundle: nil)
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupUI() {
        showBackButton()
        setupTableView()
    }
    
    override func setupNavigationBar() {
        navigation.bar.backgroundColor = .black
        navigation.item.title = "Hourly Alarm"
        navigation.bar.titleTextAttributes = [.foregroundColor: UIColor.white,
                                              .font: UIFont.systemFont(ofSize: 16.0)]
    }
    override func showBackButton() {
        let image = UIImage(named: "ic_setting_back")
        let backButton = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(self.backButtonTapped(_:)))
        navigation.item.leftBarButtonItem = backButton
        navigation.item.leftBarButtonItem?.tintColor = .white
    }
    
    override func backButtonTapped(_ sender: AnyObject) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

// MARK: - Table view
extension HourlyAlarmViewController {
    
    private func setupTableView() {
        hourlyAlarmTableView.dataSource = self
        hourlyAlarmTableView.delegate = self
        hourlyAlarmTableView.rowHeight = UITableView.automaticDimension
        hourlyAlarmTableView.backgroundColor = .black
        hourlyAlarmTableView.registerCustomCell(HourlyAlarmViewCell.self)
    }
}

extension HourlyAlarmViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hourlyAlarmItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueCustomCell(HourlyAlarmViewCell.self)
            cell.setupData(hourlyAlarmtem: hourlyAlarmItems[indexPath.row])
            cell.backgroundColor = .darkGray
            cell.selectionStyle = .none
            return cell
    }
    
    
    
}
