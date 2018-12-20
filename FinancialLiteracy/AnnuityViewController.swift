//
//  AnnuityViewController.swift
//  FinancialLiteracy
//
//  Created by Michael Chen on 11/30/18.
//  Copyright © 2018 Eric Hansen. All rights reserved.
//  Controls the Scene View for the Annuity Calculator

import UIKit

class AnnuityViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var payment: UITextField!
    @IBOutlet weak var interest: UITextField!
    @IBOutlet weak var number: UITextField!
    @IBOutlet weak var calcOrdinary: UILabel!
    @IBOutlet weak var calcFuture: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Connects the text fields to this class
        payment.delegate = self
        interest.delegate = self
        number.delegate = self
        // Closes keyboard when user taps outside of the text field
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: Selector("endEditing:")))
    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        // Check that all inputs are numbers
        if let PMT = Double(payment.text!), let r = Double(interest.text!), let T = Double(number.text!) {
            // Shows the calculation
            calcOrdinary.text = String(presentOrdinaryAnnuity(payment: PMT, interest: r/100, numberOfPayments: T))
            calcFuture.text = String(futureOrdinaryAnnuity(payment: PMT, interest: r/100, numberOfPayments: T))
        }
    }
}
