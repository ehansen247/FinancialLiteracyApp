//
//  ViewController.swift
//  Cash Dash
//
//  Created by Michael Chen on 11/23/18.
//  Copyright © 2018 Chris50. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Properties
    
    @IBOutlet weak var principal: UITextField!
    @IBOutlet weak var interest: UITextField!
    @IBOutlet weak var periods: UITextField!
    @IBOutlet weak var calculation: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        //Shows calculation
        //calculation.text = "Testing"
        var name: String = principal.text!
        
        calculation.text = name
        
        //calculation.text = String(simpleInterestOf(principal: a, interest: b, periods: c))
    }


}

