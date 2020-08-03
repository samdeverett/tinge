//
//  Animations.swift
//  ColorMatcher
//
//  Created by Sam Deverett on 7/20/20.
//  Copyright © 2020 Sam Deverett. All rights reserved.
//

import UIKit
import ChameleonFramework

class Animations {
    
    static func fadeInBorder(target: UIImageView) {
        target.layer.borderColor = ContrastColorOf(backgroundColor: target.backgroundColor!, returnFlat: true).cgColor
        let fadeInBorderAnimation: CABasicAnimation = CABasicAnimation(keyPath: "borderWidth")
        fadeInBorderAnimation.fromValue = 0.0
        fadeInBorderAnimation.toValue = Constants.borderAnimationWidth
        fadeInBorderAnimation.duration = Constants.borderAnimationTime
        target.layer.add(fadeInBorderAnimation, forKey: "Fade Border")
    }
    
    static func transitionTargetColors(target: UIImageView, nextTargetColors: [CGFloat]) {
        UIView.animate(withDuration: Constants.transitionColorTime, delay: 0.0, options:[.curveEaseInOut], animations: {
            target.backgroundColor = ColorConverter.rgbToUIColor(rgb: nextTargetColors)
        })
    }
    
    static func shakeTarget(target: UIImageView) {
        
        let shake: CABasicAnimation = CABasicAnimation(keyPath: "position")
        
        shake.duration = Constants.shakeTime
        shake.repeatCount = Constants.shakeCount
        shake.autoreverses = true

        let from_point: CGPoint = CGPoint(x: target.center.x - Constants.shakeDistance, y: target.center.y)
        let from_value: NSValue = NSValue(cgPoint: from_point)

        let to_point:CGPoint = CGPoint(x: target.center.x + Constants.shakeDistance, y: target.center.y)
        let to_value:NSValue = NSValue(cgPoint: to_point)

        shake.fromValue = from_value
        shake.toValue = to_value
        target.layer.add(shake, forKey: "position")
    }
    
}
