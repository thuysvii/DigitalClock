//
//  RepeatViewController.swift
//  DigitalClock_version2
//
//  Created by Nguyen Thuy Thuy Vi on 7/19/19.
//  Copyright © 2019 Nguyen Thuy Thuy Vi. All rights reserved.
//

import UIKit

class RepeatViewController: BaseViewController {
    
    @IBOutlet weak var repeatTableView: UITableView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var okButton: UIButton!
    
    var repeatList: [WeekdayRepeat] = repeatData
    private var selectedRepeatHandler: SelectedRepeatHandler?
    
    class func create() -> RepeatViewController {
        let controller = RepeatViewController(nibName: "RepeatViewController", bundle: nil)
        return controller
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupUI() {
        setupTableview()
    }

}

extension RepeatViewController {
    
    @discardableResult
    func onSelectedModeHandler(_ handler: SelectedRepeatHandler?) -> RepeatViewController {
        self.selectedRepeatHandler = handler
        return self
    }
}

extension RepeatViewController {
    
    private func setupTableview() {
        repeatTableView.registerCustomCell(RepeatViewCell.self)
        repeatTableView.dataSource = self
        repeatTableView.delegate = self
        repeatTableView.rowHeight = UITableView.automaticDimension
    }
}

extension RepeatViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repeatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCustomCell(RepeatViewCell.self)
        let weekday = repeatList[indexPath.row]
        cell.setupData(repeatMode: weekday)
        let isSelected = repeatList[indexPath.row].selectionFlag
        cell.accessoryType = isSelected == true ? .checkmark : .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let isSelected = repeatList[indexPath.row].selectionFlag
        repeatList[indexPath.row].selectionFlag = !isSelected
        tableView.reloadData()
    }
    
}

extension RepeatViewController {
    
    @IBAction func cancelButtonClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func okButtonClicked(_ sender: Any) {
        let modes = repeatList.filter { $0.selectionFlag == true }
        selectedRepeatHandler?(self, modes)
    }
}
