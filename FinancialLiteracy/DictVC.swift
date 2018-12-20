//
//  DictVC.swift
//  Financial Literacy
//  Credit to: https://stackoverflow.com/questions/40220905/create-uitableview-programmatically-in-swift
//  Created by Eric Hansen on 11/19/18.
//  Copyright © 2018 Eric Hansen. All rights reserved.
// Represents a searchable, dictionary table allowing you to favorite terms

import UIKit

// Dictionary element
struct dictElement {
    // var index: Int
    // var definition: String
    var favorited: Bool
    var word: String
}


class DictVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    // Creates the table view
    var tableView = UITableView()
    
    var tapRecognizer = UITapGestureRecognizer()
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    // Iniatilizes necessary arrays
    static var words = Array<String>()
    static var definitions = Array<String>()
    var searchResults = Array<String>()
    static var dictElements = Array<dictElement>()
    
    // Signals that the user is not yet searching for terms
    var searching = false
    
    // Creates the scene view
    override func viewDidLoad() {
        super.viewDidLoad()
        let searchHeight: CGFloat = 120
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        // Renders the table and connects it to this class
        tableView = UITableView(frame: CGRect(x: 0, y: searchHeight, width: displayWidth, height: displayHeight - searchHeight))
        tableView.dataSource = self
        tableView.delegate = self
        
        // Allows cells designed by the CustomCell class to be added and removed as needed
        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
        
        // Sets the title of the scene view
        self.navigationItem.title = "Dictionary"
        
        // Initializes the search results to all words
        searchResults = DictVC.words
        self.view.addSubview(tableView)
        
        // self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: Selector("endEditing:")))
    }
    
    // Loads the words and definitions into the dictionary from rtf files
    static func loadDictionary()
    {
        // Grabs the definitions text file
        if let rtfPath = Bundle.main.url(forResource: "definitions", withExtension: "rtf") {
            do {
                let attributedStringWithRtf: NSAttributedString = try NSAttributedString(url: rtfPath, options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.rtf], documentAttributes: nil)
                
                // Using a pipe delimiter, creates an array from the definitions file and stores it
                definitions = attributedStringWithRtf.string.components(separatedBy: "|")
            } catch let error {
                print("Got an error \(error)")
            }
    }
        
        // Grabs the words text file
        if let rtfPath = Bundle.main.url(forResource: "words", withExtension: "rtf") {
            do {
                let attributedStringWithRtf: NSAttributedString = try NSAttributedString(url: rtfPath, options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.rtf], documentAttributes: nil)
                
                // Using a pipe delimiter, creates an array from the words file and stores it
                words = attributedStringWithRtf.string.components(separatedBy: "|")
            } catch let error {
                print("Got an error \(error)")
            }
        }
        
        // Iterates through the words array to create an array of dictionary elements
        var count = 0
        for word in words
        {
            DictVC.dictElements.append(dictElement(favorited: false, word: word))
            count += 1
        }
    }
    
    // When the user clicks away from this scene, resets the page
    override func viewDidDisappear(_ animated: Bool)
    {
        super.viewDidDisappear(false)
        searching = false
        searchResults = DictVC.words
        // searchResults = definitionsArray
    }
    
    // Reloads the page when the user clicks back to this scene
    override func viewDidAppear(_ animated: Bool)
    {
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Returns number of words in the dictionary matching the search query
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching
        {
            return searchResults.count
        }
        else
        {
            return DictVC.words.count
        }
    }
    
    // Returns a cell for each word in the dictionary or the search results
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Creates a current dictionary element to be modified
        var curElement = dictElement(favorited: false, word: "")
        
        // Gets the dictElement corresponding to the current search
        if searching
        {
            let word = searchResults[indexPath.row]
            curElement = DictVC.getDictElement(word)
        }
        else
        {
            curElement = DictVC.getDictElement(indexPath.row)
        }
        
        let word = curElement.word
        // Gets a cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        
        // Connects the cell's favorited property to the element's
        cell.favorited = curElement.favorited
        
        // Changes the star image on the cell
        cell.changeStar()
        
        // Changes the cell's text to the appropriate word or search result
        if searching {
            cell.textLabel?.text = searchResults[indexPath.row]
        }
        else
        {
            cell.textLabel?.text = word
        }
        
        return cell
    }
    
    // When the user selects a cell, pushes them to a new scene view withthe word and its definition
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        // Instantiates the word definition scene
        let defVC = self.storyboard?.instantiateViewController(withIdentifier: "WordDefinition") as? WordDefinition
        
        // Sets the text of the scene to the appropriate word and definition
        let wordText = searchResults[indexPath.row]
        defVC?.word.text = wordText
        defVC?.defn.text = DictVC.definitions[DictVC.words.firstIndex(of: wordText)!]
        
        // Pushes the user to this scene
        self.navigationController?.pushViewController(defVC!, animated: true)
    }
    
    // Detects when the user has searched, changing the search results and reloading the table
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        // If the search text is equal to the first letters of any dictionary words, modifies the search results array
        searchResults = DictVC.words.filter({($0.prefix(searchText.count)).lowercased() == searchText.lowercased()})
        
        searching = true
        // find out if the cell was true
        tableView.reloadData()
    }
    
//    // Allows the user to click off the keyboard to dismiss it
//    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar)
//    {
//        tapRecognizer.addTarget(self.view, action: Selector("endEditing:"))
//        self.view.addGestureRecognizer(tapRecognizer)
//    }
//
//    // Dismiss Keyboard when search Ends
//    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
//        searchBar.endEditing(true)
//    }
//
    // Dismiss Keyboard when Search Ends
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        searchBar.endEditing(true)
    }
    
    // Given an index, returns the corresponding dict element
    static func getDictElement(_ index: Int) -> dictElement
    {
        return dictElements[index]
    }
    
    // Given a word, returns the corresponding dict element
    static func getDictElement(_ wordText: String) -> dictElement
    {
        for i in 0...(dictElements.count - 1)
        {
            if dictElements[i].word == wordText
            {
                return dictElements[i]
            }
        }
        return dictElement(favorited: false, word: "")
    }
    
    // Sets the dict element's properties based on the parameters
    static func setDictElement(_ wordText: String, _ favorited: Bool)
    {
        for i in 0...(dictElements.count - 1)
        {
            if dictElements[i].word == wordText
            {
                dictElements[i].favorited = favorited
            }
        }
    }
    
    // Gets the definition corresponding to a given word
    static func getDefn(_ wordText: String) -> String
    {
        let index = words.firstIndex(of: wordText)!
        return definitions[index]
    }
}



















