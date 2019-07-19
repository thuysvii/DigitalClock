//
//  SubtitleViewCell.swift
//  DigitalClock_version2
//
//  Created by Nguyen Thuy Thuy Vi on 7/18/19.
//  Copyright © 2019 Nguyen Thuy Thuy Vi. All rights reserved.
//

import UIKit

class SubtitleViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var switchDisplaySetting: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupData(displaysettingItem: DisplaySettingItem){
        title.text = displaysettingItem.title
        subtitle.text = displaysettingItem.subtitle
        title.textColor = .white
        subtitle.textColor = .lightGray
        subtitle.font = subtitle.font.withSize(13.0)
        switchDisplaySetting.onTintColor = .white
        switchDisplaySetting.thumbTintColor = .lightGray
        self.backgroundView?.backgroundColor = UIColor("#5A6062")
    }
    
}
