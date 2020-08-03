//
//  Gestures.swift
//  ColorMatcher
//
//  Created by Sam Deverett on 7/5/20.
//  Copyright © 2020 Sam Deverett. All rights reserved.
//

import UIKit
import QuartzCore

extension FreePlayVC {
    
    func setUpDoubleTapGestureRecognizer() {
        let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(didDoubleTap))
        doubleTapGesture.numberOfTapsRequired = 2
        objectForGestures.addGestureRecognizer(doubleTapGesture)
    }
    
    @objc func didDoubleTap() {
        if hitTarget() {
            disableSliders()
            view.backgroundColor = ColorConverter.rgbToUIColor(rgb: targetColors)
            let newTargetColor = getNewTargetColor()
            fadeInBorder()
            transitionTargetColors(nextTarget: newTargetColor)
            self.enableSliders()
        } else {
            shakeTarget()
        }
    }
    
    func setUpHoldGestureRecognizer() {
        let holdGesture = UILongPressGestureRecognizer(target: self, action: #selector(onHold))
        holdGesture.minimumPressDuration = 0.25
        objectForGestures.addGestureRecognizer(holdGesture)
    }
    
    @objc func onHold(gestureRecognizer: UILongPressGestureRecognizer) {
        if gestureRecognizer.state != UIGestureRecognizer.State.ended {
            view.backgroundColor = .white
        } else {
            setUpBackgroundColor()
        }
    }
    
}
