//
//  authService.swift
//  smackapp
//
//  Created by Tapiwa Jiri on 2017/09/24.
//  Copyright © 2017 Tapiwa Jiri. All rights reserved.
//

import Foundation
import Alamofire
import  SwiftyJSON

class AuthServices {
    
    static let  instances = AuthServices ()
    let defaults = UserDefaults.standard
    var isLoggedIn : Bool {
        get {
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        set {
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    var authToken : String {
        get {
            return defaults.value(forKey: TOKEN_KEY) as! String
        }
        set {
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
    var userEmail : String {
        get {
            return defaults.value(forKey: USER_EMAIL) as! String
        }
        set {
            defaults.set(newValue, forKey: USER_EMAIL)
        }
    }
    func registerUser ( email: String, password: String, completion : @escaping completionHandler) {
         let lowerCasedEmail = email.lowercased()
       
        let body: [ String : Any] = [
            "email" : lowerCasedEmail,
            "password" : password
        ]
        
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseString { (response) in
            if response.result.error == nil {
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
 
    }
    func loginUser (email: String, password: String, completion : @escaping completionHandler)
    {
        let lowerCasedEmail = email.lowercased()
        
        let body: [ String : Any] = [
            "email" : lowerCasedEmail,
            "password" : password
        ]
        
        Alamofire.request(URL_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            if response.result.error == nil {
//                if let json = response.result.value as?
//                    Dictionary <String, Any> {
//                    if let email = json ["user"] as? String {
//                        self.userEmail = email
//                    }
//                    if let token = json ["token"] as? String {
//                        self.authToken = token
//                    }
//                }
                
                guard let data = response.data else {return}
                let json = JSON(data: data)
                self.userEmail = json["user"].stringValue
                self.authToken = json["token"].stringValue
            
                self.isLoggedIn = true

               
            completion(true)
            }
            else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    func createUser (avatarName: String, avatarColor: String, name: String, email: String, completion : @escaping completionHandler) {
        let lowerCasedEmail = email.lowercased()
        
        let body: [ String : Any] = [
             "name" : name,
             "email" : lowerCasedEmail,
            "avatarName" : avatarName,
            "avatarColor" : avatarColor
        ]
        
        let header = [
            "Authorization":"Bearer \(AuthServices.instances.authToken)",
         "Content-Type" : "application/json; charset=utf-8"]
       
        Alamofire.request(URL_USER_ADD, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else { return }
                let json = JSON(data: data)
                let id = json["_id"].stringValue
                let name = json["name"].stringValue
                let email = json["email"].stringValue
                let color = json["avatarColor"].stringValue
                let avatarName = json["avatarName"].stringValue
                
                UserDataServices.instance.setUserData(id: id, avatarName: avatarName, color: color, name: name, email: email)
                completion (true)
                    
                
                
            } else {
               completion(false)
                debugPrint(response.result.error as Any)
            }
        }
        
    }
}




















