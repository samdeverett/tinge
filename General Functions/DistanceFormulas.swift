//
//  DistanceFormulas.swift
//  ColorMatcher
//
//  Created by Sam Deverett on 7/19/20.
//  Copyright © 2020 Sam Deverett. All rights reserved.
//

import UIKit

class DistanceFormulas {
    
    static func euclidean(targetColors: [CGFloat], inputColors: [CGFloat]) -> CGFloat {
        return sqrt(pow((targetColors[0] - inputColors[0]), 2) + pow((targetColors[1] - inputColors[1]), 2) + pow((targetColors[2] - inputColors[2]), 2))
    }
    
    static func cie(targetColors: [CGFloat], inputColors: [CGFloat]) -> CGFloat {
        let Lab1 = ColorConverter.rgbToLab(rgb: targetColors)
        let Lab2 = ColorConverter.rgbToLab(rgb: inputColors)
        return DistanceFormulas.deltaE(labA: Lab1, labB: Lab2)
    }
    
    static func deltaE(labA: [CGFloat], labB: [CGFloat]) -> CGFloat {
        let deltaL = labA[0] - labB[0]
        let deltaA = labA[1] - labB[1]
        let deltaB = labA[2] - labB[2]
        let c1 = sqrt(labA[1] * labA[1] + labA[2] * labA[2])
        let c2 = sqrt(labB[1] * labB[1] + labB[2] * labB[2])
        let deltaC = c1 - c2
        var deltaH = deltaA * deltaA + deltaB * deltaB - deltaC * deltaC
        if deltaH < 0 {
            deltaH = 0
        } else {
            deltaH = sqrt(deltaH)
        }
        let sc = 1.0 + 0.045 * c1
        let sh = 1.0 + 0.015 * c1
        let deltaLKlsl = deltaL / (1.0)
        let deltaCkcsc = deltaC / (sc)
        let deltaHkhsh = deltaH / (sh)
        let i = deltaLKlsl * deltaLKlsl + deltaCkcsc * deltaCkcsc + deltaHkhsh * deltaHkhsh
        if i < 0 {
            return 0
        } else {
            return sqrt(i)
        }
    }
    
}
