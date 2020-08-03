//
//  ColorWorldsVC.swift
//  ColorMatcher
//
//  Created by Sam Deverett on 7/21/20.
//  Copyright © 2020 Sam Deverett. All rights reserved.
//

import UIKit

class ColorWorldsVC: UIViewController {
    
    @IBAction func unwindToColorWorlds(segue:UIStoryboardSegue) { }

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        General.setWorldsLocked()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? ColorWorldOptionsVC, let index = tableView.indexPathsForSelectedRows?.first {
            destinationVC.mainColor = Constants.worldColors[index.row]
            destinationVC.otherColorOptions = Constants.worldColors.filter() {$0 != Constants.worldColors[index.row]}
            destinationVC.worldGradientKey = Constants.worldGradientKeys[index.row]
            destinationVC.worldNumber = index.row
        }
    }

}
