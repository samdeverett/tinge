//
//  JourneyVC.swift
//  ColorMatcher
//
//  Created by Sam Deverett on 7/14/20.
//  Copyright © 2020 Sam Deverett. All rights reserved.
//

import UIKit

class JourneyVC: UIViewController {
    
    @IBOutlet weak var levelsCollectionView: UICollectionView!
    
    @IBAction func unwindToLevels(segue:UIStoryboardSegue) { }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (Int(levelsCollectionView.bounds.width) / Constants.levelsPerRow) - 2, height: Constants.levelHeight)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 2
        levelsCollectionView.collectionViewLayout = layout
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? LevelVC, let index = levelsCollectionView.indexPathsForSelectedItems?.first {
            destinationVC.targetColors = ColorLevels.levelColors[index.row]
        }
    }

}
