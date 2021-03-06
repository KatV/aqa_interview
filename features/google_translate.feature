Feature: Google Translate

In order to translate a word, text
I want to add a word, text, change language, press button

Scenario: Translate word from Russian into English 
	Given I go to Google Translate site
	When I fill in gap with "кот" 
	Then I should see "cat"

Scenario Outline: Translate text from English into Russian
	Given I go to Google Translate site
	When I fill in gap with "The weather is good. The sun is shining brightly."
	And I choose language <language>
	And I press the button	
	Then I should see "Хорошая погода.Солнце светит ярко."
	
	Examples:
	| language |
	| Russian |
	
Scenario Outline: Translate a world from language1 into language2
        Given I go to Google Translate site
        When I enter <query>
        And I choose language <language>
        And I press the button
        Then I see translation <result>
    
        Examples:
        | query | language | result |
        | кот  | Italian  | gatto |
		| cat  | Norwegian  | katt |
	 
    
	
    