//
//  TimerViewController.swift
//  DigitalClock_version2
//
//  Created by Nguyen Thuy Thuy Vi on 7/18/19.
//  Copyright © 2019 Nguyen Thuy Thuy Vi. All rights reserved.
//

import UIKit

class TimerViewController: BaseViewController {
    
    var timer: Timer?
    var second: Int = 0
    @IBOutlet weak var timerSlider: UISlider!
    @IBOutlet weak var timerLabel: UILabel!
    
    class func create() -> TimerViewController {
        let controller = TimerViewController(nibName: "TimerViewController", bundle: nil)
        return controller
    }
    
    override func viewDidLoad() {
        showBackButton()
        super.viewDidLoad()
    }
    
    override func setupUI() {
        setupTimeLabel()
        setupSlider()
//        countdownTimer()
    }
    
    override func setupNavigationBar() {
        navigation.bar.backgroundColor = UIColor("#51707A")
        navigation.item.title = "Timer"
        navigation.bar.titleTextAttributes = [.foregroundColor: UIColor.white,
                                              .font: UIFont.systemFont(ofSize: 16)]
    }
    
    override func showBackButton() {
        let image = UIImage(named: "ic_timer_back")
        let backButton = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(self.backButtonTapped(_:)))
        navigation.item.leftBarButtonItem = backButton
        navigation.item.leftBarButtonItem?.tintColor = .white
    }
    
    override func backButtonTapped(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }

}
// MARK: -Setup Layout
extension TimerViewController {
    
    // Setup label
    private func setupTimeLabel() {
        let font = UIFont(name: "Digital-7Mono", size: 200.0)
        timerLabel.font = font
        timerLabel.textColor = .green
    }
    
    private func setupSlider() {
        timerSlider.minimumValue = 0
        timerSlider.maximumValue = 3540
        timerSlider.minimumTrackTintColor = .black
        timerSlider.maximumTrackTintColor = .white
        let image = UIImage(named: "ic_hourly-alarm")
        timerSlider.setThumbImage(image, for: .normal)
    }
    
    private func secondsToString(totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

// MARK: -Countdown time.
extension TimerViewController {
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        second = Int(sender.value)
        timerLabel.text = secondsToString(totalSeconds: second)
        timer?.invalidate()
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countdownTimer), userInfo: nil, repeats: true)
    }
    
    @objc func countdownTimer(){
        second -= 1
        timerLabel.text = self.secondsToString(totalSeconds: second)
        timerSlider.setValue(Float(second), animated: true)
    }
}
