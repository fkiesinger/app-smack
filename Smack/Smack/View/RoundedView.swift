//
//  RoundedView.swift
//  Smack
//
//  Created by Finn Kiesinger on 12.02.19.
//  Copyright © 2019 Finn Kiesinger. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedView: UIView {
    
    @IBInspectable var radius: CGFloat = 5.0 {
        didSet {
            self.setNeedsLayout()
        }
    }

    override func awakeFromNib() {
        self.layer.cornerRadius = 5
    }

}
