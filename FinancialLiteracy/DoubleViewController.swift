//
//  DoubleViewController.swift
//  FinancialLiteracy
//
//  Created by Michael Chen on 11/30/18.
//  Copyright © 2018 Eric Hansen. All rights reserved.
//

import UIKit

class DoubleViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var interest: UITextField!
    @IBOutlet weak var calculation: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        interest.delegate = self
        // Closes keyboard when user taps outside of the text field
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: Selector("endEditing:")))
    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        if let r = Double(interest.text!) {
            //show calculation
            calculation.text = String(double72(interest: r))
        }
    }
}
