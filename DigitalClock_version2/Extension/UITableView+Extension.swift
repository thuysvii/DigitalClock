//
//  UITableView+Extension.swift
//  DigitalClock_version2
//
//  Created by Nguyen Thuy Thuy Vi on 7/12/19.
//  Copyright © 2019 Nguyen Thuy Thuy Vi. All rights reserved.
//

import UIKit

// MARK: Cell
extension UITableViewCell {
    
    static var className: String {
        return String(describing: self)
    }
    
    static var identifier: String {
        return self.className
    }
    
    //    static var nib: UINib {
    //        return UINib(nibName: self.className, bundle: nil)
    //    }
    
}

// MARK: Table
extension UITableView {
    
    // Cell
    func registerCustomCell<T: UITableViewCell>(_: T.Type, fromNib: Bool = true) {
        if fromNib {
            self.register(T.nib, forCellReuseIdentifier: T.identifier)
        } else {
            self.register(T.self, forCellReuseIdentifier: T.identifier)
        }
    }
    
    func dequeueCustomCell<T: UITableViewCell>(_: T.Type) -> T {
        let cell = self.dequeueReusableCell(withIdentifier: T.identifier)
        return cell as! T// swiftlint:disable:this force_cast
    }
    
}
