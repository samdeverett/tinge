//
//  ViewControllerUISetUp.swift
//  ColorMatcher
//
//  Created by Sam Deverett on 7/3/20.
//  Copyright © 2020 Sam Deverett. All rights reserved.
//

import UIKit
import AVFoundation

extension GameVC {
    
    func resetScore() {
        score = 0
    }
    
    func resetScoreHints() {
        scoreHints = 0
    }
    
    func resetHighScore() {
        if UserDefaults.standard.object(forKey: "\(totalSeconds)") != nil {
            highScore = UserDefaults.standard.integer(forKey: "\(totalSeconds)")
        }
    }
    
    func resetHighScoreHints() {
        if UserDefaults.standard.object(forKey: "\(totalSeconds)" + "hints") != nil {
            highScoreHints = UserDefaults.standard.integer(forKey: "\(totalSeconds)" + "hints")
        }
    }
    
    func resetSecondsLeft() {
        secondsLeftLabel.adjustsFontSizeToFitWidth = true
        secondsLeftLabel.text = "\(totalSeconds)"
        secondsLeft = totalSeconds
    }
    
    func setUpGoButton() {
        goButton.layer.cornerRadius = goButton.bounds.width / 2
        goButton.layer.borderWidth = Constants.borderWidth
        goButton.layer.masksToBounds = true
    }
    
}
