Feature: All tests for Search Feature
	In order to validate the search feature capabilities on the homepage
	As a user
	I want to be able search for a product and verify relevant items are displayed as per the search keyword
	And also verify all the other details and options displayed in the search result

@Search_title
Scenario Outline:1. Search search title 
	Given I navigate to bunnings homepage on <browser>
	When I enter <search_keyword> and click on the search button
	Then I verify I am navigated to search results page and verify title
	Examples:
	| browser | search_keyword |
	| chrome  | ratshak        |


@Search_item_not_stocked
Scenario Outline:2. Search keyword and results - item not stocked
	Given I navigate to bunnings homepage on <browser>
	When I enter <search_keyword> and click on the search button
	Then I verify I am navigated to search results page 
	And the <search_keyword> is displayed in the search title
	And zero resuts displayed and verify help text displayed
	Examples:
	| browser | search_keyword |
	| chrome  | sleeping bag   |

@Search_history
Scenario Outline:3. Verify recent search history
	Given I navigate to bunnings homepage on <browser>
	When I enter <search_keyword> and click on the search button
	Then I verify I am navigated to search results page 
	When I click on the search box again 
	Then I verify the <search_keyword> is displayed in recent searches
	Examples:
	| browser | search_keyword |
	| chrome  | sand           |

Scenario Outline:4. Search results displayed 
	Given I navigate to bunnings homepage on <browser>
	When I enter <search_keyword> and click on the search button
	Then I verify I am navigated to search results page 
	And the <search_keyword> is displayed in the search title
	And the items displayed in Our Range tab are relevant to the search keyword
	Examples:
	| browser | search_keyword |
	| chrome  | ratshak        |

Scenario Outline:5. Verify Tabs displayed in search results
	Given I navigate to bunnings homepage on <browser>
	When I enter <search_keyword> and click on the search button
	Then I verify I am navigated to search results page 
	Then I verify four <tabs> with the number of search results displayed for each
	And I can click on the tabs with more than one result displayed
	And I also verify the search results displayed in each tab
	Examples:
	| browser         | search_keyword   | tabs         |
	| chrome          | chubby house     | Our Range    |
	| safari          | screws           | D.I.Y Advice |
	| firefox         | beach chair      | Service      |
	| Edge            | bench            | Other        |
	| ipad_safari     | decking oil      | Other        |
	| ipad_chrome     | fence paint      | Our Range    |
	| ipad_pro_safari | playground mulch | D.I.Y Advice |
	| ipad_pro_chrome | swing            | Service      |
	| iphone_X_chrome | slide            | Other        |
	| iphone_X_safari | chubby house     | Our Range    |
	| andriod_chrome  | pool             | D.I.Y Advice |
	| Pixel           | play sand        | Service      |

Scenario Outline:6. Clear recent search history
	Given I navigate to bunnings homepage on <browser>
	When I enter <search_keyword> and click on the search button
	Then I verify I am navigated to search results page 
	When I click on the search box again 
	And click on the clear recent searches text
	Then I verify the recent history is <cleared>
	And the <search_keyword> is not displayed in recent searches
	Examples:
	| browser         | search_keyword  | cleared |
	| chrome          | screws 100 pack | clear   |
	| safari          | lavender        | clear   |
	| firefox         | rosemary        | clear   |
	| Edge            | wood            | clear   |
	| ipad_safari     | paint           | clear   |
	| ipad_chrome     | fence           | clear   |
	| ipad_pro_safari | mulch           | clear   |
	| ipad_pro_chrome | soil            | clear   |
	| iphone_X_chrome | fan             | clear   |
	| iphone_X_safari | tent            | clear   |
	| andriod_chrome  | sleeper         | clear   |
	| Pixel           | bag             | clear   |

