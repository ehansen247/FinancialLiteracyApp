//
//  ViewController.swift
//  Cash Dash
//
//  Created by Michael Chen on 11/23/18.
//  Copyright © 2018 Chris50. All rights reserved.
//

import UIKit

class SimpleInterestVC: UIViewController, UITextFieldDelegate {
    
    //MARK: Properties
    
    @IBOutlet weak var principal: UITextField!
    @IBOutlet weak var interest: UITextField!
    @IBOutlet weak var periods: UITextField!
    @IBOutlet weak var calculation: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        principal.delegate = self
        interest.delegate = self
        periods.delegate = self
        // Closes keyboard when user taps outside of the text field
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: Selector("endEditing:")))
    }
    
    @IBAction func buttonPressed(_ sender: UIButton)
    {
        //Show simple interest calculation
        if let p = Double(principal.text!), let r = Double(interest.text!), let T = Double(periods.text!) {
            calculation.text = String(p+simpleInterestOf(principal: p, interest: r/100, periods: T))
        }
    }
}

