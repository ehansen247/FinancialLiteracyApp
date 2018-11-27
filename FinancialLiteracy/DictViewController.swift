//
//  DictViewController.swift
//  Financial Literacy
//
//  Created by Eric Hansen on 11/19/18.
//  Copyright © 2018 Eric Hansen. All rights reserved.
import UIKit

// The dictionary terms
let words: Array<String> = ["Loans", "Mortgages", "Stocks", "Leases"]

var searchResults = words
var searching = false

class DictViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // Creates the scene view
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Dictionary"
        print("worked")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Returns number of words in the dictionary
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching
        {
            return searchResults.count
        }
        else
        {
            return words.count
        }
    }
    // Returns a cell for each word in the dictionary
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let word = words[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        if searching {
            cell.cellLabel?.text = searchResults[indexPath.row]
        }
        else
        {
            cell.cellLabel?.text = word
        }
        print("working")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let defVC = self.storyboard?.instantiateViewController(withIdentifier: "WordDefinition") as? WordDefinition
        defVC?.word.text = searchResults[indexPath.row]
        self.navigationController?.pushViewController(defVC!, animated: true)
    }
}

extension DictViewController: UISearchBarDelegate
{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        searchResults = words.filter({$0.prefix(searchText.count) == searchText})
        searching = true
        tableView.reloadData()
    }
}
//
//    // Creates the bulleted list of dictionary words
//    func createList()
//    {
//        var buttonY = 100
//        var buttonT = 0
//        for word in words
//        {
//            // Creates a black button
//            let button = UIButton()
//            button.frame = CGRect(x: 20, y: buttonY, width: 300, height: 30)
//            button.tag = buttonT
//            buttonY += 30
//            buttonT += 1
//            let titleLabel = "\u{2022} " + word
//            button.setTitle(titleLabel, for: UIControl.State.normal)
//            button.setTitleColor(UIColor.black, for: UIControl.State.normal)
//            button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
//
//            // Adds an action to the button
//            button.addTarget(self, action: #selector(pressButton), for: UIControl.Event.touchUpInside)
//
//            // Renders the button in the DictViewController scene
//            self.view.addSubview(button)
//        }










