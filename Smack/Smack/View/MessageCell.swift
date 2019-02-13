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
    }

}
