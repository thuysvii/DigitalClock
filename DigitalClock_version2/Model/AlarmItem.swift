//
//  AlarmItem.swift
//  DigitalClock_version2
//
//  Created by Nguyen Thuy Thuy Vi on 7/19/19.
//  Copyright © 2019 Nguyen Thuy Thuy Vi. All rights reserved.
//

import UIKit

struct AlarmItem {
    
    var title: String?
    var subtitle: String?
    var alarms: [Alarm] = []
    
    init(title: String, subtitle: String, alarms: [Alarm]) {
        self.title = title
        self.subtitle = subtitle
        self.alarms = alarms
    }
}
