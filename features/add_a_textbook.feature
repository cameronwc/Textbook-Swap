Feature: Add A Textbook
As a Student
I want to add a textbook to textswap
So that I can trade my textbook for another

Scenario: User sees an add a textbook form
When I go to the add a textbook page
Then be able to submit a book

Scenario: User sees a textbook that they own
When User clicks sell one like this button
Then User is redirected to sell a textbook form
And The textbook information is prefilled
