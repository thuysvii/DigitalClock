//
//  DataReferencesManager.swift
//  DigitalClock_version2
//
//  Created by Nguyen Thuy Thuy Vi on 7/22/19.
//  Copyright © 2019 Nguyen Thuy Thuy Vi. All rights reserved.
//

import UIKit

class DataReferencesManager {
    
    static let shared = DataReferencesManager()
    
    var soundList: [Sound] = soundsData
    var repeatList: [WeekdayRepeat] = repeatData
    var snoozeList: [Snooze] = snoozeData
    
}

// MARK: - Sounds
extension DataReferencesManager {
    
    private func refreshSelectedSound() {
        for var selectedSound in soundList {
            selectedSound.selectionFlag = false
        }
    }
    
    class func refreshSelectedSound() { DataReferencesManager.shared.refreshSelectedSound() }
}

// MARK: - Repeat
extension DataReferencesManager {
    
    private func refreshSelectedRepeat() {
        for var selectedRepeat in repeatList {
            selectedRepeat.selectionFlag = false
        }
    }
    
    class func refreshSelectedRepeat() { DataReferencesManager.shared.refreshSelectedRepeat() }
}

extension DataReferencesManager {
    
    private func refreshSelectedSnooze() {
        for var selectedSnooze in snoozeList {
            selectedSnooze.selectionFlag = false
        }
    }
    
    class func refreshSelectedSnooze() {
        DataReferencesManager.shared.refreshSelectedSnooze()
    }
}
