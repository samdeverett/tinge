//
//  ScoreSetUp.swift
//  ColorMatcher
//
//  Created by Sam Deverett on 7/12/20.
//  Copyright © 2020 Sam Deverett. All rights reserved.
//

import UIKit

extension ScoreVC {
    
    func setUpBackgroundColor() {
        view.backgroundColor = backgroundColor
    }
    
    func setUpOtherColors(labels: [UILabel], buttons: [UIButton]) {
        
        for label in labels {
            label.textColor = oppositeBackgroundColor
        }
        
        for button in buttons {
            button.backgroundColor = oppositeBackgroundColor
            button.setTitleColor(backgroundColor, for: .normal)
            button.layer.cornerRadius = 10
            button.layer.masksToBounds = true
        }
        
    }
    
    func setUpScoreLabel() {
        scoreLabel.text = "\(String(describing: score!))"
    }
    
    func setUpScoreHintsLabel() {
        scoreNumberHints.text = "\(String(describing: scoreHints!))" + " Hints Used"
    }
    
    func setUpHighScoreLabel() {
        highScoreLabel.text = "\(String(describing: highScore!))"
    }
    
    func setUpHighScoreHintsLabel() {
        highScoreNumberHints.text = "\(String(describing: highScoreHints!))" + " Hints Used"
    }
    
}
