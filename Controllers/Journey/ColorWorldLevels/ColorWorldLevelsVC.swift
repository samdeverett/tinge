//
//  ColorWorldLevelsVC.swift
//  ColorMatcher
//
//  Created by Sam Deverett on 7/21/20.
//  Copyright © 2020 Sam Deverett. All rights reserved.
//

import UIKit

class ColorWorldLevelsVC: UIViewController {
    
    var worldGradientKey: String!
    var worldGradientLevelKey: String!
    
    var nextWorldAlreadyUnlocked: Bool = false
    var gradientsUnlocked: Int = 0
    
    var mainColor: [CGFloat]!
    var otherColor: [CGFloat]!
    var levels: [Int: [CGFloat]] = [:]
    var levelsBeat: [Any] = []

    @IBOutlet weak var levelsCollectionView: UICollectionView!
    
    @IBAction func unwindToLevels(segue:UIStoryboardSegue) { }

    override func viewDidLoad() {
        super.viewDidLoad()
        createLevels()
        General.setLevelsLocked(key: worldGradientLevelKey)
        levelsBeat = UserDefaults.standard.array(forKey: worldGradientLevelKey)!
        if UserDefaults.standard.integer(forKey: worldGradientKey) >= Constants.numberGradients + 1 {
            nextWorldAlreadyUnlocked = true
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (Int(levelsCollectionView.bounds.width) / Constants.levelsPerRow) - 2, height: Int(levelsCollectionView.bounds.height) / (Constants.numberLevels / Constants.levelsPerRow))
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 2
        levelsCollectionView.collectionViewLayout = layout
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? ColorWorldOptionsVC {
            UserDefaults.standard.setValue(UserDefaults.standard.integer(forKey: worldGradientKey) + gradientsUnlocked, forKey: worldGradientKey)
            if (UserDefaults.standard.integer(forKey: worldGradientKey) == Constants.numberGradients + 1) && (!nextWorldAlreadyUnlocked) {
                destinationVC.worldsUnlocked += 1
            }
            destinationVC.tableView.reloadData()
        }
        if let destinationVC = segue.destination as? LevelVC, let index = levelsCollectionView.indexPathsForSelectedItems?.first {
            destinationVC.levelNumber = index.row + 1
            destinationVC.targetColors = levels[index.row + 1]!
//            let nextLevels = levels.filter { $0.key > (index.row + 1) }
//            let sortedNextLevels = nextLevels.sorted { $0.key < $1.key }
//            destinationVC.nextTargetColors = Array(sortedNextLevels.map({ $0.value }))
            destinationVC.nextTargetColors = levels.filter { level in levelsBeat.firstIndex(where: { $0 as! Int == level.key } ) == nil }
            destinationVC.worldGradientLevelKey = worldGradientLevelKey
        }
    }
}
