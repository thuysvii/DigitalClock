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

var alarmItemData: [AlarmItem] = [
    AlarmItem(title: "", subtitle: "", alarms: []),
    AlarmItem(title: "Repeat", subtitle: "", alarms: []),
    AlarmItem(title: "Sounds", subtitle: selectedSound.title, alarms: []),
    AlarmItem(title: "Snooze", subtitle: selectedSnooze.title, alarms: []),
    AlarmItem(title: "Title", subtitle: "", alarms: [])
]

