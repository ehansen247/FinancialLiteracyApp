//
//  LeverageViewController.swift
//  FinancialLiteracy
//
//  Created by Michael Chen on 11/30/18.
//  Copyright © 2018 Eric Hansen. All rights reserved.
//

import UIKit

class LeverageViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var liabilities: UITextField!
    @IBOutlet weak var debts: UITextField!
    @IBOutlet weak var income: UITextField!
    @IBOutlet weak var calculation: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        liabilities.delegate = self
        debts.delegate = self
        income.delegate = self
        // Closes keyboard when user taps outside of the text field
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: Selector("endEditing:")))
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        if let l = Double(liabilities.text!), let d = Double(debts.text!), let i = Double(income.text!) {
            calculation.text = String(leverage(liabilities:l, debts:d, income:i))
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
