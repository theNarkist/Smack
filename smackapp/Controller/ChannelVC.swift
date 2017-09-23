//
//  ChannelVC.swift
//  smackapp
//
//  Created by Tapiwa Jiri on 2017/09/20.
//  Copyright © 2017 Tapiwa Jiri. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    @IBOutlet weak var loginBtn: UIButton!
    @IBAction func UnwindSegue (segue : UIStoryboardSegue) {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
    }

    @IBAction func loginWasPressed(_ sender: Any) { performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }
    

}
