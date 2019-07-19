//
//  HourlyAlarmViewCell.swift
//  DigitalClock_version2
//
//  Created by Nguyen Thuy Thuy Vi on 7/18/19.
//  Copyright © 2019 Nguyen Thuy Thuy Vi. All rights reserved.
//

import UIKit

class HourlyAlarmViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var hourlyAlarmSwitch: UISwitch!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupData(hourlyAlarmtem: HourlyAlarmItem) {
        titleLabel.text = hourlyAlarmtem.title
        titleLabel.textColor = .white
        hourlyAlarmSwitch.onTintColor = .white
        hourlyAlarmSwitch.thumbTintColor = .lightGray
        
    }
    
}
