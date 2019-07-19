//
//  UIView+Extension.swift
//  DigitalClock_version2
//
//  Created by Nguyen Thuy Thuy Vi on 7/12/19.
//  Copyright © 2019 Nguyen Thuy Thuy Vi. All rights reserved.
//

import UIKit

extension UIView {
    
    public class func fromNib(_ nibNameOrNil: String? = nil) -> Self {
        return fromNib(nibNameOrNil, type: self)
    }
    
    public class func fromNib<T: UIView>(_ nibNameOrNil: String? = nil, type: T.Type) -> T {
        let view: T? = fromNib(nibNameOrNil, type: T.self)
        return view!
    }
    
    public class func fromNib<T: UIView>(_ nibNameOrNil: String? = nil, type: T.Type) -> T? {
        var view: T?
        let name: String
        if let nibName = nibNameOrNil {
            name = nibName
        } else {
            name = nibName
        }
        let nibViews = Bundle.main.loadNibNamed(name, owner: nil, options: nil)
        for nibView in nibViews! {
            if let tog = nibView as? T {
                view = tog
            }
        }
        return view
    }
    
    public class var nibName: String {
        let name = "\(self)".components(separatedBy: ".").first ?? ""
        return name
    }
    
    public class var nib: UINib? {
        if Bundle.main.path(forResource: nibName, ofType: "nib") != nil {
            return UINib(nibName: nibName, bundle: nil)
        } else {
            return nil
        }
    }
    
}
