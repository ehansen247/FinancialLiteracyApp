//
//  CompoundViewController.swift
//  FinancialLiteracy
//
//  Created by Michael Chen on 11/30/18.
//  Copyright © 2018 Eric Hansen. All rights reserved.
//

import UIKit

class CompoundViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var principal: UITextField!
    @IBOutlet weak var interest: UITextField!
    @IBOutlet weak var compoundings: UITextField!
    @IBOutlet weak var periods: UITextField!
    @IBOutlet weak var calculation: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        principal.delegate = self
        interest.delegate = self
        compoundings.delegate = self
        periods.delegate = self
        // Closes keyboard when user taps outside of the text field
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: Selector("endEditing:")))
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        //Check that all inputs are numbers
        if let p = Double(principal.text!), let r = Double(interest.text!), let N = Double(compoundings.text!), let T = Double(periods.text!) {
            //Shows calculation
            calculation.text = String(compoundInterestOf(principal: p, interest: r/100, compoundings: N, periods: T))
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
