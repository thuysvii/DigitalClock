//
//  SnoozeViewController.swift
//  DigitalClock_version2
//
//  Created by Nguyen Thuy Thuy Vi on 7/22/19.
//  Copyright © 2019 Nguyen Thuy Thuy Vi. All rights reserved.
//

import UIKit

class SnoozeViewController: BaseViewController {
    
    var snoozeList: [Snooze] = snoozeData
    var selectedIndex: IndexPath?
    var selectedSnoozeHandler: SelectedSnoozeHandler?
    
    @IBOutlet weak var snoozeTableview: UITableView!
    
    class func create() -> SnoozeViewController {
        let controller = SnoozeViewController(nibName: "SnoozeViewController", bundle: nil)
        return controller
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupUI() {
        setupTableview()
    }

}

extension SnoozeViewController {
    
    @discardableResult
    func onSelectedModeHandler(_ handler: SelectedSnoozeHandler?) -> SnoozeViewController {
        self.selectedSnoozeHandler = handler
        return self
    }
}

extension SnoozeViewController {
    
    private func setupTableview() {
        snoozeTableview.registerCustomCell(SnoozeViewCell.self)
        snoozeTableview.dataSource = self
        snoozeTableview.delegate = self
        snoozeTableview.rowHeight = 52.0
    }
}

// MARK: - Tableview
extension SnoozeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return snoozeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCustomCell(SnoozeViewCell.self)
        let snooze = snoozeList[indexPath.row]
        cell.setupData(snooze: snooze)
        
        cell.accessoryType = .none
        if indexPath == selectedIndex {
            cell.accessoryType = .checkmark
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndex = indexPath
        var currentSnooze = snoozeList[indexPath.row]
        currentSnooze.selectionFlag = true
        tableView.reloadData()
        delayWithSeconds(1.0) { [weak self] in
            guard let `self` = self else { return }
            self.selectedSnoozeHandler!(self, currentSnooze)
        }
        
    }
    
}

extension SnoozeViewController {
    
    private func delayWithSeconds(_ seconds: Double, completion: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            completion()
        }
    }
}

