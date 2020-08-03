//
//  FPHelperFunctions.swift
//  ColorMatcher
//
//  Created by Sam Deverett on 7/7/20.
//  Copyright © 2020 Sam Deverett. All rights reserved.
//

import UIKit

extension FreePlayVC {
    
    // RANDOM COLORS

    func getRandomRGBValue() -> CGFloat {
        return CGFloat.random(in: 0.0 ... 255.0)
    }
    
    func getNewTargetColor() -> UIColor {
        let redAmount = getRandomRGBValue() / 255.0
        let greenAmount = getRandomRGBValue() / 255.0
        let blueAmount = getRandomRGBValue() / 255.0
        targetColors = [redAmount, greenAmount, blueAmount]
        let newTargetColor = ColorConverter.rgbToUIColor(rgb: targetColors)
        print(targetColors)
        return newTargetColor
    }
    
    // INPUT COLORS
    
    func getRedInput() -> CGFloat {
        return CGFloat(redSlider!.value) / 255.0
    }
    
    func getGreenInput() -> CGFloat {
        return CGFloat(greenSlider!.value) / 255.0
    }
    
    func getBlueInput() -> CGFloat {
        return CGFloat(blueSlider!.value) / 255.0
    }
    
    func getInputColor() -> UIColor {
        let redInput = getRedInput()
        let greenInput = getGreenInput()
        let blueInput = getBlueInput()
        inputColors = [redInput, greenInput, blueInput]
        return ColorConverter.rgbToUIColor(rgb: inputColors)
    }
    
    func getOppositeBackgroundColor() -> UIColor {
        let oppositeRedInput = 1.0 - getRedInput() + 0.2
        let oppositeGreenInput = 1.0 - getGreenInput() + 0.2
        let oppositeBlueInput = 1.0 - getBlueInput() + 0.2
        let oppositeInputColors = [oppositeRedInput, oppositeGreenInput, oppositeBlueInput]
        return ColorConverter.rgbToUIColor(rgb: oppositeInputColors)
    }
    
    // SLIDERS
    
    func sliderChanged(color: String) {
        setUpBackgroundColor()
        switch color {
            case "red":
                redSlider.tintColor = UIColor(red: getRedInput(), green: 0.0, blue: 0.0, alpha: 1)
                redSlider.thumbTintColor = UIColor(red: getRedInput(), green: 0.0, blue: 0.0, alpha: 1)
            case "green":
                greenSlider.tintColor = UIColor(red: 0.0, green: getGreenInput(), blue: 0.0, alpha: 1)
                greenSlider.thumbTintColor = UIColor(red: 0.0, green: getGreenInput(), blue: 0.0, alpha: 1)
            case "blue":
                blueSlider.tintColor = UIColor(red: 0.0, green: 0.0, blue: getBlueInput(), alpha: 1)
                blueSlider.thumbTintColor = UIColor(red: 0.0, green: 0.0, blue: getBlueInput(), alpha: 1)
            default:
                print("Invalid color")
        }
    }
    
    func disableSliders() {
        for slider in sliders {
            slider.isEnabled = false
        }
    }
    
    func enableSliders() {
        for slider in sliders {
            slider.isEnabled = true
            slider.isHighlighted = true
        }
    }
    
    func sliderMostOff() -> (UISlider, String, CGFloat) {
        var sliderDistancesOff: [Float] = []
        var i = 0
        for slider in sliders {
            let amountOff = abs((slider.value / 255.0) - Float(targetColors[i]))
            sliderDistancesOff.append(amountOff)
            i += 1
        }
        let amountMostOff = sliderDistancesOff.max()!
        let indexOfSliderMostOff = sliderDistancesOff.firstIndex(of: amountMostOff)!
        let sliderMostOff = sliders[indexOfSliderMostOff]
        let sliderColor = ["red", "green", "blue"][indexOfSliderMostOff]
        let correctValue = targetColors[indexOfSliderMostOff] * 255.0
        return (sliderMostOff, sliderColor, correctValue)
    }
    
    func lockSlider(slider: UISlider) {
        slider.isEnabled = false
    }
    
    // MISCELLANEOUS
    
    func hitTarget() -> Bool {
        let distance = DistanceFormulas.cie(targetColors: targetColors, inputColors: inputColors)
        print(distance)
        if distance < 2.0 {
            return true
        } else {
            return false
        }
    }
    
    func changeOtherColors() {
        let oppositeBackgroundColor = getOppositeBackgroundColor()
        backButton.tintColor = oppositeBackgroundColor
        hintButton.tintColor = oppositeBackgroundColor
    }
    
//    func colorFromRGBValues(colors: [CGFloat]) -> UIColor {
//        return UIColor(red: colors[0], green: colors[1], blue: colors[2], alpha: 1)
//    }
    
//    func getEuclideanDistance(targetColors: [CGFloat], inputColors: [CGFloat]) -> CGFloat {
//        return sqrt(pow((targetColors[0] - inputColors[0]), 2) +                    pow((targetColors[1] - inputColors[1]), 2) + pow((targetColors[2] - inputColors[2]), 2))
//    }
    
//    func getCIEDistance(targetColors: [CGFloat], inputColors: [CGFloat]) -> CGFloat {
//        let Lab1 = ColorConverter.rgbToLab(rgb: targetColors)
//        let Lab2 = ColorConverter.rgbToLab(rgb: inputColors)
//        return ColorConverter.deltaE(labA: Lab1, labB: Lab2)
//    }
    
}
