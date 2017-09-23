//
//  loginVC.swift
//  smackapp
//
//  Created by Tapiwa Jiri on 2017/09/23.
//  Copyright © 2017 Tapiwa Jiri. All rights reserved.
//

import UIKit

class loginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func closePressed(_ sender: Any) { dismiss(animated: true, completion: nil)}
    
    @IBAction func createAccountBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_NEW_ACCOUNT, sender: nil)
    }
    
  

}
