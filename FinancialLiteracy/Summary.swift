//
//  Summary.swift
//  Budget
//
//  Created by Michael Chen on 11/29/18.
//  Copyright © 2018 Michael Chen. All rights reserved.
//

import Foundation
import UIKit

class Summary: UIViewController {
    
    // These are labels and fields
    @IBOutlet weak var income: UILabel!
    @IBOutlet weak var expenses: UILabel!
    @IBOutlet weak var savings: UILabel!
    var totalInc: Double = 0
    var cost: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Pass in the total income data from the previous view controller
        income.text = String(format: "$%.02f", totalInc)
        // Pass in the total expenses data from the previous view controller
        expenses.text = String(format: "$%.02f", cost)
        // Calculate total savings by subtracting total expenses from total income 
        savings.text = String(format: "$%.02f", totalInc - cost)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
}
