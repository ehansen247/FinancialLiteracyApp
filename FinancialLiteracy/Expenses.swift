//
//  Expenses.swift
//  Budget
//
//  Created by Michael Chen on 11/29/18.
//  Copyright © 2018 Michael Chen. All rights reserved.
//

import UIKit

class Expenses: UIViewController, UITextFieldDelegate
{
    // These are labels and fields in the main storyboard
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var textField4: UITextField!
    @IBOutlet weak var textField5: UITextField!
    @IBOutlet weak var textField6: UITextField!
    @IBOutlet weak var textField7: UITextField!
    @IBOutlet weak var textField8: UITextField!
    @IBOutlet weak var fundsAvailable: UILabel!
    @IBOutlet weak var costs: UILabel!
    
    var total: Double = 0
    var totalInc: Double = 0
    var funds: Double = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Connects text fields to class
        textField1.delegate = self
        textField2.delegate = self
        textField3.delegate = self
        textField4.delegate = self
        textField5.delegate = self
        textField6.delegate = self
        textField7.delegate = self
        textField8.delegate = self
        // Initialize text fields to 0
        textField1.text = "\(Double(0))"
        textField2.text = "\(Double(0))"
        textField3.text = "\(Double(0))"
        textField4.text = "\(Double(0))"
        textField5.text = "\(Double(0))"
        textField6.text = "\(Double(0))"
        textField7.text = "\(Double(0))"
        textField8.text = "\(Double(0))"
        totalInc = total
        fundsAvailable.text = String(format: "$%.02f", total)
        // Closes keyboard when user taps outside of the text field
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: Selector("endEditing:")))
    }
    // Define a function that allows the user to sum up different expense fields
    func sum() -> Double
    {
        var sum = Double()
        
        // Ensure the text field is not nil. Sums up fields.
        if (textField1.text != "")
        {
            sum = sum + Double(textField1.text!)!
        }
        if (textField2.text != "")
        {
            sum = sum + Double(textField2.text!)!
        }
        if (textField3.text != "")
        {
            sum = sum + Double(textField3.text!)!
        }
        if (textField4.text != "")
        {
            sum = sum + Double(textField4.text!)!
        }
        if (textField5.text != "")
        {
            sum = sum + Double(textField5.text!)!
        }
        if (textField6.text != "")
        {
            sum = sum + Double(textField6.text!)!
        }
        if (textField7.text != "")
        {
            sum = sum + Double(textField7.text!)!
        }
        if (textField8.text != "")
        {
            sum = sum + Double(textField8.text!)!
        }
    
        // Return the sum in traditional dollar format with 2 decimal places
        return round(sum * 100) / 100
    }
    
    @IBAction func textFieldChanged(_ sender: UITextField)
    {
        if (sender.text != "")
        {
            // Update the total expenses
            let cost = sum()
            // Pass the value of total expenses into the costs text field
            costs.text = String(format: "$%.02f", cost)
            
            // Calculates funds available
            total = totalInc - cost
            funds = round(total * 100) / 100
            // Update the funds available by passing in the variable calculated
            fundsAvailable.text = String(format: "$%.02f", funds)
        }
    }
    
    
    // Pass total income and total expenses variables from expenses view screen to summary view screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let destVC : Summary = segue.destination as! Summary
        destVC.totalInc = totalInc
        destVC.cost = sum()
    }
}
