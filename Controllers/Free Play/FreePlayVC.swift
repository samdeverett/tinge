//
//  FreePlayVC.swift
//  
//
//  Created by Sam Deverett on 7/7/20.
//

import UIKit

class FreePlayVC: UIViewController {
    
    var sliders: [UISlider] = []
    var buttons: [UIButton] = []
    var labels: [UILabel] = []

    var targetColors: [CGFloat] = []
    var inputColors: [CGFloat] = []
    
    @IBOutlet weak var tutorialLabel: UILabel!
    
    @IBOutlet weak var objectForGestures: UIImageView!
    
    @IBOutlet weak var targetColor: UIImageView!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var redSlider: UISlider!
    
    @IBOutlet weak var greenSlider: UISlider!
    
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var hintButton: UIButton!
    
    @IBAction func hintButtonPressed(_ sender: Any) {
        _ = Hint.give(sliders: sliders, targetColors: targetColors, enabledSliders: [])
        SetUp.backgroundColor(sliders: sliders, vc: self)
        SetUp.otherColors(sliders: sliders, buttons: buttons, labels: labels)
    }
    
    @IBAction func redSliderChanged(_ sender: Any) {
        SetUp.backgroundColor(sliders: sliders, vc: self)
        SetUp.otherColors(sliders: sliders, buttons: buttons, labels: labels)
        Slider.adjustColor(color: "red", redSlider: redSlider, greenSlider: greenSlider, blueSlider: blueSlider)
    }
    
    @IBAction func greenSliderChanged(_ sender: Any) {
        SetUp.backgroundColor(sliders: sliders, vc: self)
        SetUp.otherColors(sliders: sliders, buttons: buttons, labels: labels)
        Slider.adjustColor(color: "green", redSlider: redSlider, greenSlider: greenSlider, blueSlider: blueSlider)
    }
    
    @IBAction func blueSliderChanged(_ sender: Any) {
        SetUp.backgroundColor(sliders: sliders, vc: self)
        SetUp.otherColors(sliders: sliders, buttons: buttons, labels: labels)
        Slider.adjustColor(color: "blue", redSlider: redSlider, greenSlider: greenSlider, blueSlider: blueSlider)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sliders = [redSlider, greenSlider, blueSlider]
        buttons = [backButton, hintButton]
        labels = [tutorialLabel]
        
        SetUp.tutorial(label: tutorialLabel)
        SetUp.sliders(sliders: sliders)
        SetUp.backgroundColor(sliders: sliders, vc: self)
        SetUp.otherColors(sliders: sliders, buttons: buttons, labels: labels)
        targetColors = ColorFunctions.getNewTargetColors()
        SetUp.targetColor(target: targetColor, targetColors: targetColors)
        setUpDoubleTapGestureRecognizer()
        setUpHoldGestureRecognizer()
    }
    
}
