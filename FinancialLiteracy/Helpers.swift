//
//  Helpers.swift
//  Cash Dash
//
//  Created by Michael Chen on 11/23/18.
//  Copyright © 2018 Chris50. All rights reserved.
//

import Foundation

import UIKit

// Function that calculates simple interest given principal, interest, and periods
func simpleInterestOf(principal p:Double, interest r:Double, periods T:Double) -> Double
{
    return p*r*T
}
// Function that calculates compound interest given principal, interest, compoundings, and periods
func compoundInterestOf(principal p:Double, interest r: Double, compoundings N: Double, periods T:Double) -> Double {
    return p*pow(1+r/N,N*T)
}
// Function that calculates cash flow given income and expenses
func cashFlow(income:Double, expenses:Double) -> Double
{
    return income-expenses
}
// Function that calculates present ordinary annuity given payment, interest, and number of payments
func presentOrdinaryAnnuity(payment PMT:Double, interest r:Double, numberOfPayments T:Double) -> Double
{
    return PMT*(1/r-1/(r*pow(1+r, T)))
}
// Function that calculates future ordinary annuity given payment, interest, and number of payments
func futureOrdinaryAnnuity(payment PMT:Double, interest r:Double, numberOfPayments T:Double) -> Double
{
    return PMT*(pow(1+r,T)/r-1/r)
}
// Function that calculates leverage given liabilities, debts, and income
func leverage(liabilities:Double, debts:Double, income:Double) -> Double
{
    return (liabilities+debts)/income
}
// Function that uses the rule of 72 to calculate doubling time given interest rate
func double72(interest r:Double) -> Double
{
    return 72/r
}
// Function that calculates total income given take home pay, pensions/social security, interes payments, and dividends
func totalIncome(takeHomePay w:Double, pensionsSocialSecurity x:Double, interest y:Double, dividends z:Double) -> Double
{
    return w+x+y+z
}
// Function that calculates total expenses given user inputs
func totalExpenses(textField1 a:Double, textField2 b:Double, textField3 c:Double, textField4 d:Double, textField5 e:Double, textField6 f:Double, textField7 g:Double, textField8 h:Double) -> Double {
    return a+b+c+d+e+f+g+h
}

