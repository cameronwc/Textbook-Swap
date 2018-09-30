Feature: Search for a Textbook
As a student
So that I can find the book I need
I want to search on TextSwap.

Scenario: User searches for a book by title
Given I am on my user homepage		
When I search for a book by title in the search box
Then I should see a listing of books matching that title.

Scenario: User searches for a book by ISBN
Given I am on my user homepage
When I search for a book by ISBN in the search box
Then I should see a listing of books matching that ISBN
