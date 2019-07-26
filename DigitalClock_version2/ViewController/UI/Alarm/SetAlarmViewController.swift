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
    
    var alarmList = [Alarm]()
    private var selectedRepeat = [WeekdayRepeat]()
    private var selectedRepeatHandler: SelectedRepeatHandler?
    
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

// MARK: - Setup UI
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
    
    private func displayWeekdayRepeatTitle(_ modes: [WeekdayRepeat]) -> String {
        let dates = modes.map { $0.weekday }
        if dates.count == 0 {
            return "No Repeat"
        } else {
            if dates.count == 7 {
                return "Everyday"
            } else if dates.count == 5 &&
                dates.filter({return $0 != 7 && $0 != 8}).count == 5 {
                return "Every Weekday"
            } else if dates.count == 2 &&
                dates.filter({return $0 != 7 && $0 != 8}).count == 0 {
                return "Every Weekend"
            } else {
                let conditionRepeat = dates.map { value -> String in
                    switch value {
                    case 8: return "Sun"
                    case 2: return "Mon"
                    case 3: return "Tue"
                    case 4: return "Wed"
                    case 5: return "Thu"
                    case 6: return "Fri"
                    case 7: return "Sat"
                    default: return ""
                        
                    }
                }
                return conditionRepeat.joined(separator: " ")
            }
        }
    }

}

// MARK: - Tableview
extension SetAlarmViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return alarmList.count
        return alarmList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueCustomCell(SetAlarmViewCell.self)
            cell.setupData(alarm: alarmList[indexPath.row])
//
            cell.backgroundColor = .black
            cell.selectionStyle = .none
            return cell
    }
    
}

// MARK: - Open SetAlarmViewController
extension SetAlarmViewController {
    
    @objc func addButtonTapped(_ sender: AnyObject){
        let handle: ((Alarm) -> (Void)) = { [weak self] (alarm) in
            guard let `self` = self else {return}
            self.alarmList.append(alarm)
            self.alarmTableview.reloadData()
        }
        
        let controller = AddAlarmViewController
            .create().onSavedRepeat(handle)
        
        let nav = UINavigationController(rootViewController: controller)
        nav.navigation.configuration.isEnabled = true
        self.present(nav, animated: true, completion: nil)
    }
}


