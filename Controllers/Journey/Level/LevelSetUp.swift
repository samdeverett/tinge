//
//  LevelSetUp.swift
//  ColorMatcher
//
//  Created by Sam Deverett on 7/14/20.
//  Copyright © 2020 Sam Deverett. All rights reserved.
//

import UIKit

extension LevelVC {
    
    func setUpSliders() {
        sliders = [redSlider, greenSlider, blueSlider]
        var i = 0
        while i < sliders.count {
            let slider = sliders[i]
            let randomValue = getRandomRGBValue()
            slider.value = Float(randomValue)
            var colors: [CGFloat] = [0.0, 0.0, 0.0]
            colors[i] = randomValue / 255.0
            slider.tintColor = ColorConverter.rgbToUIColor(rgb: colors)
            slider.maximumTrackTintColor = .white
            slider.thumbTintColor = ColorConverter.rgbToUIColor(rgb: colors)
            i += 1
        }
    }
    
    func setUpTargetColor(newTargetColor: UIColor) {
        targetColor.backgroundColor = newTargetColor
        targetColor.layer.masksToBounds = true
        targetColor.layer.cornerRadius = targetColor.bounds.width / 2
    }
    
    func setUpBackgroundColor() {
        view.backgroundColor = getInputColor()
    }
    
}
