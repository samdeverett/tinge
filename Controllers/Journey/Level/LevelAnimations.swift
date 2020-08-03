//
//  LevelAnimations.swift
//  ColorMatcher
//
//  Created by Sam Deverett on 7/14/20.
//  Copyright © 2020 Sam Deverett. All rights reserved.
//

import UIKit

extension LevelVC {
    
    func fadeInBorder() {
        let fadeInBorderAnimation: CABasicAnimation = CABasicAnimation(keyPath: "borderWidth")
        fadeInBorderAnimation.fromValue = 0.0
        fadeInBorderAnimation.toValue = 5.0
        fadeInBorderAnimation.duration = 2.0
        targetColor.layer.add(fadeInBorderAnimation, forKey: "Fade Border")
    }
    
    func shakeTarget() {
        let shake: CABasicAnimation = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true

        let from_point: CGPoint = CGPoint(x: targetColor.center.x - 5, y: targetColor.center.y)
        let from_value: NSValue = NSValue(cgPoint: from_point)

        let to_point:CGPoint = CGPoint(x: targetColor.center.x + 5, y: targetColor.center.y)
        let to_value:NSValue = NSValue(cgPoint: to_point)

        shake.fromValue = from_value
        shake.toValue = to_value
        targetColor.layer.add(shake, forKey: "position")
    }
    
}
