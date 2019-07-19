//
//  RepeatViewController.swift
//  DigitalClock_version2
//
//  Created by Nguyen Thuy Thuy Vi on 7/19/19.
//  Copyright © 2019 Nguyen Thuy Thuy Vi. All rights reserved.
//

import UIKit

class RepeatViewController: UIViewController {
    
    class func create() -> RepeatViewController {
        let controller = RepeatViewController(nibName: "RepeatViewController", bundle: nil)
        return controller
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