Scenario Outline:7. Verify sorting options in search results page
	Given I navigate to bunnings homepage 
	When I enter <search_keyword> and click on the search button
	Then I verify I am navigated to search results page 
	And I verify that I can select the <sorting_option> displayed 
	And the search results are updated based on the <sorting_option> selected
	Examples:
	| browser         | search_keyword | sorting_option     |
	| chrome          | rose plant     | Relevance          |
	| safari          | lavender       | Price (Low-high)   |
	| firefox         | rosemary       | Price (high-low    |
	| Edge            | wood           | Product name (A-z) |
	| ipad_safari     | paint          | Product name (Z-A) |
	| ipad_chrome     | fence          | Relevance          |
	| ipad_pro_safari | mulch          | Price (Low-high)   |
	| ipad_pro_chrome | soil           | Price (high-low    |
	| iphone_X_chrome | fan            | Product name (A-z) |
	| iphone_X_safari | tent           | Product name (Z-A) |
	| andriod_chrome  | sleeper        | Relevance          |
	| Pixel           | bag            | Price (Low-high)   |

Scenario Outline:8. Verify filter options in search results page
	Given I navigate to bunnings homepage 
	When I enter <search_keyword> and click on the search button
	Then I verify I am navigated to search results page 
	And I verify that I can select the <filter_option> displayed 
	And the search results are updated based on the <filter_option> selected
	Examples:
	| browser         | search_keyword   | filter_option   |
	| chrome          | bbq              | Categories      |
	| safari          | beach tent       | Shop By         |
	| firefox         | beach chair      | Buy Online      |
	| Edge            | bench            | Price Range     |
	| ipad_safari     | decking oil      | Brand           |
	| ipad_chrome     | fence paint      | Dimensions (mm) |
	| ipad_pro_safari | playground mulch | Categories      |
	| ipad_pro_chrome | swing            | Shop By         |
	| iphone_X_chrome | slide            | Buy Online      |
	| iphone_X_safari | chubby house     | Price Range     |
	| andriod_chrome  | pool             | Brand           |
	| Pixel           | play sand        | Dimensions (mm) |

Scenario Outline:9. Verify feedback box displayed 
	Given I navigate to bunnings homepage on <browser>
	When I enter <search_keyword> and click on the search button
	Then I verify I am navigated to search results page 
	And at the bottom, I verify the feed back box is displayed 
	When I select <option> and additional <feedback_text> if needed
	Then I verify the message 'Thank you for your feedback' is displayed
	Examples:
	| browser         | search_keyword   | option | feedback_text                                  |
	| chrome          | chubby house     | yes    | na                                             |
	| safari          | screws           | no     | enter some valid text of more than 20 words    |
	| firefox         | beach chair      | yes    | na                                             |
	| Edge            | bench            | no     | enter some valid text of more than 5000 words  |
	| ipad_safari     | decking oil      | yes    | na                                             |
	| ipad_chrome     | fence paint      | no     | enter some valid text of more than 10000 words |
	| ipad_pro_safari | playground mulch | yes    | na                                             |
	| ipad_pro_chrome | swing            | no     | enter only one number, eg: '5'                 |
	| iphone_X_chrome | slide            | yes    | na                                             |
	| iphone_X_safari | chubby house     | no     | enter only one letter, eg: 'o'                 |
	| andriod_chrome  | pool             | yes    | na                                             |
	| Pixel           | play sand        | no     | enter only one special characters, eg: '&'     |


Scenario Outline:10. Search suggesstions 
	Given I navigate to bunnings homepage on <browser>
	When I enter <search_keyword> 
	Then I verify search suggesstions are displayed based on the keyword specified
	When I select one of the search suggesstions from the list
	And I verify the search results are updated based on the search <suggesstion> selected
	Examples:
	| browser         | search_keyword   | suggesstion         |
	| chrome          | chubby house     | click on any option |
	| safari          | screws           | click on any option |
	| firefox         | beach chair      | click on any option |
	| Edge            | bench            | click on any option |
	| ipad_safari     | decking oil      | click on any option |
	| ipad_chrome     | fence paint      | click on any option |
	| ipad_pro_safari | playground mulch | click on any option |
	| ipad_pro_chrome | swing            | click on any option |
	| iphone_X_chrome | slide            | click on any option |
	| iphone_X_safari | chubby house     | click on any option |
	| andriod_chrome  | pool             | click on any option |
	| Pixel           | play sand        | click on any option |


Scenario Outline:11. Verify header, footer displayed in search results page
	Given I navigate to bunnings homepage on <browser>
	When I enter <search_keyword> and click on the search button
	Then I verify I am navigated to search results page 
	And I verify the header and footers displayed and in-line with bunnings home page
	Examples:
	| browser         | search_keyword   | 
	| chrome          | chubby house     | 
	| safari          | screws           | 
	| firefox         | beach chair      | 
	| Edge            | bench            | 
	| ipad_safari     | decking oil      | 
	| ipad_chrome     | fence paint      | 
	| ipad_pro_safari | playground mulch | 
	| ipad_pro_chrome | swing            | 
	| iphone_X_chrome | slide            | 
	| iphone_X_safari | chubby house     | 
	| andriod_chrome  | pool             | 
	| Pixel           | play sand        | 
										  
