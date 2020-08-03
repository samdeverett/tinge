//
//  ViewControllerHelperFunctions.swift
//  ColorMatcher
//
//  Created by Sam Deverett on 7/3/20.
//  Copyright © 2020 Sam Deverett. All rights reserved.
//

import UIKit

extension GameVC {
    
    func hideGoButton() {
        goButton.isEnabled = false
        UIView.animate(withDuration: 0.2, delay: 0,animations: {
                self.goButton.alpha = 0
            }, completion: { finished in
                self.goButton.isHidden = true
        })
    }
    
    func showHintButton() {
        hintButton.isEnabled = true
        hintButton.isHidden = false
    }
    
    func showPauseButton() {
        playPauseButton.setImage(UIImage(systemName: "pause"), for: .normal)
        playPauseButton.isEnabled = true
        playPauseButton.isHidden = false
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
    }
    
    func updateHighScores() {
        let highScoreKeys = ["30", "60", "180", "300", "600"]
        for key in highScoreKeys {
            if key == "\(totalSeconds)" {
                if score > highScore {
                    highScore = score
                    UserDefaults.standard.set(highScore, forKey: "\(totalSeconds)")
                    highScoreHints = scoreHints
                    UserDefaults.standard.set(highScoreHints, forKey: "\(totalSeconds)" + "hints")
                }
            } else {
                if UserDefaults.standard.object(forKey: key) == nil {
                    UserDefaults.standard.set(0, forKey: key)
                    UserDefaults.standard.set(0, forKey: key + "hints")
                }
            }
        }
    }

}
