//
//  ColorConverter.swift
//
//
//  Created by Sam Deverett on 7/12/20.
//

import UIKit

class ColorConverter {
    
    static func rgbToUIColor(rgb: [CGFloat]) -> UIColor {
        return UIColor(red: rgb[0], green: rgb[1], blue: rgb[2], alpha: 1)
    }

    static func rgbToLab(rgb: [CGFloat]) -> [CGFloat] {
        
        var r = rgb[0]
        var g = rgb[1]
        var b = rgb[2]
        var x: CGFloat!
        var y: CGFloat!
        var z: CGFloat!

        if r > 0.04045 {
            r = pow((r + 0.055) / 1.055, 2.4)
        } else {
            r = r / 12.92
        }
        if g > 0.04045 {
            g = pow((g + 0.055) / 1.055, 2.4)
        } else {
            g = g / 12.92
        }
        if b > 0.04045 {
            b = pow((b + 0.055) / 1.055, 2.4)
        } else {
            b = b / 12.92
        }

        x = (r * 0.4124 + g * 0.3576 + b * 0.1805)
        x /= 0.95047
        y = (r * 0.2126 + g * 0.7152 + b * 0.0722)
        y /= 1.00000
        z = (r * 0.0193 + g * 0.1192 + b * 0.9505)
        z /= 1.08883

        if x > 0.008856 {
            x = pow(x, 1/3)
        } else {
            x = (7.787 * x) + 16/116
        }
        if y > 0.008856 {
            y = pow(y, 1/3)
        } else {
            y = (7.787 * y) + 16/116
        }
        if z > 0.008856 {
            z = pow(z, 1/3)
        } else {
            z = (7.787 * z) + 16/116
        }

        let l = (116 * y) - 16
        let a = 500 * (x - y)
        let b1 = 200 * (y - z)
        
        return [l, a, b1]
    }

}
