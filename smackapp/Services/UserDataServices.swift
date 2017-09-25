//
//  UserDataServices.swift
//  smackapp
//
//  Created by Tapiwa Jiri on 2017/09/25.
//  Copyright © 2017 Tapiwa Jiri. All rights reserved.
//

import Foundation

class UserDataServices {
    static let instance = UserDataServices()
    
    public private(set) var id  = ""
     public private(set) var avatarName  = ""
     public private(set) var avatarColor  = ""
     public private(set) var name  = ""
     public private(set) var email  = ""
    
    func setUserData (id : String , avatarName: String, color: String, name: String, email: String) {
        self.id = id
        self.avatarName = avatarName
        self.avatarColor = color
        self.email = email
        self.name = name
    }
    
    func setAvatarName (avatarName: String) {
        self.avatarName = avatarName
    }
}
