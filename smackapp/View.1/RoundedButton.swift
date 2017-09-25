//
//  RoundedButton.swift
//  smackapp
//
//  Created by Tapiwa Jiri on 2017/09/25.
//  Copyright © 2017 Tapiwa Jiri. All rights reserved.
//

import UIKit
@IBDesignable

class RoundedButton: UIButton {

    @IBInspectable var cornerRadius : CGFloat =  3.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    override func awakeFromNib() {
        self.setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
        
    }
    func setupView () {
        self.layer.cornerRadius = cornerRadius
    }
}
