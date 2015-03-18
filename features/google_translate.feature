Feature: Google Translate

In order to translate a word, text
I want to add a word, text, change language, press button

Scenario: Translate word from English into Russian
	Given I go to Google Translate site
	When I fill in gap with "cat" 
	Then I should see "кот"

Scenario: Translate text from Russian into English
	Given I go to Google Translate site
	When I fill in gap with "Погода хорошая. Солнце светит ярко."
	And I choose English language
	And I press the button	
	Then I should see "The weather is good. The sun is shining brightly."
	
Scenario Outline: Translate a variety of words into Russian
	Given I go to Google Translate site
	When I enter <query> 
    And I choose Russian language
	Then I should see a translation of <query1>
    
    Examples:
    |query|query1|
    |cat|кот|
    |<h2>|<h2>|
	
Scenario Outline: Translate words from Russian into English	
	Given I go to Google Translate site
	When I enter <query> 
    And I choose English language
	And I press the button
	Then I should see a translation of <query1>
	
	Examples:
    |query|query1|
    |кот|cat|
	 
    
	
    