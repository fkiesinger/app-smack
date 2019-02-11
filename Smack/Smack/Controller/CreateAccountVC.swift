//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Finn Kiesinger on 10.02.19.
//  Copyright © 2019 Finn Kiesinger. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passTxt: UITextField!
    @IBOutlet weak var userImage: UIImageView!
    
    //Variables
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    var bgColor: UIColor?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CreateAccountVC.dismissKeyboard))
        view.addGestureRecognizer(tap)
        setupView()
    }

    override func viewDidAppear(_ animated: Bool) {
        if UserDataService.instance.avatarName != "" {
            userImage.image = UIImage(named: UserDataService.instance.avatarName)
            avatarName = UserDataService.instance.avatarName
            if avatarName.contains("light") && bgColor == nil{
                userImage.backgroundColor = UIColor.gray
            }
        }
    }
    
    @IBAction func pickAvatarPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
    }
    @IBAction func pickBgColorPressed(_ sender: Any) {
        let r = CGFloat(arc4random_uniform(255))/255
        let g = CGFloat(arc4random_uniform(255))/255
        let b = CGFloat(arc4random_uniform(255))/255
        
        avatarColor = "[\(r), \(g), \(b), 1]"
        bgColor = UIColor(red: r, green: g, blue: b, alpha: 1)
        UIView.animate(withDuration: 0.2) {
            self.userImage.backgroundColor = self.bgColor
        }
    }
    
    
    @IBAction func createAccountPressed(_ sender: Any) {
        spinner.isHidden = false
        spinner.startAnimating()
        
        guard let name = usernameTxt.text , usernameTxt.text != "" else {return}
        guard let email = emailTxt.text , emailTxt.text != "" else {return}
        guard let pass = passTxt.text, passTxt.text != "" else {return}
        
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            if success {
                AuthService.instance.loginUser(email: email, password: pass, completion: { (success) in
                    AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
                        if success {
                            self.spinner.isHidden = true
                            self.spinner.stopAnimating()
                            self.performSegue(withIdentifier: UNWIND, sender: nil)
                            NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                            
                        }
                    })
                })
            }
        }
        
    }
    
    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    func setupView() {
        usernameTxt.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedString.Key.foregroundColor: smackPurplePlaceholder])
        emailTxt.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: smackPurplePlaceholder])
        passTxt.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: smackPurplePlaceholder])
        spinner.isHidden = true
    }
    
    
}
