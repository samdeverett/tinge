//
//  Slider.swift
//  ColorMatcher
//
//  Created by Sam Deverett on 7/19/20.
//  Copyright © 2020 Sam Deverett. All rights reserved.
//

import UIKit

class Slider {
    
    static func adjustColor(color: String, redSlider: UISlider, greenSlider: UISlider, blueSlider: UISlider) {
        switch color {
            case "red":
                redSlider.tintColor = UIColor(red: CGFloat(redSlider.value), green: 0.0, blue: 0.0, alpha: 1)
                redSlider.thumbTintColor = UIColor(red: CGFloat(redSlider.value), green: 0.0, blue: 0.0, alpha: 1)
            case "green":
                greenSlider.tintColor = UIColor(red: 0.0, green: CGFloat(greenSlider.value), blue: 0.0, alpha: 1)
                greenSlider.thumbTintColor = UIColor(red: 0.0, green: CGFloat(greenSlider.value), blue: 0.0, alpha: 1)
            case "blue":
                blueSlider.tintColor = UIColor(red: 0.0, green: 0.0, blue: CGFloat(blueSlider.value), alpha: 1)
                blueSlider.thumbTintColor = UIColor(red: 0.0, green: 0.0, blue: CGFloat(blueSlider.value), alpha: 1)
            default:
                print("Invalid color")
        }
    }
    
    static func disableSliders(sliders: [UISlider]) {
        for slider in sliders {
            slider.isEnabled = false
            slider.isHighlighted = false
        }
    }
    
    static func enableSliders(sliders: [UISlider]) {
        for slider in sliders {
            slider.isEnabled = true
            slider.isHighlighted = true
        }
    }
    
    static func sliderMostOff(sliders: [UISlider], targetColors: [CGFloat]) -> (UISlider, String, CGFloat) {
        var sliderDistancesOff: [CGFloat] = []
        var i = 0
        for slider in sliders {
            let amountOff = abs(CGFloat(slider.value) - targetColors[i])
            sliderDistancesOff.append(amountOff)
            i += 1
        }
        let amountMostOff = sliderDistancesOff.max()!
        let indexOfSliderMostOff = sliderDistancesOff.firstIndex(of: amountMostOff)!
        let sliderMostOff = sliders[indexOfSliderMostOff]
        let sliderColor = ["red", "green", "blue"][indexOfSliderMostOff]
        let correctValue = targetColors[indexOfSliderMostOff]
        return (sliderMostOff, sliderColor, correctValue)
    }
    
}
