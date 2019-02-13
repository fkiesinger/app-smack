//
//  Size.swift
//  Smack
//
//  Created by Finn Kiesinger on 13.02.19.
//  Copyright © 2019 Finn Kiesinger. All rights reserved.
//

import Foundation

class Size {
    static let instance = Size()
    
    public private(set) var height: CGFloat!
    
    func setHeight(height: CGFloat) {
        self.height = height
    }
}
