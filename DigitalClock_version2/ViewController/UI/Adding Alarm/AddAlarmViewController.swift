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
    
    var alarmItemList: [AlarmMenuItem] = alarmMenuItemData
    
    @IBOutlet weak var alarmItemTableView: UITableView!
    
    private var selectedSound = DataReferencesManager.shared.soundList[0]
    private var selectedSnooze = DataReferencesManager.shared.snoozeList[0]
    private var selectedRepeat = [WeekdayRepeat]()
    private var selectedRepeatHandler: SelectedRepeatHandler?
    private var alertTitle: String?
    
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

extension AddAlarmViewController {
    
    @discardableResult
    func onSavedRepeat(_ handler: SelectedRepeatHandler?) -> AddAlarmViewController {
        self.selectedRepeatHandler = handler
        return self
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
                    default: return "No Repeat"
                        
                    }
                }
                return conditionRepeat.joined(separator: " ")
            }
        }
    }
    
}

extension AddAlarmViewController {
    
    private func showRepeatView(_ indexPath: IndexPath) {
        let handler: SelectedRepeatHandler = { [weak self] (controller, weekdayrepeat) in
            guard let `self` = self else {return}
            self.alarmItemList[indexPath.row].subtitle = self.displayWeekdayRepeatTitle(weekdayrepeat)
            self.selectedRepeat = weekdayrepeat
            self.alarmItemTableView.reloadRows(at: [indexPath], with: .none)
            self.dismiss(animated: true, completion: nil)
            
        }
        let controller = RepeatViewController
            .create()
            .onSelectedModeHandler(handler)
        
        presentPopup(controller,
                     animated: true,
                     backgroundStyle: .blur(.dark), // present the popup with a blur effect has background
            constraints: [.width(536), .height(304)], // fix leading edge and the width
            transitioning: .slide(.bottom), // the popup come and goes from the left side of the screen
            autoDismiss: false, // when touching outside the popup bound it is not dismissed
            completion: nil)
        }
    
    private func showSoundsView(_ indexPath: IndexPath) {
        let handler: SelectedSoundHandler = { [weak self] (controller, sound) in
            guard let `self` = self else {return}
            self.alarmItemList[indexPath.row].subtitle = sound.title
            self.selectedSound = sound
            self.alarmItemTableView.reloadRows(at: [indexPath], with: .none)
        }
        let controller = SoundViewController
            .create()
            .onSelectedModeHandler(handler)
        let nav = UINavigationController(rootViewController: controller)
        nav.navigation.configuration.isEnabled = true
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    private func showSnoozeView(_ indexPath: IndexPath) {
        let handler: SelectedSnoozeHandler = { [weak self] (controller, snooze) in
            guard let `self` = self else {return}
            self.alarmItemList[indexPath.row].subtitle = snooze.title
            self.selectedSnooze = snooze
            self.alarmItemTableView.reloadRows(at: [indexPath], with: .none)
            controller.dismiss(animated: true, completion: nil)
            
        }
        let controller = SnoozeViewController
            .create()
            .onSelectedModeHandler(handler)
        presentPopup(controller,
                     animated: true,
                     backgroundStyle: .blur(.dark), // present the popup with a blur effect has background
            constraints: [.width(534), .height(200)], // fix leading edge and the width
            transitioning: .slide(.bottom), // the popup come and goes from the left side of the screen
            autoDismiss: false, // when touching outside the popup bound it is not dismissed
            completion: nil)
    }
    
    private func showTitleInputtedDialog(_ indexPath: IndexPath) {
        let alert = UIAlertController(title: "Title", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.text = self.alarmItemList[indexPath.row].subtitle
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            guard let titleTextField = alert?.textFields?[0] else {return}
            guard let title = titleTextField.text else {return}
            self.alarmItemList[indexPath.row].subtitle = title
            DispatchQueue.main.async {
                self.alarmItemTableView.reloadRows(at: [indexPath], with: .none)
            }
        })
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
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
        case 3:
            self.showSnoozeView(indexPath)
        case 4:
            self.showTitleInputtedDialog(indexPath)
        default:
            return 
        }
    }
    
}
