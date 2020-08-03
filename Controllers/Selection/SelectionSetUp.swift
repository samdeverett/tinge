//
//  SelectionSetUp.swift
//  ColorMatcher
//
//  Created by Sam Deverett on 7/15/20.
//  Copyright © 2020 Sam Deverett. All rights reserved.
//

import UIKit

extension SelectionVC {
    
    func setUpButton(button: UIButton) {
        button.layer.cornerRadius = button.bounds.width / 2
        button.layer.borderWidth = 3
        button.layer.masksToBounds = true
    }
    
}
