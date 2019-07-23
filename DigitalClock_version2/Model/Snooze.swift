//
//  Snooze.swift
//  DigitalClock_version2
//
//  Created by Nguyen Thuy Thuy Vi on 7/22/19.
//  Copyright © 2019 Nguyen Thuy Thuy Vi. All rights reserved.
//

import UIKit

struct Snooze {
    
    var title: String
    var minutes: Int
    var selectionFlag: Bool
    
    init(title: String, minutes: Int, selectionFlag: Bool = false) {
        self.title = title
        self.minutes = minutes
        self.selectionFlag = selectionFlag
    }
}
