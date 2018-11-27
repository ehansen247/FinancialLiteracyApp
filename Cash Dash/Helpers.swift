//
//  Helpers.swift
//  Cash Dash
//
//  Created by Michael Chen on 11/23/18.
//  Copyright © 2018 Chris50. All rights reserved.
//

import Foundation

import UIKit

func simpleInterestOf(principal p:Double, interest r:Double, periods T:Double) -> Double {
    return p*r*T
}

func compoundInterestOf(principal p:Double, interest r: Double, compoundings N: Double, periods T:Double) -> Double {
    return p*pow(1+r/N,N*T)
}

func cashFlow(income:Double, expenses:Double) -> Double {
    return income-expenses
}

func presentOrdinaryAnnuity(payment PMT:Double, interest r:Double, numberOfPayments T:Double) -> Double {
    return PMT*(1/r-1/(r*pow(1+r, T)))
}

func futureOrdinaryAnnuity(payment PMT:Double, interest r:Double, numberOfPayments T:Double) -> Double {
    return PMT*(pow(1+r,T)/r-1/r)
}

func leverage(liabilities:Double, debts:Double, income:Double) -> Double {
    return (liabilities+debts)/income
}

func double72(interest r:Double) -> Double {
    return 72/r
}
