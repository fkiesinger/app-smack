//
//  GradientView.swift
//  Smack
//
//  Created by Finn Kiesinger on 10.02.19.
//  Copyright © 2019 Finn Kiesinger. All rights reserved.
//

import UIKit

@IBDesignable
class GradientView: UIView {

    @IBInspectable var topColor: UIColor = #colorLiteral(red: 0.222027272, green: 0.2292741239, blue: 0.6638080478, alpha: 1) {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable var bottomColor: UIColor = #colorLiteral(red: 0.3472670317, green: 0.3586001694, blue: 1, alpha: 1) {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable var x1: CGFloat = 0 {
        didSet {
            self.setNeedsLayout()
        }
    }
    @IBInspectable var y1: CGFloat = 0 {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable var x2: CGFloat = 1 {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable var y2: CGFloat = 1 {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable var start: CGFloat = 0.0 {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    override func layoutSubviews() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: x1, y:y1)
        gradientLayer.endPoint = CGPoint(x: x2, y: y2)
        gradientLayer.frame = self.bounds
        gradientLayer.locations = [start as NSNumber]
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
