//
//  CashFlowViewController.swift
//  FinancialLiteracy
//
//  Created by Michael Chen on 11/30/18.
//  Copyright © 2018 Eric Hansen. All rights reserved.
//

import UIKit

class CashFlowViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var income: UITextField!
    @IBOutlet weak var expenses: UITextField!
    @IBOutlet weak var calculation: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        income.delegate = self
        expenses.delegate = self
        // Closes keyboard when user taps outside of the text field
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: Selector("endEditing:")))
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        //Check that all inputs are numbers
        if let i = Double(income.text!), let e = Double(expenses.text!) {
            //Shows calculation
            calculation.text = String(cashFlow(income:i, expenses:e))
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
