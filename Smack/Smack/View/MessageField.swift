//
//  MessageField.swift
//  Smack
//
//  Created by Finn Kiesinger on 13.02.19.
//  Copyright © 2019 Finn Kiesinger. All rights reserved.
//

import UIKit

@IBDesignable
class MessageField: UITextField {

    @IBInspectable var color: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3511879281) {
        didSet {
            self.setNeedsLayout()
        }
    }
    override func awakeFromNib() {
        self.setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
    }
    
    func setupView() {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = 0.5
        
    }

}
