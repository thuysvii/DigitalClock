//
//  ThemeViewController.swift
//  DigitalClock_version2
//
//  Created by Nguyen Thuy Thuy Vi on 7/15/19.
//  Copyright © 2019 Nguyen Thuy Thuy Vi. All rights reserved.
//

import UIKit
import EachNavigationBar
import UIColor_Hex_Swift

class ThemeViewController: BaseViewController {
    
    @IBOutlet weak var unlockButton: UIButton!
    @IBOutlet weak var themeCollectionView: UICollectionView!
    
    var themes: [Theme] = themeData
    var selectThemeHander: ((Theme) -> Void)?
    var selectedIndex: IndexPath?
    
    class func create() -> ThemeViewController {
        let controller = ThemeViewController(nibName: "ThemeViewController", bundle: nil)
        return controller
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupUI() {
        self.view.backgroundColor = UIColor("#51707A")
        unlockButton.layer.cornerRadius = 16
        setupCollectionView()
        showBackButton()
    }
    
    override func setupNavigationBar() {
        navigation.bar.backgroundColor = UIColor("#51707A")
        navigation.item.title = "Change skin"
        navigation.bar.titleTextAttributes = [.foregroundColor: UIColor.white,
                                              .font: UIFont.systemFont(ofSize: 16)]
    }
    
    override func showBackButton() {
        let image = UIImage(named: "ic_close_theme")
        let backButton = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(self.backButtonTapped(_:)))
        navigation.item.leftBarButtonItem = backButton
        navigation.item.leftBarButtonItem?.tintColor = .white
    }
    
    override func backButtonTapped(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension ThemeViewController {
    
    @IBAction func unlockThemeButton(_ sender: Any) {
        UIApplication.shared.openURL(NSURL(string: "itms://itunes.apple.com/de/app/x-gift/id839686104?mt=8&uo=4")! as URL)
    }
    
}

    // MARK: - CollectionView
extension ThemeViewController {

    private func setupCollectionView() {
        themeCollectionView.dataSource = self
        themeCollectionView.delegate = self
        themeCollectionView.backgroundColor = UIColor("#51707A")
        let cellNib = UINib(nibName: "ThemeCollectionViewCell", bundle: nil)
        themeCollectionView.register(cellNib, forCellWithReuseIdentifier: "themeCell")
    }
    
}

extension ThemeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return themes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "themeCell", for: indexPath) as! ThemeCollectionViewCell
        cell.setupLayout(themes[indexPath.item])
        cell.isSelected = true
        if (indexPath == selectedIndex) {
            cell.setupSelectedTheme()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "themeCell", for: indexPath) as! ThemeCollectionViewCell
        cell.setupSelectedTheme()
//        print("OH YAY")
        self.selectedIndex = indexPath
        let theme = themes[indexPath.item]
        selectThemeHander?(theme)
        self.dismiss(animated: true, completion: nil)
        collectionView.reloadData()
    }
}

extension ThemeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // width of collectionview / 2 - spacing of between rows.
        let width: CGFloat = collectionView.bounds.size.width * 0.5 - 5.0 // ROWS
        let height: CGFloat = width * 0.5 // COLUMN
        return CGSize(width: width, height: height)
    }
}
