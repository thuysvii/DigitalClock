//
//  SettingItems.swift
//  DigitalClock_version2
//
//  Created by Nguyen Thuy Thuy Vi on 7/18/19.
//  Copyright © 2019 Nguyen Thuy Thuy Vi. All rights reserved.
//

import UIKit

struct DisplaySettingItem {
    
    var title: String?
    var subtitle: String?
    var switchItem: Bool?
    
    init(title: String, subtitle: String, switchItem: Bool = true) {
        self.title = title
        self.subtitle = subtitle
        self.switchItem = switchItem
    }
}

struct HourlyAlarmItem {
    
    var title: String?
    var switchItem: Bool?
    
    init(title: String, switchItem: Bool = true) {
        self.title = title
        self.switchItem = switchItem
    }
}
