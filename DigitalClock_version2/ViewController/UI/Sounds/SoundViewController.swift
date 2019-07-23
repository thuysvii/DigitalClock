//
//  SoundViewController.swift
//  DigitalClock_version2
//
//  Created by Nguyen Thuy Thuy Vi on 7/19/19.
//  Copyright © 2019 Nguyen Thuy Thuy Vi. All rights reserved.
//

import UIKit

class SoundViewController: BaseViewController {
    
    var soundList: [Sound] = soundsData
    var selectedIndex: IndexPath?
    var selectedSoundHandler: SelectedSoundHandler?
    
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

extension SoundViewController {
    
    @discardableResult
    func onSelectedModeHandler(_ handler: SelectedSoundHandler?) -> SoundViewController {
        self.selectedSoundHandler = handler
        return self
    }
}

// MARK: - Setup UI
extension SoundViewController {

    private func setupTableview() {
        soundTableView.backgroundColor = .black
        soundTableView.registerCustomCell(SoundViewCell.self)
        soundTableView.dataSource = self
        soundTableView.delegate = self
        soundTableView.rowHeight = UITableView.automaticDimension
        soundTableView.allowsMultipleSelection = true
    }

}

// MARK: - Tableview
extension SoundViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return soundList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCustomCell(SoundViewCell.self)
        let currentSound = soundList[indexPath.row]
        cell.setupData(sounds: currentSound)
        cell.backgroundColor = .black
        
        cell.accessoryType = .none
        if indexPath == selectedIndex {
            cell.accessoryType = .checkmark
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndex = indexPath
        var currentSound = soundList[indexPath.row]
        currentSound.selectionFlag = true
        self.selectedSoundHandler?(self, currentSound)
        
        tableView.reloadData()
    }
    
}
