//
//  Hint.swift
//  ColorMatcher
//
//  Created by Sam Deverett on 7/19/20.
//  Copyright © 2020 Sam Deverett. All rights reserved.
//

import UIKit

class Hint {
    
    static func give(sliders: [UISlider], targetColors: [CGFloat], enabledSliders: [UISlider]) -> [UISlider] {
        let (sliderToChange, sliderColor, valueToChangeTo) = Slider.sliderMostOff(sliders: sliders, targetColors: targetColors)
        sliderToChange.value = Float(valueToChangeTo)
        Slider.disableSliders(sliders: [sliderToChange])
        Slider.adjustColor(color: sliderColor, redSlider: sliders[0], greenSlider: sliders[1], blueSlider: sliders[2])
        let newEnabledSliders = enabledSliders.filter() {$0 != sliderToChange}
        return newEnabledSliders
    }
    
}
