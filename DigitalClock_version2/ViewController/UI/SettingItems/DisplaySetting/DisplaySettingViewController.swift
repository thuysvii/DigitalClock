//
//  DisplaySettingViewController.swift
//  DigitalClock_version2
//
//  Created by Nguyen Thuy Thuy Vi on 7/18/19.
//  Copyright © 2019 Nguyen Thuy Thuy Vi. All rights reserved.
//

import UIKit
import EachNavigationBar

class DisplaySettingViewController: BaseViewController {
    
    var settingItems: [DisplaySettingItem] = displaysettingListData
    
    @IBOutlet weak var displaySettingTableview: UITableView!
    
    class func create() -> DisplaySettingViewController {
        let controller = DisplaySettingViewController(nibName: "DisplaySettingViewController", bundle: nil)
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
        navigation.item.title = "Display Settings"
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
extension DisplaySettingViewController {
    
    private func setupTableView() {
        displaySettingTableview.dataSource = self
        displaySettingTableview.delegate = self
        displaySettingTableview.rowHeight = UITableView.automaticDimension
        displaySettingTableview.backgroundColor = .black
        displaySettingTableview.registerCustomCell(DisplaySettingViewCell.self)
        displaySettingTableview.registerCustomCell(SubtitleViewCell.self)
    }
}

extension DisplaySettingViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 4 {
            let cell = tableView.dequeueCustomCell(SubtitleViewCell.self)
            cell.setupData(displaysettingItem: settingItems[indexPath.row])
            cell.backgroundColor = .darkGray
            cell.selectionStyle = .none
            return cell
        } else {
            let cell = tableView.dequeueCustomCell(DisplaySettingViewCell.self)
            cell.setupData(displaysettingItem: settingItems[indexPath.row])
            cell.backgroundColor = .darkGray
            cell.selectionStyle = .none
            return cell 
        }
    }
    
}
