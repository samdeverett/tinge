//
//  ColorFunctions.swift
//  
//
//  Created by Sam Deverett on 7/19/20.
//

import UIKit

class ColorFunctions {

    static func randomRGB() -> CGFloat {
        return CGFloat.random(in: 0.0 ... 1.0)
    }
    
    static func getNewTargetColors() -> [CGFloat] {
        let redAmount = randomRGB()
        let greenAmount = randomRGB()
        let blueAmount = randomRGB()
        return [redAmount, greenAmount, blueAmount]
    }
    
    static func getInputColors(sliders: [UISlider]) -> [CGFloat] {
        let redInput = CGFloat(sliders[0].value)
        let greenInput = CGFloat(sliders[1].value)
        let blueInput = CGFloat(sliders[2].value)
        return [redInput, greenInput, blueInput]
    }
    
    static func getOppositeBackgroundColor(sliders: [UISlider]) -> UIColor {
        let oppositeRedInput = 1.0 - CGFloat(sliders[0].value) + Constants.oppositeBackgroundColorOffset
        let oppositeGreenInput = 1 - CGFloat(sliders[1].value) + Constants.oppositeBackgroundColorOffset
        let oppositeBlueInput = 1 - CGFloat(sliders[2].value) + Constants.oppositeBackgroundColorOffset
        let oppositeInputColors = [oppositeRedInput, oppositeGreenInput, oppositeBlueInput]
        return ColorConverter.rgbToUIColor(rgb: oppositeInputColors)
    }
    
}
