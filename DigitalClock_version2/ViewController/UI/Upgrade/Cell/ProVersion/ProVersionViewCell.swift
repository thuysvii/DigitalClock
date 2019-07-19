//
//  ProVersionViewCell.swift
//  DigitalClock_version2
//
//  Created by Nguyen Thuy Thuy Vi on 7/11/19.
//  Copyright © 2019 Nguyen Thuy Thuy Vi. All rights reserved.
//

import UIKit

class ProVersionViewCell: UITableViewCell {
    
    @IBOutlet weak var upgradeButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
    }
    
    @IBAction func upgradeButtonClicked(_ sender: Any) {
        print("Get Pro Version successfully.")
    }
    
    func setupLayout() {
        self.upgradeButton.layer.cornerRadius = 26
    }

}
