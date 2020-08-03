//
//  MenuVC.swift
//  ColorMatcher
//
//  Created by Sam Deverett on 7/6/20.
//  Copyright © 2020 Sam Deverett. All rights reserved.
//

import UIKit

class MenuVC: UIViewController {
    
    var labels: [UILabel]!
    var segmentedControls: [UISegmentedControl]!
    var buttons: [UIButton]!
    
    var backgroundColor: UIColor!
    var oppositeBackgroundColor: UIColor!
    
    var selectedTimeOption: Int!
    
    @IBOutlet weak var highScoreLabel: UILabel!
    
    @IBOutlet weak var ThirtySecondsLabel: UILabel!
    
    @IBOutlet weak var ThirtySecondsHighScore: UILabel!
    
    @IBOutlet weak var OneMinuteLabel: UILabel!
    
    @IBOutlet weak var OneMinuteHighScore: UILabel!
    
    @IBOutlet weak var ThreeMinuteLabel: UILabel!
    
    @IBOutlet weak var ThreeMinuteHighScore: UILabel!
    
    @IBOutlet weak var FiveMinuteLabel: UILabel!
    
    @IBOutlet weak var FiveMinuteHighScore: UILabel!
    
    @IBOutlet weak var TenMinuteLabel: UILabel!
    
    @IBOutlet weak var TenMinuteHighScore: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var timeOptions: UISegmentedControl!
    
    @IBOutlet weak var playButton: UIButton!
    
    @IBAction func playButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "toGameFromSettings", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labels = [highScoreLabel, ThirtySecondsLabel, ThirtySecondsHighScore, OneMinuteLabel, OneMinuteHighScore, ThreeMinuteLabel, ThreeMinuteHighScore, FiveMinuteLabel, FiveMinuteHighScore, TenMinuteLabel, TenMinuteHighScore, timeLabel]
        segmentedControls = [timeOptions]
        buttons = [playButton]
        
        setUpBackgroundColor()
        setUpOtherColors()
        setUpHighScores()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! GameVC
        getSelectedTimeOption()
        destinationVC.totalSeconds = selectedTimeOption!
    }

}
