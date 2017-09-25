//
//  Constants.swift
//  smackapp
//
//  Created by Tapiwa Jiri on 2017/09/23.
//  Copyright © 2017 Tapiwa Jiri. All rights reserved.
//

import Foundation

typealias completionHandler = ( _ Success: Bool) -> ()

// segues

let TO_LOGIN = "toLogin"
let TO_NEW_ACCOUNT = "toCreateAccount"
let BACK_TO_CHANNEL_VC = "backToChannelVC"
let TO_CHANNEL_VC = "toCHannelVC"

// user defaults

let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

// url constants

let BASE_URL = "https://chatsmackapp.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
