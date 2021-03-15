Feature: Search Feature
	Test Automated are listed here
	In order to validate the search feature capabilities on the homepage
	As a user
	I want to be able search for a product and verify relevant items are displayed as per the search keyword
	And also verify all the other details and options displayed in the search result

@Search_title
Scenario Outline:1. Verify search title 
	Given I navigate to bunnings homepage on <browser>
	When I enter <search_keyword> and click on the search button
	Then I verify I am navigated to search results page and verify title
	Examples:
	| browser | search_keyword |
	| chrome  | ratsak         |


@Search_item_not_stocked
Scenario Outline:2. Item not stocked
	Given I navigate to bunnings homepage on <browser>
	When I enter <search_keyword> and click on the search button
	Then I verify I am navigated to search results page and verify title 
	And I verify zero resuts and help text is displayed
	Examples:
	| browser | search_keyword |
	| chrome  | sleeping bag   |

@Search_history
Scenario Outline:3. Verify recent search history
	Given I navigate to bunnings homepage on <browser>
	When I enter <search_keyword> and click on the search button
	Then I verify I am navigated to search results page and verify title 
	When I click on the search box again 
	Then I verify the <search_keyword> is displayed in recent searches
	Examples:
	| browser | search_keyword |
	| chrome  | sand           |

