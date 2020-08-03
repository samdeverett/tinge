//
//  LevelGestures.swift
//  ColorMatcher
//
//  Created by Sam Deverett on 7/14/20.
//  Copyright © 2020 Sam Deverett. All rights reserved.
//

import UIKit

extension LevelVC {
    
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
                view.backgroundColor = ColorConverter.rgbToUIColor(rgb: targetColors)
                Animations.fadeInBorder(target: targetColor)
                if !levelsBeat.contains(where: { $0 as! Int == levelNumber } ) {
                    levelsBeat.append(levelNumber)
                }
                UserDefaults.standard.setValue(levelsBeat, forKey: worldGradientLevelKey)
                levelsBeat = UserDefaults.standard.array(forKey: worldGradientLevelKey)!
                if levelsBeat.count < Constants.numberLevels {
                    nextLevelNumber = getNextLevelNumber()
                    targetColors = nextTargetColors[nextLevelNumber]!
                    Animations.transitionTargetColors(target: targetColor, nextTargetColors: targetColors)
                    Slider.enableSliders(sliders: sliders)
                } else if levelsBeat.count == Constants.numberLevels {
                    targetColor.layer.borderWidth = CGFloat(Constants.borderAnimationWidth)
                    targetColor.layer.cornerRadius = targetColor.bounds.width / 2
                    targetColor.layer.masksToBounds = true
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//                        self.performSegue(withIdentifier: "unwindToLevels", sender: self)
//                    }
                }
                levelNumber = nextLevelNumber
            } else {
                Animations.shakeTarget(target: targetColor)
            }
        }
    }
    
    func getNextLevelNumber() -> Int {
        var potentialNextNumber = Int.random(in: 1...Constants.numberLevels)
        while true {
            if levelsBeat.contains(where: { $0 as! Int == potentialNextNumber } ) {
                potentialNextNumber = Int.random(in: 1...Constants.numberLevels)
                continue
            } else {
                return potentialNextNumber
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
