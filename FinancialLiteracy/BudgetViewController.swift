//
//  ViewController.swift
//  Budget
//
//  Created by Michael Chen on 11/29/18.
//  Copyright © 2018 Michael Chen. All rights reserved.
//

import UIKit

class BudgetViewController: UIViewController, UITextFieldDelegate {
    
   // These are labels and fields
    @IBOutlet weak var takeHomePayField: UITextField!
    @IBOutlet weak var dividendsField: UITextField!
    @IBOutlet weak var pensionsField: UITextField!
    @IBOutlet weak var interestField: UITextField!
    @IBOutlet weak var calculation: UILabel!
    
    var total: Double = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Connects text fields to class
        takeHomePayField.delegate = self
        pensionsField.delegate = self
        interestField.delegate = self
        dividendsField.delegate = self
        
        // Initialize text fields to 0
        takeHomePayField.text = "\(Double(0))"
        pensionsField.text = "\(Double(0))"
        interestField.text = "\(Double(0))"
        dividendsField.text = "\(Double(0))"
        // Closes keyboard when user taps outside of the text field
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: Selector("endEditing:")))
    }
        
    // When “calculate total income!” button is pressed, the total income is displayed after summing up each input in each text field
    @IBAction func buttonPressed(_ sender: UIButton)
    {
        if let w = Double(takeHomePayField.text!), let x = Double(pensionsField.text!), let y = Double(interestField.text!), let z = Double(dividendsField.text!) {
        let totalInc = round(totalIncome(takeHomePay: w, pensionsSocialSecurity: x, interest: y, dividends: z) * 100) / 100
        calculation.text = String(format: "$%.02f", totalInc)
        total = totalIncome(takeHomePay: w, pensionsSocialSecurity: x, interest: y, dividends: z)}
    }
    // Pass total income variable from the view controller view screen to the expenses view screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC : Expenses = segue.destination as! Expenses
        destVC.total = self.total
    }
}
