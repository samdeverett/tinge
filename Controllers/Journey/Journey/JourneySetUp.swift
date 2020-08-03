//
//  JourneySetUp.swift
//  ColorMatcher
//
//  Created by Sam Deverett on 7/14/20.
//  Copyright © 2020 Sam Deverett. All rights reserved.
//

import UIKit

extension JourneyVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ColorLevels.levelColors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "levelCell", for: indexPath) as! LevelCollectionViewCell
        let rowNum = indexPath.row
        if rowNum <= ColorLevels.levelsUnlocked - 1 {
            cell.backgroundColor = ColorConverter.rgbToUIColor(rgb: ColorLevels.levelColors[rowNum])
        } else {
            cell.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
            cell.lockImage.image = UIImage(systemName: "lock")
            cell.isUserInteractionEnabled = false
        }
        return cell
    }
    
}

extension JourneyVC: UICollectionViewDelegate {}
