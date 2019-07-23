//
//  UpgradeViewController.swift
//  DigitalClock_version2
//
//  Created by Nguyen Thuy Thuy Vi on 7/11/19.
//  Copyright © 2019 Nguyen Thuy Thuy Vi. All rights reserved.
//

import UIKit

class UpgradeViewController: BaseViewController {
    
    @IBOutlet weak var upgradeTableView: UITableView!
    @IBOutlet weak var upgradeNavigation: UIView!
    @IBOutlet weak var upgradeView: UIView!
    @IBOutlet weak var closeButton: UIButton!
    
    var features: [FeatureVersion] = featureItemData
    
    class func create() -> UpgradeViewController {
        let controller = UpgradeViewController(nibName: "UpgradeViewController", bundle: nil)
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func setupUI() {
        setupUpgradeTableView()
    }

    // MARK: - IBAction
    @IBAction func closeButtonClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

    // MARK: - Setup UI
extension UpgradeViewController {
    
    private func setupUpgradeTableView() {
        upgradeTableView.dataSource = self
        upgradeTableView.delegate = self
        upgradeTableView.rowHeight = UITableView.automaticDimension
        upgradeTableView.separatorStyle = .none
        
        upgradeTableView.registerCustomCell(FeaturesViewCell.self)
        upgradeTableView.registerCustomCell(GiftViewCell.self)
        upgradeTableView.registerCustomCell(ProVersionViewCell.self)
        
        let white = UIColor.white
        upgradeView.layer.cornerRadius = 20
        upgradeView.layer.masksToBounds = true
        upgradeView.layer.borderWidth = 1
        upgradeView.layer.borderColor = white.cgColor
    }
}

    // MARK: - Tableview
extension UpgradeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return featureItemData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueCustomCell(FeaturesViewCell.self)
            cell.setData(features[indexPath.row])
            cell.backgroundColor = .darkGray
            return cell
        }
        else if indexPath.row == 1 {
            let cell = tableView.dequeueCustomCell(FeaturesViewCell.self)
            cell.setData(features[indexPath.row])
            cell.backgroundColor = .darkGray
            return cell
        }
        else if indexPath.row == 2 {
            let cell = tableView.dequeueCustomCell(GiftViewCell.self)
            cell.setData(features[indexPath.row])
            cell.backgroundColor = .darkGray
            return cell
        }
        else {
            let cell = tableView.dequeueCustomCell(ProVersionViewCell.self)
            cell.setupLayout()
            cell.backgroundColor = .darkGray
            return cell
        }
        
        
    }
}

