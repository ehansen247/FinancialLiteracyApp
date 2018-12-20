#  Financial Literacy (Cash Dash) - ReadMe

## Introduction
This project is an iOS personal financial literacy app created using Swift and Xcode that contains 5 distinct components.
Upon opening up our app (entitled “Cash Dash”), and clicking “get started,” the user is greeted with a home screen that contains 5
buttons (budget, dictionary, curriculum/learning from a course, a financial calculator, and financial news).
Please note that some components of this app (as of right now) require the user to be on a secure Wi-Fi network.
I will now explain the information contained within each button. ***Our iOS app is currently only compatibile with iPhone8.***

## Setting up the App Environment
Running this project from the source code requires XCode downloaded on a Mac computer.
First, download the submission folder containing all of the subfolders as well as the README and DESIGN documents.
Then, from XCode, open the submission folder as an XCode project in order to open the entire project in XCode.
It is important that you open the XCode project from the top-level folder and not one of the subfolders as this will prevent the
project from running properly. In the top left corner, click on the button that has the different models of iPhone that the simulator
can run on and select iPhone 8. Click the triangle "play" button to run the app in the XCode Simulator. ***If the project submission fails to
compile in XCode after being unzipped, contact erichansen@college.harvard.edu. It is likely because the Pod files were not loaded from
the zip properly.***


## Daily Report
First, the daily report. Upon clicking on “Today’s Report,” the user is taken to a screen that displays at the top,
the top financial news headline from Bloomberg. There is also a link entitled “read more” that the user can click on
to navigate to the Bloomberg Markets homepage. Below this headline is a data aggregator built on a web scraper algorithm
with daily information from the Dow Jones, NASDAQ, and the S&P 500. Green text indicates growth, while red text indicates a fall.
***Do not use the Daily Report unless on a secure Wifi network***

## Curriculum
Second, the curriculum/learning from a course. Upon clicking on “curriculum,” the user is taken to a welcome screen
that explains the goals of the course and how to navigate the different sections of the course. After the welcome screen is a menu page that displays 10 sections of information - credit, debt, retirement, savings/budgeting, etc. When clicked, each different section takes the user to a new screen that displays a plethora of financial information about that subject that we compiled from multiple personal finance sites. The user can switch back and forth between different sections via back buttons on each screen.

## Dictionary
Third, the dictionary. After clicking on “dictionary,” the user is taken to a scrollable screen with about 100 common
financial terms displayed in table view. A search bar at the top allows the user to type in any financial term they wish
to look up (as they type, the applicable terms in the dictionary will pop up). The user can click on any term at any time
Clicking on a term takes the user to a new screen with the definition of that term. Furthermore, for each term,
there is a star on the right-hand side that allows the user to favorite terms. These favorited terms can be accessed via
a selection box at the bottom entitled “favorites.” ***These favorite buttons can take a few tries to select because of
their size and the nature of the iPhone touch detection***

## Financial Calculators
Fourth, the financial calculator. Upon clicking on “financial calculator,” the user is taken to a menu screen with
different options of popular personal finance equations (calculating compound interest, cash flow, leverage ratio, etc.).
Upon clicking on each option, the user is taken to a screen with various input fields (for example, upon clicking on “simple
interest,” the user is able to enter a principal amount, an interest rate -> in percentage form, and number of periods/time).
After entering information in each field, the user can click the “calculate” button at the bottom, which will display a numerical
value. Below this numerical value is another button called “explain,” which will take the user to a new screen with an explanation
of what that value means and how it can be used.

## Budget
Finally, the budget. After clicking the budget, the user is taken to a screen entitled “Income” with 4 input fields.
The user can then enter in income obtained from a variety of different sources (like take-home pay, interest from bank
accounts, etc.). A button at the end called “calculate total income” allows the user to see how much total income they’re
pulling in (in dollars). The next button at the bottom enables the user to navigate to the next screen, expenses. Expenses
contains 8 input fields (split up into flexible and fixed expenses), as well as 2 sections near the bottom that indicate
funds available to expend (income - expenses), as well as total expenses (adds up all the expenses). These will update dynamically
as the user inputs information into the boxes. The next button at the bottom of this screen enables the user to navigate to the
last screen, “summary of budget”. This screen contains information about total income, total expenses, and savings available
(income - expenses). Back buttons near the top of each view screen allow the user to return to income or expenses.

The user can navigate from each of these different components back to the main menu screen using back buttons.
