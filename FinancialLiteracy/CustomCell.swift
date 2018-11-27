//
//  CustomCell.swift
//  Financial Literacy
//
//  Created by Eric Hansen on 11/24/18.
//  Copyright © 2018 Eric Hansen. All rights reserved.
//
import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var cellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
