//
//  GiftViewCell.swift
//  DigitalClock_version2
//
//  Created by Nguyen Thuy Thuy Vi on 7/12/19.
//  Copyright © 2019 Nguyen Thuy Thuy Vi. All rights reserved.
//

import UIKit

class GiftViewCell: UITableViewCell {
    
    @IBOutlet weak var featureImage: UIImageView!
    @IBOutlet weak var featureNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func setData(_ data: FeatureVersion){
        let images = UIImage(named: data.image ?? "")
        self.featureImage.image = images
        self.featureNameLabel.text = data.brief
        self.featureNameLabel.numberOfLines = 2
        self.featureNameLabel.textColor = .white
    }

}
