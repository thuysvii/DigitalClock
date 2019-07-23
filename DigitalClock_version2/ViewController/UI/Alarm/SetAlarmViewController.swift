//
//  SetAlarmViewController.swift
//  DigitalClock_version2
//
//  Created by Nguyen Thuy Thuy Vi on 7/19/19.
//  Copyright © 2019 Nguyen Thuy Thuy Vi. All rights reserved.
//

import UIKit
import EachNavigationBar

class SetAlarmViewController: BaseViewController {
    
    @IBOutlet weak var alarmTableview: UITableView!
    
    var alarmItem: [AlarmMenuItem] = alarmMenuItemData
    
    class func create() -> SetAlarmViewController {
        let controller = SetAlarmViewController(nibName: "SetAlarmViewController", bundle: nil)
        return controller
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func setupUI() {
        showDoneButton()
        setupTableView()
        showAddAlarmButton()
    }
    
    override func setupNavigationBar() {
        navigation.bar.backgroundColor = .black
        navigation.item.title = "Alarms"
        navigation.bar.titleTextAttributes = [.foregroundColor: UIColor.white,
                                              .font: UIFont.systemFont(ofSize: 16.0)]
    }
    
    override func showDoneButton() {
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonTapped(_:)))
        navigation.item.leftBarButtonItem = doneButton
        navigation.item.leftBarButtonItem?.tintColor = .white
    }
    
    override func doneButtonTapped(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }

}

// MARK: - Table view
extension SetAlarmViewController {
    
    private func setupTableView() {
        alarmTableview.dataSource = self
        alarmTableview.delegate = self
        alarmTableview.rowHeight = UITableView.automaticDimension
        alarmTableview.backgroundColor = .black
        alarmTableview.registerCustomCell(SetAlarmViewCell.self)
    }
    
    private func showAddAlarmButton() {
        let addAlarmButton = UIBarButtonItem(title: "+", style: .plain, target: self, action: #selector(self.addButtonTapped(_:)))
        navigation.item.rightBarButtonItem = addAlarmButton
        navigation.item.rightBarButtonItem?.tintColor = .white
    }
}

extension SetAlarmViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueCustomCell(SetAlarmViewCell.self)
            cell.setupData(alarmItem: alarmItem[indexPath.row])
            cell.backgroundColor = .black
            cell.selectionStyle = .none
            return cell
    }
    
}

// MARK: - IBAction
extension SetAlarmViewController {
    
    @objc func addButtonTapped(_ sender: AnyObject){
        let handler: SelectedRepeatHandler = { [weak self] (controller, weekdayrepeat) in
            guard let `self` = self else {return}
            
        }
        
        let controller = AddAlarmViewController
            .create()
            .onSavedRepeat(handler)
        let nav = UINavigationController(rootViewController: controller)
        nav.navigation.configuration.isEnabled = true
        self.present(nav, animated: true, completion: nil)
    }
}

extension SetAlarmViewController {
    
}
