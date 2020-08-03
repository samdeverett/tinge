//
//  SelectionVC.swift
//  ColorMatcher
//
//  Created by Sam Deverett on 7/6/20.
//  Copyright © 2020 Sam Deverett. All rights reserved.
//

import UIKit

class SelectionVC: UIViewController {
    
    var totalSeconds: Int = 30
    
    @IBOutlet weak var settingsButton: UIButton!
    
    @IBOutlet weak var timeChallengeButton: UIButton!
    
    @IBOutlet weak var journeyButton: UIButton!
    
    @IBOutlet weak var freePlayButton: UIButton!
    
    @IBAction func timeChallengePressed(_ sender: Any) {
        self.performSegue(withIdentifier: "toGameVC", sender: self)
    }
    
    @IBAction func settingsPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Are you sure?", message: "You'll lose all your high scores and levels.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Erase My Data", style: .default, handler: {_ in General.eraseData()} ))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    @IBAction func journeyPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "toColorWorldsVC", sender: self)
    }
    
    @IBAction func freePlayPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "toFreePlayVC", sender: self)
    }
    
    @IBAction func unwindToSelections(segue:UIStoryboardSegue) { }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        setUpButton(button: timeChallengeButton)
        setUpButton(button: journeyButton)
        setUpButton(button: freePlayButton)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toGameVC" {
            let destinationVC = segue.destination as! GameVC
            destinationVC.totalSeconds = totalSeconds
        }
    }

}
