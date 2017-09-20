//
//  chatVC.swift
//  smackapp
//
//  Created by Tapiwa Jiri on 2017/09/20.
//  Copyright © 2017 Tapiwa Jiri. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {

    @IBOutlet weak var menuBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)

    }

    

}
