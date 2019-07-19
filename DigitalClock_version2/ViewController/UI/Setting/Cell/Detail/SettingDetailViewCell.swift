//
//  SettingDetailViewCell.swift
//  DigitalClock_version2
//
//  Created by Nguyen Thuy Thuy Vi on 7/17/19.
//  Copyright © 2019 Nguyen Thuy Thuy Vi. All rights reserved.
//

import UIKit

class SettingDetailViewCell: UITableViewCell {
    
    @IBOutlet weak var detailLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupData(settingItem: Setting) {
        let description = settingItem.title
        self.detailLabel.text = description
        self.detailLabel.textColor = .lightGray
        self.detailLabel.font = detailLabel.font.withSize(13.0)
    }
    
}
