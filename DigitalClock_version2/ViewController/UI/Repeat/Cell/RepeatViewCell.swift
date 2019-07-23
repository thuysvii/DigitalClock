//
//  RepeatViewCell.swift
//  DigitalClock_version2
//
//  Created by Nguyen Thuy Thuy Vi on 7/22/19.
//  Copyright © 2019 Nguyen Thuy Thuy Vi. All rights reserved.
//

import UIKit

class RepeatViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupData(repeatMode: WeekdayRepeat) {
        titleLabel.text = repeatMode.title
    }
    
}
