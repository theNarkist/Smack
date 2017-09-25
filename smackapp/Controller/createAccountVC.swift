//
//  createAccountVC.swift
//  smackapp
//
//  Created by Tapiwa Jiri on 2017/09/23.
//  Copyright © 2017 Tapiwa Jiri. All rights reserved.
//

import UIKit

class createAccountVC: UIViewController {
    
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passTxt: UITextField!
    @IBOutlet weak var userImg: UIImageView!
    
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func createAccountPressed(_ sender: Any) {
        guard let name  = usernameTxt.text , usernameTxt.text != "" else {return}
        guard let email = emailTxt.text , emailTxt.text != "" else {return}
        guard let pass = passTxt.text , passTxt.text != "" else {
            return}
        
        AuthServices.instances.registerUser(email: email, password: pass) { (success) in
            if success {
                AuthServices.instances.loginUser(email: email, password: pass, completion: { (success) in
                    if success {
                        AuthServices.instances.createUser(avatarName: self.avatarName, avatarColor: self.avatarColor, name: name, email: email, completion: { (success) in
                            if success {
                                print (UserDataServices.instance.name, UserDataServices.instance.avatarName)
                                self.performSegue(withIdentifier: TO_CHANNEL_VC, sender: nil)
                            }
                            })
                    }
                })
            }
        }
    }
    @IBAction func pickAvatarPressed (_ sender: Any) {
        
    }
    @IBAction func pickBGColorPressed (_ sender: Any) {
        
    }
    
    
    @IBAction func exitBtnPressed(_ sender: Any) { performSegue(withIdentifier: TO_CHANNEL_VC, sender: nil)
    }
    
    }



