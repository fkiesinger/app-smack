//
//  Constants.swift
//  Smack
//
//  Created by Finn Kiesinger on 10.02.19.
//  Copyright © 2019 Finn Kiesinger. All rights reserved.
//

import Foundation


typealias CompletionHandler = (_ Success: Bool) -> ()
//Url
let BASE_URL = "https://chatapp-finn.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"


let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"

//User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"




