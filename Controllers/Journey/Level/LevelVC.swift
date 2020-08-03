//
//  LevelVC.swift
//  ColorMatcher
//
//  Created by Sam Deverett on 7/14/20.
//  Copyright © 2020 Sam Deverett. All rights reserved.
//

import UIKit

class LevelVC: UIViewController {
    
    var worldGradientLevelKey: String!
    
    var nextGradientAlreadyUnlocked: Bool = false
    
    var sliders: [UISlider] = []
    var buttons: [UIButton] = []
    var labels: [UILabel] = []
    
    var levelNumber: Int = 0
    var nextLevelNumber: Int = 0
    var levelsBeat: [Any] = []
    var targetColors: [CGFloat] = []
    var inputColors: [CGFloat] = []
    
    var levelNumbers: [Any] = []
    var nextTargetColors: [Int: [CGFloat]] = [:]
    
    @IBOutlet weak var tutorialLabel: UILabel!
    
    @IBOutlet weak var objectForGestures: UIImageView!
    
    @IBOutlet weak var targetColor: UIImageView!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var hintButton: UIButton!
    
    @IBOutlet weak var redSlider: UISlider!
    
    @IBOutlet weak var greenSlider: UISlider!
    
    @IBOutlet weak var blueSlider: UISlider!

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
        
        levelNumbers = Array(nextTargetColors.keys)
        
        levelsBeat = UserDefaults.standard.array(forKey: worldGradientLevelKey)!
        
        if levelsBeat.count >= Constants.numberLevels {
            nextGradientAlreadyUnlocked = true
        }
        
        SetUp.tutorial(label: tutorialLabel)
        SetUp.sliders(sliders: sliders)
        SetUp.backgroundColor(sliders: sliders, vc: self)
        SetUp.otherColors(sliders: sliders, buttons: buttons, labels: labels)
        SetUp.targetColor(target: targetColor, targetColors: targetColors)
        setUpDoubleTapGestureRecognizer()
        setUpHoldGestureRecognizer()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ColorWorldLevelsVC
        destinationVC.levelsCollectionView.reloadData()
        if (levelsBeat.count >= Constants.numberLevels) && (!nextGradientAlreadyUnlocked) {
            destinationVC.gradientsUnlocked += 1
        }
    }

}
