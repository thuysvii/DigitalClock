//
//  SoundViewController.swift
//  DigitalClock_version2
//
//  Created by Nguyen Thuy Thuy Vi on 7/19/19.
//  Copyright © 2019 Nguyen Thuy Thuy Vi. All rights reserved.
//

import UIKit

class SoundViewController: BaseViewController {
    
    var soundList: [Sounds] = sounds
    
    @IBOutlet weak var soundTableView: UITableView!

    class func create() -> SoundViewController {
        let controller = SoundViewController(nibName: "SoundViewController", bundle: nil)
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupUI() {
        setupTableview()
        showBackButton()
    }
    
    override func setupNavigationBar() {
        navigation.bar.backgroundColor = .black
        navigation.bar.titleTextAttributes = [.foregroundColor: UIColor.white,
                                              .font: UIFont.systemFont(ofSize: 16.0)]
        navigation.item.title = "Sounds"
        navigation.bar.tintColor = UIColor.white
    }

}

// MARK: -Setup UI
extension SoundViewController {

    private func setupTableview() {
        soundTableView.backgroundColor = .black
        soundTableView.registerCustomCell(SoundViewCell.self)
        soundTableView.dataSource = self
        soundTableView.delegate = self
        soundTableView.rowHeight = UITableView.automaticDimension
    }
}

// MARK: -Tableview
extension SoundViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return soundList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCustomCell(SoundViewCell.self)
        cell.setupData(sounds: soundList[indexPath.row])
        let isSelected = soundList[indexPath.row].selectionFlag
        cell.accessoryType = isSelected == true ? .checkmark : .none
        cell.selectionStyle = .none
        return cell
    }
    
}
