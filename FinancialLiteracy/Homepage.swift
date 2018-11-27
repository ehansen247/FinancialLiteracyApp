//
//  ViewController.swift
//  Financial Literacy
//
//  Created by Eric Hansen on 11/18/18.
//  Copyright © 2018 Eric Hansen. All rights reserved.
//
import UIKit

class Homepage: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func dictButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "toDict", sender: sender)
    }
}

