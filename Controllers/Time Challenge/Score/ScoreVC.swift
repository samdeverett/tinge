//
//  ScreenVC.swift
//  ColorMatcher
//
//  Created by Sam Deverett on 7/6/20.
//  Copyright © 2020 Sam Deverett. All rights reserved.
//

import UIKit
import SwiftConfettiView

class ScoreVC: UIViewController {
    
    var labels: [UILabel] = []
    var buttons: [UIButton] = []
    
    var backgroundColor: UIColor!
    var oppositeBackgroundColor: UIColor!
    
    var totalSeconds: Int!
    var score: Int!
    var scoreHints: Int!
    var highScore: Int!
    var highScoreHints: Int!
    
    var confettiView: SwiftConfettiView!
    var confetti: Bool = false
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var scoreNumberHints: UILabel!
    
    @IBOutlet weak var highScoreTitleLabel: UILabel!
    
    @IBOutlet weak var highScoreLabel: UILabel!
    
    @IBOutlet weak var highScoreNumberHints: UILabel!
    
    @IBOutlet weak var restartButton: UIButton!
    
    @IBAction func restartButtonPressed(_ sender: Any) {
        if confettiView.isActive() {
            confettiView.stopConfetti()
        }
        self.performSegue(withIdentifier: "restartSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        confettiView = SwiftConfettiView(frame: self.view.bounds)
        
        if confetti {
            confettiView.isUserInteractionEnabled = false
            self.view.addSubview(confettiView)
            confettiView.intensity = 1.0
            confettiView.startConfetti()
        }
        
        labels = [scoreLabel, scoreNumberHints, highScoreTitleLabel, highScoreLabel, highScoreNumberHints]
        buttons = [restartButton]
        
        setUpBackgroundColor()
        setUpOtherColors(labels: labels, buttons: buttons)
        setUpScoreLabel()
        setUpScoreHintsLabel()
        setUpHighScoreLabel()
        setUpHighScoreHintsLabel()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! GameVC
        destinationVC.totalSeconds = totalSeconds
    }

}
