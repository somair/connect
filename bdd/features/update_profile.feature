Feature: Update Profile
    As a registered user
    I want to update my profile
    So that I can share my information with others

    Background: There is one user in the database
        Given there is a standard user in the database
        And I am logged in as that standard user

    Scenario: User views page
        Given I am "a logged in user"
        When I visit the "profile" page
        Then I see the profile settings form, prepopulated with my data

    Scenario: Biography field expands
        Given I am "a logged in user"
        When I visit the "profile" page
        And I add more than three lines to the biography field
        Then the field grows to accommodate the text

    Scenario: Remove a form from the skills list
        Given I am "a logged in user"
        When I visit the "profile" page
        And I click on remove next to the first skill form
        Then the first skill formset is removed from the list

    Scenario: Add another form to the skills list
        Given I am "a logged in user"
        When I visit the "profile" page
        And I click on add skill
        Then another skill formset is added to the bottom of the form

    @wip
    Scenario: Remove a form from the links list
        Given I am "a logged in user"
        When I visit the "profile" page
        And I click on remove next to the first link form
        Then the first link formset is removed from the list

    Scenario: Add another form to the links list
        Given I am "a logged in user"
        When I visit the "profile" page
        And I click on add link
        Then another link formset is added to the bottom of the form

    Scenario Outline: User submits update profile form
        Given I am "a logged in user"
        When I visit the "profile" page
        And there are two link formsets showing
        And there are two skill formsets showing
        And I enter "<full name>" into the "full name" field
        And I enter "<link 1 anchor>" into the "first anchor" field
        And I enter "<link 1 url>" into the "first url" field
        And I enter "<link 2 anchor>" into the "second anchor" field
        And I enter "<link 2 url>" into the "second url" field
        And I select "<skill 1 name>" from the "first skill name" dropdown
        And I select "<skill 1 proficiency>" from the "first skill proficiency" dropdown
        And I select "<skill 2 name>" from the "second skill name" dropdown
        And I select "<skill 2 proficiency>" from the "second skill proficiency" dropdown
        And I submit the form
        Then I see "<message>"

        Examples:
            |   full name   |   link 1 anchor   |   link 1 url          |   link 2 anchor   |   link 2 url          |   skill 1 name    |   skill 1 proficiency |   skill 2 name    |   skill 2 proficiency |   message                                     |
            |   ""          |   My link1        |   http://myurl1.com   |   My link2        |   http://myurl2.com   |   skill1          |   Beginner            |   skill2          |   Expert              |   Please enter your full name.                |
            |   First Last  |   ""              |   http://myurl1.com   |   My link2        |   http://myurl2.com   |   skill1          |   Beginner            |   skill2          |   Expert              |   All links must have an anchor.              |
            |   First Last  |   My link1        |   ""                  |   My link2        |   http://myurl2.com   |   skill1          |   Beginner            |   skill2          |   Expert              |   All links must have a URL.                  |
            |   First Last  |   My link1        |   http://myurl1.com   |   My link1        |   http://myurl2.com   |   skill1          |   Beginner            |   skill2          |   Expert              |   Links must have unique anchors and URLs.    |
            |   First Last  |   My link1        |   http://myurl1.com   |   My link2        |   http://myurl1.com   |   skill1          |   Beginner            |   skill2          |   Expert              |   Links must have unique anchors and URLs.    |
            |   First Last  |   My link1        |   http://myurl1.com   |   My link2        |   http://myurl2.com   |   ---------       |   Beginner            |   skill2          |   Expert              |   All skills must have a skill name.          |
            |   First Last  |   My link1        |   http://myurl1.com   |   My link2        |   http://myurl2.com   |   skill1          |   ---------           |   skill2          |   Expert              |   All skills must have a proficiency.         |
            |   First Last  |   My link1        |   http://myurl1.com   |   My link2        |   http://myurl2.com   |   skill1          |   Beginner            |   skill1          |   Expert              |   Each skill can only be entered once.        |
            |   First Last  |   My link1        |   http://myurl1.com   |   My link2        |   http://myurl2.com   |   skill1          |   Beginner            |   skill2          |   Expert              |   Your example.com profile has been updated.  |
