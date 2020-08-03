//
//  General.swift
//  ColorMatcher
//
//  Created by Sam Deverett on 7/20/20.
//  Copyright © 2020 Sam Deverett. All rights reserved.
//

import UIKit

class General {
    
    static func matchedTargetColor(targetColors: [CGFloat], inputColors: [CGFloat]) -> Bool {
        let distance = DistanceFormulas.cie(targetColors: targetColors, inputColors: inputColors)
        if distance < Constants.cieColorDifferenceLeeway {
            return true
        } else {
            return false
        }
    }
    
    static func almostMatchedTargetColor(targetColors: [CGFloat], inputColors: [CGFloat]) -> Bool {
        let distance = DistanceFormulas.cie(targetColors: targetColors, inputColors: inputColors)
        if distance < Constants.cieAlmostColorDifferenceLeeway {
            return true
        } else {
            return false
        }
    }
    
    static func setWorldsLocked() {
        if UserDefaults.standard.object(forKey: "worldsUnlocked") == nil {
            UserDefaults.standard.setValue(1, forKey: "worldsUnlocked")
        }
    }
    
    static func setGradientsLocked(key: String) {
        for worldGradientKey in Constants.worldGradientKeys {
            if key == worldGradientKey {
                if UserDefaults.standard.object(forKey: worldGradientKey) == nil {
                    UserDefaults.standard.setValue(1, forKey: worldGradientKey)
                }
            }
        }
    }
    
    static func setLevelsLocked(key: String) {
        for worldGradientLevelKey in Constants.worldGradientLevelKeys {
            if key == worldGradientLevelKey {
                if UserDefaults.standard.object(forKey: worldGradientLevelKey) == nil {
                    UserDefaults.standard.setValue([1], forKey: worldGradientLevelKey)
                }
            }
        }
    }
    
    static func eraseData() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }
    
}
