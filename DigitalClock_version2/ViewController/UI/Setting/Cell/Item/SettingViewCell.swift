//
//  SettingViewCell.swift
//  DigitalClock_version2
//
//  Created by Nguyen Thuy Thuy Vi on 7/17/19.
//  Copyright © 2019 Nguyen Thuy Thuy Vi. All rights reserved.
//

import UIKit

class SettingViewCell: UITableViewCell {
    
    @IBOutlet weak var iconSettingItem: UIImageView!
    @IBOutlet weak var titleSettingItem: UILabel!
    @IBOutlet weak var subtitleSettingItem: UILabel!
    @IBOutlet weak var viewMoreSettingItem: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupData(settingItem: Setting) {
        let icon = settingItem.image
        self.iconSettingItem.image = UIImage(named: icon ?? "")
        let title = settingItem.title
        self.titleSettingItem.text = title
        self.titleSettingItem.textColor = .white
        let subtitle = settingItem.subtitle
        self.subtitleSettingItem.text = subtitle
        self.subtitleSettingItem.textColor = .lightGray
        let image = UIImage(named: "ic_view_more")
        self.viewMoreSettingItem.image = image
    }
    
}
