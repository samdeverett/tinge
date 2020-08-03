//
//  Constants.swift
//  ColorMatcher
//
//  Created by Sam Deverett on 7/3/20.
//  Copyright © 2020 Sam Deverett. All rights reserved.
//

import UIKit

class Constants {
    
    static let cieColorDifferenceLeeway: CGFloat = 2.3
    static let cieAlmostColorDifferenceLeeway: CGFloat = 4.5
    static let euclidColorDifferenceLeeway: CGFloat = 0.125
    
    static let borderAnimationTime = 2.0
    static let borderAnimationWidth = 5.0
    static let transitionColorTime = 2.0
    static let shakeTime = 0.1
    static let shakeCount: Float = 2.0
    static let shakeDistance: CGFloat = 5.0
    
    static let oppositeBackgroundColorOffset: CGFloat = 0.3
    
    static let borderWidth: CGFloat = 3
    
    static let numberLevels = 15
    static let levelsPerRow = 5
    static let numberGradients = worldColors.count - 1
    
    static let black: [CGFloat] = [30 / 255, 30 / 255, 30 / 255]
    static let red: [CGFloat] = [255 / 255, 59 / 255, 48 / 255]
    static let orange: [CGFloat] = [255 / 255, 149 / 255, 0 / 255]
    static let yellow: [CGFloat] = [255 / 255, 204 / 255, 0 / 255]
    static let green: [CGFloat] = [52 / 255, 199 / 255, 89 / 255]
    static let blue: [CGFloat] = [0 / 255, 122 / 255, 255 / 255]
    static let purple: [CGFloat] = [175 / 255, 82 / 255, 222 / 255]
    static let white: [CGFloat] = [254 / 255, 254 / 255, 254 / 255]
    static let worldColors: [[CGFloat]] = [black, red, orange, yellow, green, blue, purple, white]
    static let worldKeys = ["black", "red", "orange", "yellow", "green", "blue", "purple", "white"]
    static let worldGradientKeys = ["blackGradientsUnlocked", "redGradientsUnlocked", "orangeGradientsUnlocked", "yellowGradientsUnlocked", "greenGradientsUnlocked", "blueGradientsUnlocked", "purpleGradientsUnlocked", "whiteGradientsUnlocked"]
    static let worldGradientLevelKeys =
        ["blackWorldRedGradientLevelsUnlocked", "blackWorldOrangeGradientLevelsUnlocked", "blackWorldYellowGradientLevelsUnlocked", "blackWorldGreenGradientLevelsUnlocked", "blackWorldBlueGradientLevelsUnlocked", "blackWorldPurpleGradientLevelsUnlocked", "blackWorldWhiteGradientLevelsUnlocked",
        "redWorldBlackGradientLevelsUnlocked", "redWorldOrangeGradientLevelsUnlocked", "redWorldYellowGradientLevelsUnlocked", "redWorldGreenGradientLevelsUnlocked", "redWorldBlueGradientLevelsUnlocked", "redWorldPurpleGradientLevelsUnlocked", "redWorldWhiteGradientLevelsUnlocked",
        "orangeWorldBlackGradientLevelsUnlocked", "orangeWorldRedGradientLevelsUnlocked", "orangeWorldYellowGradientLevelsUnlocked", "orangeWorldGreenGradientLevelsUnlocked", "orangeWorldBlueGradientLevelsUnlocked", "orangeWorldPurpleGradientLevelsUnlocked", "orangeWorldWhiteGradientLevelsUnlocked",
        "yellowWorldBlackGradientLevelsUnlocked", "yellowWorldRedGradientLevelsUnlocked", "yellowWorldOrangeGradientLevelsUnlocked", "yellowWorldGreenGradientLevelsUnlocked", "yellowWorldBlueGradientLevelsUnlocked", "yellowWorldPurpleGradientLevelsUnlocked", "yellowWorldWhiteGradientLevelsUnlocked",
        "greenWorldBlackGradientLevelsUnlocked", "greenWorldRedGradientLevelsUnlocked", "greenWorldOrangeGradientLevelsUnlocked", "greenWorldYellowGradientLevelsUnlocked", "greenWorldBlueGradientLevelsUnlocked", "greenWorldPurpleGradientLevelsUnlocked", "greenWorldWhiteGradientLevelsUnlocked",
        "blueWorldBlackGradientLevelsUnlocked", "blueWorldRedGradientLevelsUnlocked", "blueWorldOrangeGradientLevelsUnlocked", "blueWorldYellowGradientLevelsUnlocked", "blueWorldGreenGradientLevelsUnlocked", "blueWorldPurpleGradientLevelsUnlocked", "blueWorldWhiteGradientLevelsUnlocked",
        "purpleWorldBlackGradientLevelsUnlocked", "purpleWorldRedGradientLevelsUnlocked", "purpleWorldOrangeGradientLevelsUnlocked", "purpleWorldYellowGradientLevelsUnlocked", "purpleWorldGreenGradientLevelsUnlocked", "purpleWorldBlueGradientLevelsUnlocked", "purpleWorldWhiteGradientLevelsUnlocked",
        "whiteWorldBlackGradientLevelsUnlocked", "whiteWorldRedGradientLevelsUnlocked", "whiteWorldOrangeGradientLevelsUnlocked", "whiteWorldYellowGradientLevelsUnlocked", "whiteWorldGreenGradientLevelsUnlocked", "whiteWorldBlueGradientLevelsUnlocked", "whiteWorldPurpleGradientLevelsUnlocked"]
    
}
