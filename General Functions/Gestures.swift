//
//  Gestures.swift
//  ColorMatcher
//
//  Created by Sam Deverett on 7/19/20.
//  Copyright © 2020 Sam Deverett. All rights reserved.
//

import UIKit

class CustomTapGestureRecognizer: UITapGestureRecognizer {
    var vcType: String = ""
    var vc: UIViewController = UIViewController()
}

class CustomLongPressGestureRecognizer: UILongPressGestureRecognizer {
    var vc: UIViewController = UIViewController()
    var sliders: [UISlider] = []
}

class Gestures {

    static func setUpDoubleTapGestureRecognizer(viewController: UIViewController) {
        
        let doubleTapGesture = CustomTapGestureRecognizer(target: self, action: #selector(Gestures.handleDoubleTap(sender:)))
        doubleTapGesture.numberOfTapsRequired = 2
        
        if type(of: viewController) == GameVC.self {
            doubleTapGesture.vcType = "Time Challenge"
            let vc = viewController as! GameVC
            doubleTapGesture.vc = vc
            vc.objectForGestures.addGestureRecognizer(doubleTapGesture)
        } else if type(of: viewController) == LevelVC.self {
            doubleTapGesture.vcType = "Journey"
            let vc = viewController as! LevelVC
            doubleTapGesture.vc = vc
            vc.objectForGestures.addGestureRecognizer(doubleTapGesture)
        } else if type(of: viewController) == FreePlayVC.self {
            doubleTapGesture.vcType = "Free Play"
            let vc = viewController as! FreePlayVC
            doubleTapGesture.vc = vc
            vc.objectForGestures.addGestureRecognizer(doubleTapGesture)
        }

    }

    @objc static func handleDoubleTap(sender: CustomTapGestureRecognizer) {
//        var vc: UIViewController
//        let vc = sender.vc as! GameVC
        
        if sender.vcType == "Time Challenge" {
            let vc = sender.vc as! GameVC
        } else if sender.vcType == "Journey" {
            let vc = sender.vc as! LevelVC
        } else if sender.vcType == "Free Play" {
            let vc = sender.vc as! FreePlayVC
        }
        
        if sender.state == .ended {
            if General.matchedTargetColor(targetColors: vc.targetColors, inputColors: ColorFunctions.getInputColors(sliders: vc.sliders)) {
                Slider.disableSliders(sliders: vc.sliders)
        //            playCorrectSound()
                if type(of: vc) == GameVC {
                    vc.score += 1
                }
                vc.view.backgroundColor = ColorConverter.rgbToUIColor(rgb: vc.targetColors)
                vc.targetColors = ColorFunctions.getNewTargetColors()
                vc.fadeInBorder()
                vc.transitionTargetColors(nextTargetColors: vc.targetColors)
                Slider.enableSliders(sliders: vc.sliders)
            } else {
                vc.shakeTarget()
            }
        }
    }

    static func setUpHoldGestureRecognizer(vc: GameVC) {
        let holdGesture = CustomLongPressGestureRecognizer(target: self, action: #selector(handleHold(sender:)))
        holdGesture.vc = vc
        holdGesture.sliders = vc.sliders
        holdGesture.minimumPressDuration = 0.25
        vc.objectForGestures.addGestureRecognizer(holdGesture)
    }

    @objc static func handleHold(sender: CustomLongPressGestureRecognizer) {
        let vc = sender.vc
        let sliders = sender.sliders
        if sender.state != .ended {
            vc.view.backgroundColor = .white
        } else {
            SetUp.backgroundColor(sliders: sliders, vc: vc)
        }
    }

}
