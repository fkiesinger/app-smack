//
//  UserDataService.swift
//  Smack
//
//  Created by Finn Kiesinger on 11.02.19.
//  Copyright © 2019 Finn Kiesinger. All rights reserved.
//

import Foundation


class UserDataService {
    static let instance = UserDataService()
    
    public private(set) var id = ""
    public private(set) var avatarColor = ""
    public private(set) var avatarName = ""
    public private(set) var email = ""
    public private(set) var name = ""
    
    func setUserData(id: String, color: String, avatarName: String, email: String, name: String) {
        self.id = id
        self.avatarColor = color
        self.avatarName = avatarName
        self.email = email
        self.name = name
    }
    
    func setAvatarName(avatarName: String) {
            self.avatarName = avatarName
    }
    
    func returnUIColor(components: String) -> UIColor {
        let scanner = Scanner(string: components)
        let skipped = CharacterSet(charactersIn: "[], ")
        let comma = CharacterSet(charactersIn: ",")
        scanner.charactersToBeSkipped = skipped
        
        var r, g, b, a: NSString?
        scanner.scanUpToCharacters(from: comma, into: &r)
        scanner.scanUpToCharacters(from: comma, into: &g)
        scanner.scanUpToCharacters(from: comma, into: &b)
        scanner.scanUpToCharacters(from: comma, into: &a)
        
        let defaulColor = UIColor.lightGray
        guard let rUw = r else { return defaulColor }
        guard let gUw = g else { return defaulColor }
        guard let bUw = b else { return defaulColor }
        guard let aUw = a else { return defaulColor }
        
        let rFloat = CGFloat(rUw.doubleValue)
        let gFloat = CGFloat(gUw.doubleValue)
        let bFloat = CGFloat(bUw.doubleValue)
        let aFloat = CGFloat(aUw.doubleValue)
        
        let newUIColor = UIColor(red: rFloat, green: gFloat, blue: bFloat, alpha: aFloat)
        
        return newUIColor
    }
}
