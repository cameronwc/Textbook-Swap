Feature: Search for a Textbook
<<<<<<< HEAD
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

Scenario: User searches for a book by Author
Given I am on my user homepage
When  I search for a book by an author's name in the search box
Then  I should see a listing of books matching the author's name

Scenario: User finds no search results when searching
Given I am on my user homepage
When I search for a book and there's no matches
Then I should see a page that displays there were no results found

=======
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

  Scenario: User searches for a book by Author
    Given I am on my user homepage
    When  I search for a book by an author's name in the search box
    Then  I should see a listing of books matching the author's name

  Scenario: User finds no search results when searching
    Given I am on my user homepage
    When I search for a book and there's no matches
    Then I should see a page that displays there were no results found
>>>>>>> search_b
