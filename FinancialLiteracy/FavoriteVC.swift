//
//  FavoriteVC.swift
//  Financial Literacy
//  Credit: https://stackoverflow.com/questions/40220905/create-uitableview-programmatically-in-swift
//  Created by Eric Hansen on 11/19/18.
//  Copyright © 2018 Eric Hansen. All rights reserved.
//  Represents a dictionary table including only favorited terms
import UIKit

class FavoriteVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    // The search bar
    @IBOutlet weak var searchBar: UISearchBar!
    
    // The table
    var tableView = UITableView()
    
    // Initializes necessary arrays
    static var favoriteWords = Array<String>()
    var searchResults = Array<String>()
    
    // Indicates the user is not yet searching
    var searching = false
    
    // Creates the scene view
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let searchHeight: CGFloat = 120
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        // Creates the dictionary table and connects it to this scene view
        tableView = UITableView(frame: CGRect(x: 0, y: searchHeight, width: displayWidth, height: displayHeight - searchHeight))
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
        self.navigationItem.title = "Dictionary"
        
        // Updates the search results
        searchResults = FavoriteVC.favoriteWords
        self.view.addSubview(tableView)
        
        // self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: Selector("endEditing:")))
    }
    
    override func viewDidDisappear(_ animated: Bool)
    {
        super.viewDidDisappear(false)
        searching = false
        searchResults = FavoriteVC.favoriteWords
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        tableView.reloadData()
    }
    
    // Returns number of words in the dictionary
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching
        {
            return searchResults.count
        }
        else
        {
            return FavoriteVC.favoriteWords.count
        }
    }
    
    // Adds a favorited word to the favorite words array
    static func addWord(_ word: String, _ defn: String)
    {
        favoriteWords.append(word)
    }
    
    // Removes a word from the favorited word array
    static func removeWord(_ word: String, _ defn: String)
    {
        if favoriteWords.contains(word)
        {
            favoriteWords.remove(at: favoriteWords.firstIndex(of: word)!)
        }
    }
    // Returns a cell for each word in the dictionary
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        
        // Sets the cell's favorited status as true since it is in the favorited array
        cell.favorited = true
        var label = String()
        
        // Changes the cell's text to the appropriate word or search result
        if searching {
            label = searchResults[indexPath.row]
        }
        else
        {
            label = FavoriteVC.favoriteWords[indexPath.row]
        }
        cell.textLabel?.text = label
        
        // Renders the star button
        cell.changeStar()
        
        return cell
    }
    
    // When the user selects a cell, pushes them to a new scene view withthe word and its definition
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Instantiates the word definition scene
        let defVC = self.storyboard?.instantiateViewController(withIdentifier: "WordDefinition") as? WordDefinition
        var wordText = String()
        if searching
        {
            wordText = searchResults[indexPath.row]
        }
        else
        {
            wordText = FavoriteVC.favoriteWords[indexPath.row]
        }
        
        // Sets the word and definition for the next scene
        defVC?.word.text = wordText
        defVC?.defn.text = DictVC.definitions[DictVC.words.firstIndex(of: wordText)!]
        
        // Pushes the user to the word definition scene
        self.navigationController?.pushViewController(defVC!, animated: true)
    }
    
    // Detects when the user has searched, changing the search results and reloading the table
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        searchResults = FavoriteVC.favoriteWords.filter({$0.prefix(searchText.count) == searchText})
        searching = true
        tableView.reloadData()
    }
    
//    // Dismiss Keyboard when search Ends
//    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
//        searchBar.endEditing(true)
//    }
    
    // Dismiss Keyboard when Search Ends
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        searchBar.endEditing(true)
    }

    
    // Reloads the tableview data
    func reloadData()
    {
        tableView.reloadData()
    }
    
    // Loads the favorited words from the User defaults database
    static func loadFavorites()
    {
        let defaults = UserDefaults.standard
        favoriteWords = defaults.array(forKey: "favorites") as! [String]
        
        // Iterates over the favorited words array from the database and updates their favorited status
        for word in favoriteWords
        {
            DictVC.setDictElement(word, true)
        }
    }
    
}
