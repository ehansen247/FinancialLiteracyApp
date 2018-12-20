#  Financial Literacy (Cash Dash) - Design

Our project has several components: a budget, curriculum, dictionary of terms, financial calculators, and a daily report. All these elements share the same goal: improve the user's financial literacy and understanding of personal finance. 

Our target audience is beginners. This app is intended for use by people who have little to no understanding of personal finance. As a result, much of our design decisions were grounded in making the user interface as simple and unintimidating as possible. 

## Style
Early on, we agreed on emulating a beginner-free style similar to Duolingo's iPhone app. As a result, we chose soft shades of blue and white for the color scheme. We also used a friendly font style and limited the number of elements on a given page to keep things simple. 

We embedded every component in XCode's default navigation controller to allow for easy back and forth navigation through sequences of screens.

Creating a custom rounded button helped us standardize this friendly style throughout the app. Nearly every link has the same style: a dark blue background, white text, rounded corners button.

## Creating Elements Programatically vs. on the Storyboard
In general, we decided to create elements on the storyboard when minimal functionality was needed. Building on the storyboard makes editing the layout of a screen easier and faster (just drag and drop elements), but sacrifices potential complexity.

For instance, the entire curriculum sequence was designed on the storyboard because the text and buttons are static and there is no room for user customization. The dictionary tables and table cells, however, were designed programatically so that we could add more UI features like the option to favorite dictionary terms and search the dictionary dynamically. 

## Solving Technical Challenges
A recurring challenge was how to access methods and alter variables from another class without instantiating that class. Since each of our scene views only need to be instantiated once, we realized that using static arrays and methods in the DictViewController and FavoritesVC classes would allow us to change the favorited status of dictionary terms remotely. Clicking the favorite button notifies a CustomCell object, which then calls static getters and setters in the FavoritesVC and DictViewController classes to update the scene view and keep track of favorited items. 

In order to implement a WebScraper, we decided to import SwiftSoup, a library that helps with HTML parsing. While it may have been possible to implement one without SwiftSoup, we were encountering multiple bugs without it. Using SwiftSoup came with the benefit of having access to reliable tutorials on how to implement a WebScraper with SwiftSoup. 

## Walkthrough

### Dictionary
We implemented the dictionary using a TabBarController, which allows us to have two tabs, displayed on the bottom of the screen. The dictionary class extends a number of interfaces (UITableViewDelegate, UISearchBarDelegate, etc.) so that we can keep the code implementing all the different elements from the dictionary (the table of terms, the search bar) in one class. We had to write the code implementing the "cells" of the table in a separate file because of the limitations of Swift's UITableView. Values like the favorited status of each cell and its corresponding word are passed between the DictVC/FavoriteVC classes and the Custom Cell class via static getters and setters. The dictionary terms and definitions are read from two .rtf files when the homepage is opened, which calls the function "loadDictionary()". Since the homepage can only be accessed once each time the app is opened, the dictionary will only be loaded once, saving time. We decided to store the dictionary terms in separate text files so that they would not take up too much space in the Swift files. 

When the user searches, the function "searchBar" updates the "searchResults" array with the matching, case-insensitive words and the table view is updated. When the user clicks on a word's cell, the third "tableView" function pushes the user to the WordDefinition view controller.

The dictionary's favorited terms are stored even when the app closes in the "User Defaults" database (see the "applicationWillResignActive function" in the AppDelegate class), which is provided by the Swift library. For ease of implementation and ensured cohesiveness with the rest of Swift, we decided to use this database instead of an SQLite or online database.

### Word Definition
The word definition class represents a scene view containing two labels: a word and its definitions. These labels' texts are determined in the FavoriteVC and DictVC classes' third "tableView" function (see parameters).

### Daily Report
We impelemented the daily report using labels from the storyboard and then using a SwiftSoup WebScraper to get information from the websites. Using class names found on websites' page sources, we scrape the headline off of Bloomberg Markets's homepage, and percent changes in the DOW, S&P500, and NASDAQ from the NYTimes. By seeing if the first character of the percentage strings is a "+" or not, we toggle the color of the percentage from green to red. 

### Budget
We implemented the budget using text fields, labels, and a couple of buttons that allow the user to move through the three screens (income, expenses, summary). The primary challenges were passing variables across the various View Controller classes and updating the funds available dynamic. We solved the former by creating a function (prepare) in our Expenses and ViewController classes which pre-emptively changes the values of variables in the next screen. We solved the latter by adding functions to each of the text fields, which detect when the user has edited a text field and updates/displays the funds available.

### Financial Calculator
On the financial calculators, we decided to add explanation pages to each calculation option in order to ensure the user can find and understand what they're looking for. This decision supported our larger objective of helping beginner users. 

We implemented the financial calculators using text fields and buttons, running various algorithms to compute the results on the backend. Transitions between scene views were made using "segues" a storyboard feature in XCode.

Our biggest technical challenge was configuring the views to accept user input, operate on that input, and convert it back into postable data to be displayed on the screen. This required a deep understanding of Swift's model-view-controller architecture and Swift's strict typecasting (to convert data from readable data into operatable data and vice versa).

### Curriculum
To implement the curriculum, we mainly had to create a page of buttons which linked to the "chapters" of the curriculum, then simply paste the curriculum text into these screens. Because each view contained more information than could fit into one screen, we contained our view containers and our text within a larger "Scroll View" object, another storyboard feature of XCode. Because each view had a different amount of content, this task required us to precisely determine how far the views could be scrolled. 




