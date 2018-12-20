//
//  WordDefinition.swift
//  Financial Literacy
//
//  Created by Eric Hansen on 11/18/18.
//  Copyright © 2018 Eric Hansen. All rights reserved.
//  Represents the Word Definition scene view

import UIKit

class WordDefinition: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        createDef()
    }
    var word = UILabel()
    var defn = UILabel()
    
    // Renders the word and its definition
    func createDef()
    {
        // Renders the word with a certain font-size, text color, size and position
        word.font = UIFont.boldSystemFont(ofSize: 24.0)
        let maxSize = CGSize(width: 100, height: 40)
        let size = word.sizeThatFits(maxSize)
        word.frame = CGRect(origin: CGPoint(x: 20, y: 80), size: size)
        word.textColor = .white
        
        
        // Renders the definition
        defn.font = UIFont.systemFont(ofSize: 16.0)
        let maxSize2 = CGSize(width: 315, height: 1400)
        defn.textColor = .white
        
        // Allows the text of the definition to move down to new lines
        defn.numberOfLines = 15
        let size2 = defn.sizeThatFits(maxSize2)
        defn.frame = CGRect(origin: CGPoint(x: 40, y: 120), size: size2)
        
        
        
        
        
        // Adds them to view controller
        self.view.addSubview(word)
        self.view.addSubview(defn)
    }
    
}


