//
//  HomeViewController.swift
//  DigitalClock_version2
//
//  Created by Nguyen Thuy Thuy Vi on 7/9/19.
//  Copyright © 2019 Nguyen Thuy Thuy Vi. All rights reserved.
//

import UIKit
import EachNavigationBar

class HomeViewController: BaseViewController {
    
    @IBOutlet weak var timerButton: UIButton!
    @IBOutlet weak var alarmButton: UIButton!
    @IBOutlet weak var settingButton: UIButton!
    @IBOutlet weak var themeButton: UIButton!
    @IBOutlet weak var upgradeButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var weekdayLabel: UILabel!
    @IBOutlet weak var mainView: UIView!
    
    var timer = Timer()
    private var didSetupConstraints = false
    
    class func create() -> HomeViewController {
        let controller = HomeViewController(nibName: "HomeViewController", bundle: nil)
        return controller
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupUI() {
        setupTimerButton()
        setupAlarmButton()
        setupSettingButton()
        setupThemeButton()
        setupUpgradeButton()
        setupTimeLabel()
        setupSecondLabel()
        setupDateLabel()
        setupWeekdayLabel()
        countUpTimer()
    }

}

    // MARK: - Setting @objc
extension HomeViewController {
    
    // Countup timer - each seconds run >> datetime will change >> current datetime is Action.
    @objc
    private func setTimer() {
        timeLabel.text = getCurrentTime()
        secondLabel.text = getCurrentSeconds()
        dateLabel.text = getCurrentDate()
        weekdayLabel.text = getCurrentWeekday()
    }
}

    // MARK: - Setup UI.
extension HomeViewController {
    
    // Setup button
    private func setupTimerButton() {
        let image = UIImage(named: "ic_timer")
        timerButton.setImage(image, for: .normal)
        timerButton.tintColor = .green
        timerButton.addTarget(self, action: #selector(self.timerButtonClicked(_:)), for: .touchUpInside)
    }
    
    private func setupAlarmButton() {
        let image = UIImage(named: "ic_alarm")
        alarmButton.setImage(image, for: .normal)
        alarmButton.tintColor = .green
        alarmButton.addTarget(self, action: #selector(self.alarmButtonClicked(_:)), for: .touchUpInside)
    }
    
    private func setupSettingButton() {
        let image = UIImage(named: "ic_setting")
        settingButton.setImage(image, for: .normal)
        settingButton.tintColor = .green
        settingButton.addTarget(self, action: #selector(self.settingButtonClicked(_:)), for: .touchUpInside)
    }
    
    private func setupThemeButton() {
        let image = UIImage(named: "ic_theme")
        themeButton.setImage(image, for: .normal)
        themeButton.tintColor = .green
        themeButton.addTarget(self, action: #selector(self.themeButtonClicked(_:)), for: .touchUpInside)
    }
    
    private func setupUpgradeButton() {
        let image = UIImage(named: "ic_upgrade")
        upgradeButton.setImage(image, for: .normal)
        upgradeButton.tintColor = .green
        upgradeButton.addTarget(self, action: #selector(self.upgradeButtonClicked(_:)), for: .touchUpInside)
    }
    
    // Setup label
    private func setupTimeLabel() {
        let font = UIFont(name: "Digital-7Mono", size: 200.0)
        timeLabel.font = font
        timeLabel.textColor = .green
    }
    
    private func setupSecondLabel() {
        let font = UIFont(name: "Digital-7Mono", size: 100.0)
        secondLabel.font = font
        secondLabel.textColor = .green
    }
    
    private func setupDateLabel() {
        let font = UIFont(name: "Digital-7Mono", size: 24.0)
        dateLabel.font = font
        dateLabel.textColor = .green
    }
    
    private func setupWeekdayLabel() {
        let font = UIFont(name: "Digital-7Mono", size: 24.0)
        weekdayLabel.font = font
        weekdayLabel.textColor = .green
    }
    
}

    // MARK: - Getting current datetime.
extension HomeViewController {
    
    private func getCurrentTime() -> String {
        let date = Date()
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"
        let timeString = timeFormatter.string(from: date)
        return timeString
    }
    
    private func getCurrentSeconds() -> String {
        let date = Date()
        let secondsFormatter = DateFormatter()
        secondsFormatter.dateFormat = "ss"
        let secondString = secondsFormatter.string(from: date)
        return secondString
    }
    
    private func getCurrentDate() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM-dd-yyyy"
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    
    private func getCurrentWeekday() -> String {
        let date = Date()
        let weekdayFormatter = DateFormatter()
        weekdayFormatter.dateFormat = "EEE"
        let weekdayString = weekdayFormatter.string(from: date)
        return weekdayString
    }
    
    // Countup timer - each seconds run >> datetime will change >> current datetime is Action.
    private func countUpTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.setTimer), userInfo: nil, repeats: true)
    }
    
}

    // MARK: - IBAction.
extension HomeViewController {
    
    @objc
    @IBAction func timerButtonClicked(_ sender: Any){
        let controller = TimerViewController.create()
        let nav = UINavigationController(rootViewController: controller)
        nav.navigation.configuration.isEnabled = true
        self.present(nav, animated: true, completion: nil)
    }
    
    @objc
    @IBAction func settingButtonClicked(_ sender: Any){
        let controller = SettingViewController.create()
        let nav = UINavigationController(rootViewController: controller)
        nav.navigation.configuration.isEnabled = true
        self.present(nav, animated: true, completion: nil)
    }
    
    @objc
    @IBAction func alarmButtonClicked(_ sender: Any){
        let controller = SetAlarmViewController.create()
        let nav = UINavigationController(rootViewController: controller)
        nav.navigation.configuration.isEnabled = true
        self.present(nav, animated: true, completion: nil)
    }
    
    @objc
    @IBAction func themeButtonClicked(_ sender: Any){
        let controller = ThemeViewController.create()
        controller.selectThemeHander = {theme in
            self.changeTheme(theme: theme)
        }
        let nav = UINavigationController(rootViewController: controller)
        nav.navigation.configuration.isEnabled = true
        self.present(nav, animated: true, completion: nil)
    }
    
    @objc
    @IBAction func upgradeButtonClicked(_ sender: Any){
        let controller = UpgradeViewController.create()
        controller.modalTransitionStyle = . crossDissolve
        controller.modalPresentationStyle = .overCurrentContext
        self.present(controller, animated: true, completion: nil)
    }

}

    // MARK: - Change theme.
extension HomeViewController {
    
    private func changeTheme(theme: Theme) {
        let newColorText = theme.labelColor
        self.timeLabel.textColor = UIColor(newColorText!)
        self.secondLabel.textColor = UIColor(newColorText!)
        self.weekdayLabel.textColor = UIColor(newColorText!)
        self.dateLabel.textColor = UIColor(newColorText!)
        let newBackgroundTheme = theme.backgroundColor
        self.view.backgroundColor = UIColor(newBackgroundTheme!)
    }
}

