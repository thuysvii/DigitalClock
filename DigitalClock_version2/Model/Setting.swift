//
//  Setting.swift
//  DigitalClock_version2
//
//  Created by Nguyen Thuy Thuy Vi on 7/17/19.
//  Copyright © 2019 Nguyen Thuy Thuy Vi. All rights reserved.
//

import UIKit

struct Setting {
    
    var section: String?
    var image: String?
    var title: String?
    var subtitle: String?
    
    init(section: String, image: String, title: String, subtitle: String) {
        self.section = section
        self.image = image
        self.title = title
        self.subtitle = subtitle
    }
}

