//
//  BaseViewController.swift
//  DigitalClock_version2
//
//  Created by Nguyen Thuy Thuy Vi on 7/9/19.
//  Copyright © 2019 Nguyen Thuy Thuy Vi. All rights reserved.
//

import UIKit
import EachNavigationBar

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNavigationBar()
    }
    
    public func setupUI() { }
    
    public func setupNavigationBar() { }

}

extension BaseViewController {
    
    @objc func showBackButton() { }
    
    @objc func showDoneButton() { }
    
    @objc func showCancelButton() { }
    
    @IBAction func backButtonTapped(_ sender: AnyObject) {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonTapped(_ sender: AnyObject) {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonTapped(_ sender: AnyObject) {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
}
