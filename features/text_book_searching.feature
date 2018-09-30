Feature: Search for a Textbook
As a student
So that I can find the book I need
I want to search on TextSwap.

Scenario: User searches for a book by title
When I search for a book by title
Then I should see a listing of books matching that title.

Scenario: User searches for a book by ISBN
When I search for a book by ISBN
Then I should see a listing of books matching that ISBN
