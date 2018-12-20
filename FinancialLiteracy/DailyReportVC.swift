//
// DailyReportVC
//
//  Created by Eric Hansen on 11/28/18.
//  Copyright © 2018 Eric Hansen. All rights reserved.
//  Credit to: https://www.youtube.com/watch?v=z2Z90aJUXhg
//
//  Represents a scene view with daily market information


import UIKit
import SwiftSoup

// Establishes the font for the stock percentages
let percentFont = UIFont.boldSystemFont(ofSize: 24.0)

class DailyReportVC: UIViewController
{

    // Renders the Daily Report View
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Adds the Bloomberg Headline to the view
        
        // Creates the label, establishing size and position
        let headlineLabel = UILabel(frame: CGRect(x: 16, y: 130, width: 343, height: 80))
        
        // Grabs the text from the Bloomberg website
        headlineLabel.text = getText("https://www.bloomberg.com/markets", "single-story-module__headline-link")
        headlineLabel.font = UIFont(name: "verdana", size: 17.0)
        headlineLabel.numberOfLines = 0
        headlineLabel.adjustsFontSizeToFitWidth = true
        headlineLabel.textColor = .white
        self.view.addSubview(headlineLabel)
        
        // Adds the Dow Jones Percentage
        let dowJones = UILabel(frame: CGRect(x: 170, y: 320, width: 150, height: 30))
        let dJPercent = getText("https://markets.on.nytimes.com/research/markets/usmarkets/snapshot.asp?symbol=599362", "weak")
        
        // Adds the S&P500 Percentage
        let sP500 = UILabel(frame: CGRect(x: 170, y: 393, width: 150, height: 30))
        let sPPercent = getText("https://markets.on.nytimes.com/research/markets/usmarkets/snapshot.asp?symbol=US%3BSPX", "weak")
        
        
        // Adds the NASDAQ Percentage
        let nasdaq = UILabel(frame: CGRect(x: 170, y: 462, width: 150, height: 30))
        let nDPercent = getText("https://markets.on.nytimes.com/research/markets/usmarkets/snapshot.asp?symbol=579435", "weak")
        
        if (nDPercent == "" || sPPercent == "" || dJPercent == "")
        {
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ErrorPage")
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else
        {
            modifyPercent(nasdaq, nDPercent)
            self.view.addSubview(nasdaq)
            modifyPercent(sP500, sPPercent)
            self.view.addSubview(sP500)
            // Stylizes the percentage
            modifyPercent(dowJones, dJPercent)
            self.view.addSubview(dowJones)
        }
    }
    
    // Given a url and a class name, grabs the text from an html file using a SwiftSoup Parser
    func getText(_ url: String, _ className: String) -> String {
        do {
            // Grabs the html from the webpage
            let url = try URL(string: url)
            let html = try String(contentsOf: url!, encoding: String.Encoding.utf8)
            
            // Grabs the text from within the html file
            let doc:  Document = try SwiftSoup.parse(html)
            let text = try doc.getElementsByClass(className).array()[0].text()
            return text
        }
        catch
        {
            return ""
            print("damn, I'm fucked")
        }
        
    }
    
    // Stylizes the percentage to indicate increase or decrease
    func modifyPercent(_ label: UILabel, _ text: String)
    {
        let index = text.index(text.startIndex, offsetBy: 0)
        if (text[index] == "+")
        {
            label.textColor = .green
            label.text = text
        }
        else
        {
            label.textColor = UIColor(red: 1.0, green: 0.3, blue: 0.3, alpha: 1.0)
            
            // Adds a negative sign to the text
            label.text = "-" + text
        }
        label.font = percentFont
    }
    
    // If the "Read More" button is clicked, opens the Bloomberg web page in Safari
    @IBAction func linkClicked(_ sender: Any)
    {
        if let url = NSURL(string: "https://www.bloomberg.com/markets")
        {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
    }
}


