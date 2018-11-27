//
//  RoundButton.swift
//  Financial Literacy
//
//  Created by Eric Hansen on 11/23/18.
//  Copyright © 2018 Eric Hansen. All rights reserved.
//
import UIKit

class RoundButton: UIButton {
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        layer.backgroundColor = UIColor.blue.cgColor
        self.setTitleColor(UIColor.white, for: .normal)
    }
    override func layoutSubviews()
    {
        super.layoutSubviews()
        layer.cornerRadius = frame.height/2
        layer.borderColor = UIColor.white.cgColor
    }
}
