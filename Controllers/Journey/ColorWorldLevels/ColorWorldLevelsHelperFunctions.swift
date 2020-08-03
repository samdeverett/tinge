//
//  ColorWorldLevelsHelperFunctions.swift
//  ColorMatcher
//
//  Created by Sam Deverett on 7/21/20.
//  Copyright © 2020 Sam Deverett. All rights reserved.
//

import UIKit

extension ColorWorldLevelsVC {

    func createLevels() {
        var level: [CGFloat]
        var levelNumber: Int = 1
        var i: CGFloat = 0
        while levelNumber <= Constants.numberLevels {
            level = gradientToColor(fromColor: mainColor, toColor: otherColor, percentage: i)
            levels[levelNumber] = level
            levelNumber += 1
            i += CGFloat(100 / Constants.numberLevels)
        }
    }
    
    func gradientToColor(fromColor: [CGFloat], toColor: [CGFloat], percentage: CGFloat) -> [CGFloat] {
        let fromColorAsUI = ColorConverter.rgbToUIColor(rgb: fromColor)
        let toColorAsUI = ColorConverter.rgbToUIColor(rgb: toColor)
        let percentage = max(min(percentage, 100), 0) / 100
        switch percentage {
            case 0: return fromColor
            case 1: return toColor
            default:
                var (r1, g1, b1, a1): (CGFloat, CGFloat, CGFloat, CGFloat) = (0, 0, 0, 0)
                var (r2, g2, b2, a2): (CGFloat, CGFloat, CGFloat, CGFloat) = (0, 0, 0, 0)
                guard fromColorAsUI.getRed(&r1, green: &g1, blue: &b1, alpha: &a1) else { return fromColor }
                guard toColorAsUI.getRed(&r2, green: &g2, blue: &b2, alpha: &a2) else { return fromColor }

            return [CGFloat(r1 + (r2 - r1) * percentage),
                    CGFloat(g1 + (g2 - g1) * percentage),
                    CGFloat(b1 + (b2 - b1) * percentage),
                    CGFloat(a1 + (a2 - a1) * percentage)]
        }
    }
    
}
