//
//  DisplaySettingViewCell.swift
//  DigitalClock_version2
//
//  Created by Nguyen Thuy Thuy Vi on 7/18/19.
//  Copyright © 2019 Nguyen Thuy Thuy Vi. All rights reserved.
//

import UIKit
import UIColor_Hex_Swift

class DisplaySettingViewCell: UITableViewCell {
    
    @IBOutlet weak var titleDisplaySetting: UILabel!
    @IBOutlet weak var switchDisplaySetting: UISwitch!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupData(displaysettingItem: DisplaySettingItem) {
        titleDisplaySetting.text = displaysettingItem.title
        titleDisplaySetting.textColor = .white
        switchDisplaySetting.onTintColor = .white
        switchDisplaySetting.thumbTintColor = .lightGray
        
    }
    
}
