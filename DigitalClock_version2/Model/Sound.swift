//
//  Sound.swift
//  DigitalClock_version2
//
//  Created by Nguyen Thuy Thuy Vi on 7/19/19.
//  Copyright © 2019 Nguyen Thuy Thuy Vi. All rights reserved.
//

import UIKit

struct Sounds {
    
    var title: String
    var selectionFlag: Bool
    
    init(title: String, selectionFlag: Bool = false) {
        self.title = title
        self.selectionFlag = selectionFlag
    }
}
