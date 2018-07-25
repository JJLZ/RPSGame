//
//  RoundedButton.swift
//  SpeakingHero
//
//  Created by JJLZ on 11/16/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 3.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    override func awakeFromNib() {
        self.setupView()
    }
    
    func setupView()
    {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
    }
}
