//
//  ColorWorldOptionsVC.swift
//  ColorMatcher
//
//  Created by Sam Deverett on 7/21/20.
//  Copyright © 2020 Sam Deverett. All rights reserved.
//

import UIKit

class ColorWorldOptionsVC: UIViewController {
    
    var worldGradientKey: String!
    var worldNumber: Int = 0
    
    var mainColor: [CGFloat]!
    var otherColorOptions: [[CGFloat]]!
    var worldsUnlocked: Int = 0
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func unwindToColorWorldOptions(segue:UIStoryboardSegue) { }

    override func viewDidLoad() {
        super.viewDidLoad()
        General.setGradientsLocked(key: worldGradientKey)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? ColorWorldsVC {
            UserDefaults.standard.setValue(UserDefaults.standard.integer(forKey: "worldsUnlocked") + worldsUnlocked, forKey: "worldsUnlocked")
            destinationVC.tableView.reloadData()
        }
        if let destinationVC = segue.destination as? ColorWorldLevelsVC, let index = tableView.indexPathsForSelectedRows?.first {
            destinationVC.mainColor = mainColor
            destinationVC.otherColor = otherColorOptions[index.row]
            destinationVC.worldGradientKey = worldGradientKey
            destinationVC.worldGradientLevelKey = Constants.worldGradientLevelKeys[index.row + (worldNumber * 7)]
        }
    }

}
