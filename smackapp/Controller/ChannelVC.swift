//
//  ChannelVC.swift
//  smackapp
//
//  Created by Tapiwa Jiri on 2017/09/20.
//  Copyright © 2017 Tapiwa Jiri. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
    }



}
