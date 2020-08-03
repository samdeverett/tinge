//
//  GameGestures.swift
//  ColorMatcher
//
//  Created by Sam Deverett on 7/20/20.
//  Copyright © 2020 Sam Deverett. All rights reserved.
//

import UIKit
import ChameleonFramework

extension GameVC {
    
    func setUpDoubleTapGestureRecognizer() {
        let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap(sender:)))
        doubleTapGesture.numberOfTapsRequired = 2
        objectForGestures.addGestureRecognizer(doubleTapGesture)
    }
    
    @objc func handleDoubleTap(sender: UITapGestureRecognizer) {
        UserDefaults.standard.setValue(false, forKey: "showTutorial")
        SetUp.tutorial(label: tutorialLabel)
        if sender.state == .ended {
            if General.matchedTargetColor(targetColors: targetColors, inputColors: ColorFunctions.getInputColors(sliders: sliders)) {
                Slider.disableSliders(sliders: sliders)
                targetColor.layer.borderWidth = 0
                score += 1
                view.backgroundColor = ColorConverter.rgbToUIColor(rgb: targetColors)
                targetColors = ColorFunctions.getNewTargetColors()
                Animations.fadeInBorder(target: targetColor)
                Animations.transitionTargetColors(target: targetColor, nextTargetColors: targetColors)
                Slider.enableSliders(sliders: sliders)
                enabledSliders = sliders
            } else {
                if General.almostMatchedTargetColor(targetColors: targetColors, inputColors: ColorFunctions.getInputColors(sliders: sliders)) {
                    print("True")
                    targetColor.layer.borderColor = ContrastColorOf(backgroundColor: ColorConverter.rgbToUIColor(rgb: targetColors), returnFlat: true).cgColor
                    targetColor.layer.borderWidth = 2.0
                }
                Animations.shakeTarget(target: targetColor)
            }
        }
    }
    
    func setUpHoldGestureRecognizer() {
        let holdGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleHold(sender:)))
        holdGesture.minimumPressDuration = 0.25
        objectForGestures.addGestureRecognizer(holdGesture)
    }
    
    @objc func handleHold(sender: UILongPressGestureRecognizer) {
        if sender.state != .ended {
            view.backgroundColor = .white
        } else {
            SetUp.backgroundColor(sliders: sliders, vc: self)
        }
    }
    
}
