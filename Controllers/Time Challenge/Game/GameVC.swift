//
//  ViewController.swift
//  ColorMatcher
//
//  Created by Sam Deverett on 7/3/20.
//  Copyright © 2020 Sam Deverett. All rights reserved.
//

import UIKit
import AVFoundation

class GameVC: UIViewController {
    
    var sliders: [UISlider] = []
    var enabledSliders: [UISlider] = []
    var buttons: [UIButton] = []
    var labels: [UILabel] = []
    
    var timer = Timer()
    var totalSeconds: Int = 30
    var secondsLeft: Int = 0
    var paused = true
    
    var score: Int = 0
    var scoreHints: Int = 0
    var highScore: Int = 0
    var highScoreHints: Int = 0
    
    var targetColors: [CGFloat] = []

    @IBOutlet weak var tutorialLabel: UILabel!
    
    @IBOutlet weak var objectForGestures: UIImageView!
    
    @IBOutlet weak var goButton: UIButton!
    
    @IBOutlet weak var pausedLabel: UILabel!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var settingsButton: UIButton!

    @IBOutlet weak var secondsLeftLabel: UILabel!
    
    @IBOutlet weak var hintButton: UIButton!
    
    @IBOutlet weak var targetColor: UIImageView!
    
    @IBOutlet weak var playPauseButton: UIButton!
    
    @IBOutlet weak var redSlider: UISlider!
    
    @IBOutlet weak var greenSlider: UISlider!
    
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBAction func settingsButtonPressed(_ sender: Any) {
        timer.invalidate()
        self.performSegue(withIdentifier: "toMenu", sender: self)
    }
    
    @IBAction func goButtonPressed(_ sender: Any) {
        setUpDoubleTapGestureRecognizer()
        hideGoButton()
        showPauseButton()
        showHintButton()
        targetColors = ColorFunctions.getNewTargetColors()
        SetUp.targetColor(target: targetColor, targetColors: targetColors)
        startTimer()
        paused = false
    }
    
    @objc func countdown() {
        secondsLeft -= 1
        secondsLeftLabel.text = "\(secondsLeft)"
        if secondsLeft == 0 {
            timer.invalidate()
            self.performSegue(withIdentifier: "toScoreVC", sender: self)
        }
    }
    
    @IBAction func playPauseButtonPressed(_ sender: Any) {
        if paused {
            pausedLabel.isHidden = true
            Slider.enableSliders(sliders: enabledSliders)
            hintButton.isEnabled = true
            playPauseButton.setImage(UIImage(systemName: "pause"), for: .normal)
            targetColor.isHidden = false
            startTimer()
            paused = false
        } else {
            timer.invalidate()
            pausedLabel.isHidden = false
            Slider.disableSliders(sliders: sliders)
            hintButton.isEnabled = false
            targetColor.isHidden = true
            playPauseButton.setImage(UIImage(systemName: "play"), for: .normal)
            paused = true
        }
    }
    
    @IBAction func hintButtonPressed(_ sender: Any) {
        scoreHints += 1
        enabledSliders = Hint.give(sliders: sliders, targetColors: targetColors, enabledSliders: enabledSliders)
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
        enabledSliders = sliders
        buttons = [goButton, backButton, settingsButton, hintButton, playPauseButton]
        labels = [tutorialLabel, secondsLeftLabel, pausedLabel]
        
        SetUp.tutorial(label: tutorialLabel)
        resetScore()
        resetScoreHints()
        resetHighScore()
        resetHighScoreHints()
        resetSecondsLeft()
        SetUp.sliders(sliders: sliders)
        SetUp.backgroundColor(sliders: sliders, vc: self)
        SetUp.otherColors(sliders: sliders, buttons: buttons, labels: labels)
        setUpHoldGestureRecognizer()
    }
    
    override func viewDidLayoutSubviews() {
        setUpGoButton()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMenu" {
            let destinationVC = segue.destination as! MenuVC
            destinationVC.backgroundColor = ColorConverter.rgbToUIColor(rgb: ColorFunctions.getInputColors(sliders: sliders))
            destinationVC.oppositeBackgroundColor = ColorFunctions.getOppositeBackgroundColor(sliders: sliders)
            updateHighScores()
        } else if segue.identifier == "toScoreVC" {
            let destinationVC = segue.destination as! ScoreVC
            destinationVC.backgroundColor = ColorConverter.rgbToUIColor(rgb: ColorFunctions.getInputColors(sliders: sliders))
            destinationVC.oppositeBackgroundColor = ColorFunctions.getOppositeBackgroundColor(sliders: sliders)
            destinationVC.totalSeconds = totalSeconds
            if score > highScore {
                destinationVC.confetti = true
            }
            updateHighScores()
            destinationVC.score = score
            destinationVC.scoreHints = scoreHints
            destinationVC.highScore = highScore
            destinationVC.highScoreHints = highScoreHints
        } else if segue.identifier == "unwindToSelection" {
            let destinationVC = segue.destination as! SelectionVC
            destinationVC.totalSeconds = totalSeconds
            updateHighScores()
        }
    }
    
}

