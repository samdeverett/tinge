//
//  Levels.swift
//  ColorMatcher
//
//  Created by Sam Deverett on 7/14/20.
//  Copyright © 2020 Sam Deverett. All rights reserved.
//

import UIKit

extension UIColor {
    
    func toColor(_ color: UIColor, percentage: CGFloat) -> UIColor {
        let percentage = max(min(percentage, 100), 0) / 100
        switch percentage {
            case 0: return self
            case 1: return color
            default:
                var (r1, g1, b1, a1): (CGFloat, CGFloat, CGFloat, CGFloat) = (0, 0, 0, 0)
                var (r2, g2, b2, a2): (CGFloat, CGFloat, CGFloat, CGFloat) = (0, 0, 0, 0)
                guard self.getRed(&r1, green: &g1, blue: &b1, alpha: &a1) else { return self }
                guard color.getRed(&r2, green: &g2, blue: &b2, alpha: &a2) else { return self }

            return UIColor(red: CGFloat(r1 + (r2 - r1) * percentage),
                           green: CGFloat(g1 + (g2 - g1) * percentage),
                           blue: CGFloat(b1 + (b2 - b1) * percentage),
                           alpha: CGFloat(a1 + (a2 - a1) * percentage))
        }
    }
    
}

extension ColorWorldLevelsVC {

    func createLevelColors() -> [UIColor] {
        var levels: [UIColor] = []
        var level: UIColor
        var i: CGFloat = 0
        for _ in 1...Constants.numberLevels {
            level = mainColor.toColor(otherColor, percentage: i)
            levels.append(level)
            i += CGFloat(100 / Constants.numberLevels)
        }
        return levels
    }
    
}

//func createRow(high: CGFloat, middle: CGFloat, low: CGFloat) -> [[CGFloat]] {
//    return [[low, high, low], [low, high, middle], [low, high, high], [low, middle, high], [low, low, high]]
//}
//
//func concatonateRows(first: [[CGFloat]], second: [[CGFloat]]) -> [[CGFloat]] {
//    return first + second
//}
//
//func createPalette() -> [[CGFloat]] {
//    return concatonateRows(first: createRow(high: 102 / 255, middle: 51 / 255, low: 0 / 255), second: concatonateRows(first: createRow(high: 153 / 255, middle: 76 / 255, low: 0 / 255), second: concatonateRows(first: createRow(high: 204 / 255, middle: 102 / 255, low: 0 / 255), second: concatonateRows(first: createRow(high: 255 / 255, middle: 128 / 255, low: 0 / 255), second: concatonateRows(first: createRow(high: 255 / 255, middle: 153 / 255, low: 51 / 255), second: concatonateRows(first: createRow(high: 255 / 255, middle: 178 / 255, low: 102 / 255), second: concatonateRows(first: createRow(high: 255 / 255, middle: 204 / 255, low: 153 / 255), second: createRow(high: 255 / 255, middle: 229 / 255, low: 204 / 255))))))))
//}

class ColorWorldLevels {
    
    var levelColors: [UIColor] = []
    var levelsUnlocked: Int = Constants.numberLevels
    
    init(mainColor: UIColor, otherColor: UIColor) {
        var level: UIColor
        var i: CGFloat = 0
        for _ in 1...Constants.numberLevels {
            level = mainColor.toColor(otherColor, percentage: i)
            self.levelColors.append(level)
            i += CGFloat(100 / Constants.numberLevels)
        }
    }
    
}
