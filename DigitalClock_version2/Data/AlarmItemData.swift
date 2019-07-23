//
//  AlarmItemData.swift
//  DigitalClock_version2
//
//  Created by Nguyen Thuy Thuy Vi on 7/19/19.
//  Copyright © 2019 Nguyen Thuy Thuy Vi. All rights reserved.
//

import UIKit

private var selectedSound = DataReferencesManager.shared.soundList[0]
private var selectedSnooze = DataReferencesManager.shared.snoozeList[0]
private var selectedRepeat = [WeekdayRepeat]()

var alarmMenuItemData: [AlarmMenuItem] = [
    AlarmMenuItem(title: "", subtitle: ""),
    AlarmMenuItem(title: "Repeat", subtitle: ""),
    AlarmMenuItem(title: "Sounds", subtitle: selectedSound.title),
    AlarmMenuItem(title: "Snooze", subtitle: selectedSnooze.title),
    AlarmMenuItem(title: "Title", subtitle: "")
]

