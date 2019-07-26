//
//  AlarmItemViewCell.swift
//  DigitalClock_version2
//
//  Created by Nguyen Thuy Thuy Vi on 7/19/19.
//  Copyright © 2019 Nguyen Thuy Thuy Vi. All rights reserved.
//

import UIKit

class AlarmItemViewCell: UITableViewCell {
    
    @IBOutlet weak var titleNewAlarm: UILabel!
    @IBOutlet weak var subtitleNewAlarm: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupData(alarmItem: AlarmItem) {
        titleNewAlarm.text = alarmItem.title
        titleNewAlarm.textColor = .white
        subtitleNewAlarm.text = alarmItem.subtitle
        subtitleNewAlarm.textColor = .darkGray
    }
    
    func getSubtitle() {
        
    }
    
}
