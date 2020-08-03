//
//  MenuSetUp.swift
//  ColorMatcher
//
//  Created by Sam Deverett on 7/16/20.
//  Copyright © 2020 Sam Deverett. All rights reserved.
//

import UIKit

extension MenuVC {
    
    func setUpBackgroundColor() {
        view.backgroundColor = backgroundColor
    }
    
    func setUpOtherColors() {
        
        for label in labels {
            label.textColor = oppositeBackgroundColor
        }
        
        for segmentedControl in segmentedControls {
            segmentedControl.backgroundColor = oppositeBackgroundColor
            segmentedControl.selectedSegmentTintColor = backgroundColor
            let selectedTitleTextAttributes = [NSAttributedString.Key.foregroundColor: oppositeBackgroundColor]
            segmentedControl.setTitleTextAttributes(selectedTitleTextAttributes as [NSAttributedString.Key : Any], for: .selected)
            let unselectedTitleTextAttributes = [NSAttributedString.Key.foregroundColor: backgroundColor]
            segmentedControl.setTitleTextAttributes(unselectedTitleTextAttributes as [NSAttributedString.Key : Any], for: .normal)
        }
        
        for button in buttons {
            button.backgroundColor = oppositeBackgroundColor
            button.setTitleColor(backgroundColor, for: .normal)
            button.layer.cornerRadius = 10
            button.layer.masksToBounds = true
        }
        
    }
    
    func setUpHighScores() {
        ThirtySecondsHighScore.text = "\(UserDefaults.standard.integer(forKey: "30"))"
        OneMinuteHighScore.text = "\(UserDefaults.standard.integer(forKey: "60"))"
        ThreeMinuteHighScore.text = "\(UserDefaults.standard.integer(forKey: "180"))"
        FiveMinuteHighScore.text = "\(UserDefaults.standard.integer(forKey: "300"))"
        TenMinuteHighScore.text = "\(UserDefaults.standard.integer(forKey: "600"))"
    }
    
    func getSelectedTimeOption() {
        let options = [30, 60, 180, 300, 600]
        let selectedIndex = timeOptions.selectedSegmentIndex
        selectedTimeOption = options[selectedIndex]
    }
    
}
