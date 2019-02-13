//
//  AddChannelVC.swift
//  Smack
//
//  Created by Finn Kiesinger on 12.02.19.
//  Copyright © 2019 Finn Kiesinger. All rights reserved.
//

import UIKit

class AddChannelVC: UIViewController {

    
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var descTxt: UITextField!
    @IBOutlet weak var bgView: GradientView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    @IBAction func closeModalPressed(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func createChannelPressed(_ sender: Any) {
        guard let channelName = nameTxt.text, nameTxt.text != "" else { return }
        guard let channelDesc = descTxt.text else { return }
        
        SocketService.instance.addChannel(channelName: channelName, channelDescription: channelDesc) { (success) in
            if success {
                self.dismiss(animated: false, completion: nil)
            }
        }
    }
    
    func setupView() {
        let closeTap = UITapGestureRecognizer(target: self, action: #selector(AddChannelVC.closeTap(_:)))
        
        bgView.addGestureRecognizer(closeTap)
        
        nameTxt.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [ NSAttributedString.Key.foregroundColor: smackPurplePlaceholder])
        descTxt.attributedPlaceholder = NSAttributedString(string: "Description", attributes: [ NSAttributedString.Key.foregroundColor: smackPurplePlaceholder])
        
    }
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer) {
    dismiss(animated: false, completion: nil)
    }
}
