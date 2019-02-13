//
//  Message.swift
//  Smack
//
//  Created by Finn Kiesinger on 13.02.19.
//  Copyright © 2019 Finn Kiesinger. All rights reserved.
//

import Foundation

struct Message {
    
    public private(set) var message: String!
    public private(set) var username: String!
    public private(set) var channelid: String!
    public private(set) var userAvatar: String!
    public private(set) var userAvatarColor: String!
    public private(set) var id: String!
    public private(set) var timestamp: String!
    
    init(message: String, username: String, channelId: String, userAvatar: String, userAvatarColor: String, id: String, timestamp: String) {
        self.message = message
        self.username = username
        self.channelid = channelId
        self.userAvatar = userAvatar
        self.userAvatarColor = userAvatarColor
        self.timestamp = timestamp
    }
    
}
