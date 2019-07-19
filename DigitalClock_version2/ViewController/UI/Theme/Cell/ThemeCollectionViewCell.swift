//
//  ThemeCollectionViewCell.swift
//  DigitalClock_version2
//
//  Created by Nguyen Thuy Thuy Vi on 7/15/19.
//  Copyright © 2019 Nguyen Thuy Thuy Vi. All rights reserved.
//

import UIKit
import UIColor_Hex_Swift

class ThemeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var currentTheme: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var borderTheme: UIView!
    @IBOutlet weak var backgroundTheme: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupLayout(_ theme: Theme) {
        self.currentTheme.isHidden = true
        let newBackgroundTheme = theme.backgroundColor
        self.backgroundTheme.backgroundColor = UIColor(newBackgroundTheme ?? "")
        let newColorText = theme.labelColor
        self.timeLabel.text = newColorText
        self.timeLabel.textColor = UIColor(newColorText ?? "")
        self.timeLabel.font = UIFont(name: "Digital-7Mono", size: 80.0)
    }
    
    func setupSelectedTheme() {
        self.currentTheme.isHidden = false
    }

}
