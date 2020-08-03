//
//  ColorWorldLevelsSetUp.swift
//  ColorMatcher
//
//  Created by Sam Deverett on 7/21/20.
//  Copyright © 2020 Sam Deverett. All rights reserved.
//

import UIKit

extension ColorWorldLevelsVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return levels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "levelCell", for: indexPath) as! LevelCollectionViewCell
        let rowNum = indexPath.row
        if UserDefaults.standard.array(forKey: worldGradientLevelKey)!.contains(where: { $0 as! Int == rowNum + 1 }) {
            cell.backgroundColor = ColorConverter.rgbToUIColor(rgb: levels[rowNum + 1]!)
            cell.lockImage.isHidden = true
            cell.isUserInteractionEnabled = true
        } else {
            cell.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
            cell.lockImage.isHidden = false
            cell.lockImage.image = UIImage(systemName: "lock")
            cell.isUserInteractionEnabled = false
        }
        return cell
    }
    
}

extension ColorWorldLevelsVC: UICollectionViewDelegate {}
