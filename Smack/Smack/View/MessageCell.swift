//
//  MessageCell.swift
//  Smack
//
//  Created by Finn Kiesinger on 13.02.19.
//  Copyright © 2019 Finn Kiesinger. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var timestamp: UILabel!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var userImg: CircleImage!
    @IBOutlet weak var messageTxt: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(message: Message) {
        messageTxt.text = message.message
        username.text = message.username
        userImg.image = UIImage(named: message.userAvatar)
        userImg.backgroundColor = UserDataService.instance.returnUIColor(components: message.userAvatarColor)
        
        guard var isoDate = message.timestamp else { return }
        isoDate = String(isoDate.split(separator: ".")[0])
        isoDate.append("Z")
        
        let isoFormatter = ISO8601DateFormatter()
        let chatDate = isoFormatter.date(from: isoDate)
        
        let newFormatter = DateFormatter()
        newFormatter.dateFormat = "MMM d, h:mm a"
        
        if let finalDate = chatDate {
            let finalDate = newFormatter.string(from: finalDate)
            timestamp.text = finalDate
        }
        
        
        
    }

}
