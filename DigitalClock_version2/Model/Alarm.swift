//
//  Alarm.swift
//  DigitalClock_version2
//
//  Created by Nguyen Thuy Thuy Vi on 7/24/19.
//  Copyright © 2019 Nguyen Thuy Thuy Vi. All rights reserved.
//

import UIKit

struct Alarm {
    
    var time: String?
    var repeate: [Int]
    var snooze: String?
    var title: String?
    
    init(time: String, repeate: [Int], snooze: String, title: String) {
        self.time = time
        self.repeate = repeate
        self.snooze = snooze
        self.title = title
    }
}
