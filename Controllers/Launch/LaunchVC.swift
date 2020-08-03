//
//  LaunchVC.swift
//  ColorMatcher
//
//  Created by Sam Deverett on 7/6/20.
//  Copyright © 2020 Sam Deverett. All rights reserved.
//

import UIKit
import AVFoundation

class LaunchVC: UIViewController {
    
    var backgroundMusicPlayer: AVAudioPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "backgroundMusic.wav", ofType: nil)!
        let url = URL(fileURLWithPath: path)
        do {
            backgroundMusicPlayer = try AVAudioPlayer(contentsOf: url)
            backgroundMusicPlayer.numberOfLoops = -1
            backgroundMusicPlayer.prepareToPlay()
            backgroundMusicPlayer.play()
        } catch {
            print("couldn't load the background music")
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.performSegue(withIdentifier: "toSelectionVC", sender: self)
        }
        
        if UserDefaults.standard.object(forKey: "showTutorial") == nil {
            UserDefaults.standard.setValue(true, forKey: "showTutorial")
        }
        
    }

}
