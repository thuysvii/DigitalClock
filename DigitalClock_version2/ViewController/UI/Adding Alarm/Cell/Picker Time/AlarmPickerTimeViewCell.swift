//
//  AlarmPickerTimeViewCell.swift
//  DigitalClock_version2
//
//  Created by Nguyen Thuy Thuy Vi on 7/19/19.
//  Copyright © 2019 Nguyen Thuy Thuy Vi. All rights reserved.
//

import UIKit

class AlarmPickerTimeViewCell: UITableViewCell {
    
    @IBOutlet weak var titlePickerTime: UILabel!
    @IBOutlet weak var pickerTime: UIPickerView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupView() {
        titlePickerTime.textColor = .white
        pickerTime.backgroundColor = .black
        pickerTime.tintColor = .white
        pickerTime.dataSource = self
        pickerTime.delegate = self
        let currentTime = self.getCurrentTime()
        titlePickerTime.text = "Alarm Clock@ \(String(format: "%02d", currentTime.0)):\(String(format: "%02d", currentTime.1))"
        pickerTime.selectRow(currentTime.0, inComponent: 0, animated: true)
        pickerTime.selectRow(currentTime.1, inComponent: 1, animated: true)
    }
    
}

// MARK: -PickerView
extension AlarmPickerTimeViewCell: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 { return 24 }
        if component == 1 { return 60 }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(format: "%02d", row)
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let att = [NSAttributedString.Key.foregroundColor: UIColor.white]
        return NSAttributedString(string: String(format: "%02d", row), attributes: att)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let hour = pickerTime.selectedRow(inComponent: 0)
        let minutes = pickerTime.selectedRow(inComponent: 1)
        titlePickerTime.text = "Alarm Clock@ \(String(format: "%02d", hour)):\(String(format: "%02d", minutes))"
    }

}

extension AlarmPickerTimeViewCell {
    
    private func getCurrentTime() -> (Int, Int) {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        
        return (hour: hour, minutes: minutes)
    }
}
