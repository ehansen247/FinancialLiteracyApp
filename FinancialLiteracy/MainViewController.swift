//
//  MainViewController.swift
//  Financial Literacy
//
//  Created by Eric Hansen on 11/23/18.
//  Copyright © 2018 Eric Hansen. All rights reserved.
//
import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    @IBAction func viewTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "getStarted", sender: sender)
    }
}
