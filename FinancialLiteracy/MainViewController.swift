//
//  MainViewController.swift
//  Financial Literacy
//  Created by Eric Hansen on 11/23/18.
//  Copyright © 2018 Eric Hansen. All rights reserved.
//  Represents the opening scene view

import UIKit

class MainViewController: UIViewController {
    
    // Loads the homepage scene view and loads the dictionary words and definitions
    override func viewDidLoad() {
        super.viewDidLoad()
        DictVC.loadDictionary()
        
        // Creates the favorited word array in the User Defaults database if it has not been created before
        let defaults = UserDefaults.standard
        if defaults.array(forKey: "favorites") == nil
        {
            let favWords = Array<String>()
            defaults.register(defaults: ["favorites": favWords])
        }
        
        // Loads the favorited word array from the database 
        FavoriteVC.loadFavorites()
    }
    
    // When the get started button is pressed, pushes the user to the homepage scene view
    @IBAction func viewTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "getStarted", sender: sender)
    }
}
