//
//  Repeat.swift
//  DigitalClock_version2
//
//  Created by Nguyen Thuy Thuy Vi on 7/22/19.
//  Copyright © 2019 Nguyen Thuy Thuy Vi. All rights reserved.
//

import UIKit

struct WeekdayRepeat {
    
    var title: String
    var weekday: Int
    var selectionFlag: Bool
    
    init(title: String, weekday: Int, selectionFlag: Bool = false) {
        self.title = title
        self.weekday = weekday
        self.selectionFlag = selectionFlag
    }
}
