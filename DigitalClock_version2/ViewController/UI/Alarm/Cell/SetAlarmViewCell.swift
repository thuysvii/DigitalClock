//
//  SetAlarmViewCell.swift
//  DigitalClock_version2
//
//  Created by Nguyen Thuy Thuy Vi on 7/19/19.
//  Copyright © 2019 Nguyen Thuy Thuy Vi. All rights reserved.
//

import UIKit

class SetAlarmViewCell: UITableViewCell {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var repeatLabel: UILabel!
    @IBOutlet weak var sessionLabel: UILabel!
    @IBOutlet weak var alarmSwitch: UISwitch!
    @IBOutlet weak var viewdetailimage: UIImageView!
    
    private var selectedRepeat = [WeekdayRepeat]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool , animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setupData( alarm: Alarm) {
        let image = UIImage(named: "ic_view_more")
        viewdetailimage.image = image
        viewdetailimage.backgroundColor = .white
     
//        timeLabel.text = "\(String(format: "%02d", alarm.hour!)):\(String(format: "%02d", alarm.minutes!))"
        timeLabel.text = alarm.time
        timeLabel.textColor = .white
        
        let repeatDates = alarm.repeate
        repeatLabel.text = self.displayWeekdayRepeatTitle(repeatDates)
        repeatLabel.textColor = .white
        
        // FIXME: tự kiểm tra am pm theo giờ
        timeLabel.text = alarm.time
        let subtringHour = (timeLabel.text)?.prefix(2)
        let convertHourToString = String(subtringHour!)
        let hour = Int(convertHourToString) ?? 0
        print(hour)
        if hour > 12 {
            sessionLabel.text = "PM"
        } else {
            sessionLabel.text = "AM"
        }
        sessionLabel.textColor = .white
        
        alarmSwitch.isOn = true
    }
    
}

extension SetAlarmViewCell {
    
    private func displayWeekdayRepeatTitle(_ dates: [Int]?) -> String {
        guard let dates = dates else { return "No Repeat" }
        if dates.count == 0 {
            return "No Repeat"
        } else {
            if dates.count == 7 {
                return "Everyday"
            } else if dates.count == 5 &&
                dates.filter({ return $0 != 7 && $0 != 8 }).count == 5 {
                return "Every Weekday"
            } else if dates.count == 2 &&
                dates.filter({ return $0 != 7 && $0 != 8 }).count == 0 {
                return "Every Weekend"
            } else {
                let conditionRepeat = dates.map { value -> String in
                    switch value {
                    case 8: return "Sun"
                    case 2: return "Mon"
                    case 3: return "Tue"
                    case 4: return "Wed"
                    case 5: return "Thu"
                    case 6: return "Fri"
                    case 7: return "Sat"
                    default: return ""
                    }
                }
                return conditionRepeat.joined(separator: " ")
            }
        }
    }
}
