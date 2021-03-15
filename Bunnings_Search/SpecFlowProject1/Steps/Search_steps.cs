using System;
using System.Text;
using System.Collections.Generic;
using TechTalk.SpecFlow;
using Bunnings_Search.PageObjects;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;

namespace Bunnings_Search.Steps
{
    [Binding]
    public class Search_steps
    {
        private HomePage HomePage;
        private readonly ScenarioContext _scenarioContext;

        public Search_steps(ScenarioContext scenarioContext)
        {
            HomePage = new HomePage();
            _scenarioContext = scenarioContext;
        }

        [Given(@"I navigate to bunnings homepage on (.*)")]
        public void GivenINavigateToBunningsHomepageOnChrome(string browser)
        {
            HomePage.Navigate_to_Bunnings();
            Console.WriteLine($"Navigated to Bunnings.com.au");
        }

        [When(@"I enter (.*) and click on the search button")]
        public void WhenIEnterRatshakAndClickOnTheSearchButton(string search_keyword)
        {
            HomePage.EnterSearchKeyword(search_keyword);
            _scenarioContext.Set<string>(search_keyword, "search_keyword");
            Console.WriteLine($"Successfully submitted search for Keyword - {search_keyword}");
        }

        [Then(@"I verify I am navigated to search results page and verify title")]
        public void ThenIVerifyIAmNavigattedToSearchResultsPage()
        {
            var search_keyword = _scenarioContext.Get<string>("search_keyword");
            HomePage.Verify_search_page_title(search_keyword);
            Console.WriteLine($"Successfully navigated to search page");
        }


        [Then(@"I verify zero resuts and help text is displayed")]
        public void ThenIVerifyZeroResutsAndHelpTextIsDisplayed()
        {
            HomePage.Verify_zero_results();
            Console.WriteLine($"Verified zero resuts and help text displayed");
        }

        [When(@"I click on the search box again")]
        public void WhenIClickOnTheSearchBoxAgain()
        {
            HomePage.Click_search_box();
            Console.WriteLine($"Clicked on search box");
        }
        
        [Then(@"I verify the (.*) is displayed in recent searches")]
        public void ThenIVerifyTheSandIsDisplayedInSand(string search_keyword)
        {
            HomePage.Verify_keyword_in_recent_search(search_keyword);
            Console.WriteLine($"Verified recent search keywords");
        }



        [AfterScenario]
        public void cleanup()
        {
            HomePage.Cleanup();
        }
    }
}

