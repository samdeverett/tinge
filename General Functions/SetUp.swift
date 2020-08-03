//
//  SetUp.swift
//  ColorMatcher
//
//  Created by Sam Deverett on 7/19/20.
//  Copyright © 2020 Sam Deverett. All rights reserved.
//

import UIKit
//import ChameleonFramework

class SetUp {
    
    static func tutorial(label: UILabel) {
        if UserDefaults.standard.bool(forKey: "showTutorial") {
            label.isHidden = false
        } else {
            label.alpha = label.alpha
            // fade in
            UIView.animate(withDuration: 1.0, animations: {
                label.alpha = 0.0
            })
        }
    }
    
    static func backgroundColor(sliders: [UISlider], vc: UIViewController) {
        let inputColors = ColorFunctions.getInputColors(sliders: sliders)
        vc.view.backgroundColor = ColorConverter.rgbToUIColor(rgb: inputColors)
    }
    
    static func otherColors(sliders: [UISlider], buttons: [UIButton], labels: [UILabel]) {
        let oppositeBackgroundColor = ColorFunctions.getOppositeBackgroundColor(sliders: sliders)
        for button in buttons {
            button.tintColor = oppositeBackgroundColor
            button.setTitleColor(oppositeBackgroundColor, for: .normal)
            button.layer.borderColor = oppositeBackgroundColor.cgColor
        }
        for label in labels {
            label.textColor = oppositeBackgroundColor
        }
        
//        let backgroundColor = ColorConverter.rgbToUIColor(rgb: ColorFunctions.getInputColors(sliders: sliders))
//        let oppositeBackgroundColor = ContrastColorOf(backgroundColor: backgroundColor, returnFlat: true)
//        for button in buttons {
//            button.tintColor = oppositeBackgroundColor
//            button.setTitleColor(oppositeBackgroundColor, for: .normal)
//            button.layer.borderColor = oppositeBackgroundColor.cgColor
//        }
//        for label in labels {
//            label.textColor = oppositeBackgroundColor
//        }
    }
    
    static func targetColor(target: UIImageView, targetColors: [CGFloat]) {
        target.backgroundColor = ColorConverter.rgbToUIColor(rgb: targetColors)
        target.layer.masksToBounds = true
        target.layer.cornerRadius = target.bounds.width / 2
    }

    static func sliders(sliders: [UISlider]) {
        var i = 0
        while i < sliders.count {
            let slider = sliders[i]
            let randomColorValue = ColorFunctions.randomRGB()
            slider.value = Float(randomColorValue)
            var colors: [CGFloat] = [0.0, 0.0, 0.0]
            colors[i] = randomColorValue
            slider.tintColor = ColorConverter.rgbToUIColor(rgb: colors)
            slider.maximumTrackTintColor = .white
            slider.thumbTintColor = ColorConverter.rgbToUIColor(rgb: colors)
            i += 1
        }
    }
    
}
