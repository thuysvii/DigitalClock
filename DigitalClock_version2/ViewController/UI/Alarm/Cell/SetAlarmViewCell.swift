//
//  SetAlarmViewCell.swift
//  DigitalClock_version2
//
//  Created by Nguyen Thuy Thuy Vi on 7/19/19.
//  Copyright © 2019 Nguyen Thuy Thuy Vi. All rights reserved.
//

import UIKit

class SetAlarmViewCell: UITableViewCell {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var repeatLabel: UILabel!
    @IBOutlet weak var sessionLabel: UILabel!
    @IBOutlet weak var alarmSwitch: UISwitch!
    @IBOutlet weak var viewdetailimage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setupData() {
        let image = UIImage(named: "ic_view_more")
        viewdetailimage.image = image
        viewdetailimage.backgroundColor = .white
        timeLabel.textColor = .white
        repeatLabel.textColor = .white
        sessionLabel.textColor = .white
    }
    
}
