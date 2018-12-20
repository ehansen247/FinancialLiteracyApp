//
//  RoundButton.swift
//  Financial Literacy
//
//  Created by Eric Hansen on 11/23/18.
//  Copyright © 2018 Eric Hansen. All rights reserved.
//  Represents a rounded button

import UIKit

class RoundButton: UIButton {
    
    // Initializes the button with a blue background, white text
    override func awakeFromNib()
    {
        super.awakeFromNib()
        layer.backgroundColor = UIColor.blue.cgColor
        self.setTitleColor(UIColor.white, for: .normal)
    }
    
    // Creates a rounded frame for the button
    override func layoutSubviews()
    {
        super.layoutSubviews()
        layer.cornerRadius = frame.height/2
        layer.borderColor = UIColor.white.cgColor
    }
}
