//
//  FeaturesViewCell.swift
//  DigitalClock_version2
//
//  Created by Nguyen Thuy Thuy Vi on 7/11/19.
//  Copyright © 2019 Nguyen Thuy Thuy Vi. All rights reserved.
//

import UIKit

class FeaturesViewCell: UITableViewCell {
    
    @IBOutlet weak var featureImage: UIImageView!
    @IBOutlet weak var featureNameLabel: UILabel!
    @IBOutlet weak var featurePriceButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    @IBAction func featurePriceButtonClicked(_ sender: Any) {
        UIApplication.shared.openURL(NSURL(string: "itms://itunes.apple.com/de/app/x-gift/id839686104?mt=8&uo=4")! as URL)
    }

    func setData(_ featureItem: FeatureVersion) {
        self.featurePriceButton.layer.cornerRadius = 16
        self.featureNameLabel.text = featureItem.brief
        self.featureNameLabel.textColor = .white
        let images = UIImage(named: featureItem.image ?? "")
        self.featureImage.image = images
    }
}



