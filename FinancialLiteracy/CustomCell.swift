//
//  CustomCell.swift
//  Financial Literacy
//
//  Created by Eric Hansen on 11/24/18.
//  Copyright © 2018 Eric Hansen. All rights reserved.
//  Represents a table cell in the dictionary views

import UIKit

class CustomCell: UITableViewCell {
    
    // The necessary components of each cell
    var button = UIButton()
    var favorited = Bool()
    let starUnselect = UIImage(named: "star.png")
    let starSelect = UIImage(named: "star2.png")
    
    // Constructor for a Custom Cell, creates the image button, adds the subview to the scene
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?)
    {
        // Calls the UITableView Controller constructor
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Creates the star button, auto-initializing it to unselected
        button.frame = CGRect(x: 345, y: 12 , width: 20, height: 20)
        button.addTarget(self, action: #selector(self.buttonPressed(_:)), for: .touchUpInside)
        button.setImage(starUnselect, for: .normal)
        
        // Adds the button to the scene
        self.addSubview(button)
    }
    
    // When the button is pressed, inverts the favorited property of the button, changes the image
    @objc func buttonPressed(_ sender: UIButton)
    {
        // Inverts the favorited property of the cell
        favorited = !favorited
        
        // Inverts the favorited property of the dictionary element
        let label = self.textLabel!.text!
        DictVC.setDictElement(label, favorited)
        
        // Changes the star and updates the favorited words list
        if changeStar()
        {
            FavoriteVC.addWord(label, DictVC.getDefn(label))
        }
        else
        {
            FavoriteVC.removeWord(label, DictVC.getDefn(label))
        }
    }
    
    // Changes the star icon on the cell
    func changeStar() -> Bool
    {
        if favorited
        {
            button.setImage(starSelect, for: .normal)
            self.addSubview(button)
            return true
        }
        else
        {
            button.setImage(starUnselect, for: .normal)
            self.addSubview(button)
            return false
        }
    }
    
// Required methods for a UITableViewCell
    
    // Handles errors while creating the cell
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Called during initialization, notifies cell that all outlet/action connects have been made
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
