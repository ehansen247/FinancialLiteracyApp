//
//  ViewController.swift
//  Financial Literacy
//
//  Created by Eric Hansen on 11/18/18.
//  Copyright © 2018 Eric Hansen. All rights reserved.
//  Represents the homepage view of the iOS App

import UIKit
import Foundation

class Homepage: UIViewController {
    
    var reachability:Reachability?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // When one of the buttons is pressed, pushes the corresponding scene view
    @IBAction func dictButtonPressed(_ sender: Any) {
        print("check")
        let button = sender as! UIButton
        var identifier = String()
        
        // Each button triggers a different segue
        switch(button.tag)
        {
            case 0: identifier = "ToDict"
            case 1: identifier = "ToReport"
            case 2: identifier = "ToCurriculum"
            case 3: identifier = "ToBudget"
            case 4: identifier = "ToCalculator"
            default: identifier = "ToDict"
        }
//        print(identifier)
//        if identifier == "ToReport"
//        {
//            print("run")
//            self.reachability = Reachability.init()
//            print(self.reachability!.connection != .none)
//        }
//        else
//        {
        // Pushes the next scene view
        performSegue(withIdentifier: identifier, sender: button)
//        }
    }
}

