//
//  ColorWorldsSetUp.swift
//  ColorMatcher
//
//  Created by Sam Deverett on 7/21/20.
//  Copyright © 2020 Sam Deverett. All rights reserved.
//

import UIKit

extension ColorWorldsVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constants.worldColors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorWorldCell", for: indexPath) as! ColorWorldTableViewCell
        let rowNum = indexPath.row
        if rowNum < UserDefaults.standard.integer(forKey: "worldsUnlocked") {
            cell.backgroundColor = ColorConverter.rgbToUIColor(rgb: Constants.worldColors[rowNum])
            cell.lockImage.isHidden = true
            cell.isUserInteractionEnabled = true
        } else {
            cell.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
            cell.lockImage.image = UIImage(systemName: "lock")
            cell.isUserInteractionEnabled = false
        }
        return cell
    }
    
}

extension ColorWorldsVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.height / CGFloat(Constants.worldColors.count)
    }
    
}
