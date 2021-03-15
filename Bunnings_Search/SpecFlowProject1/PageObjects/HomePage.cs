using System;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium.Support.UI;
using SeleniumExtras.PageObjects;
using System.Collections.Generic;
using Xunit;

namespace Bunnings_Search.PageObjects
{
    
    public class HomePage
    {
        public IWebDriver driver = new ChromeDriver();
        public string search_title_text;

        public HomePage()
        {
            PageFactory.InitElements(driver, this);

        }
        [FindsBy(How = How.CssSelector, Using = "input[type='text'][class^='search']")]
        private IWebElement _search_box = null;

        [FindsBy(How = How.ClassName, Using = "search-container_icon-search")]
        private IWebElement _search_button = null;

        [FindsBy(How = How.CssSelector, Using = "span[class*='search-term']")]
        private IWebElement _search_title = null;

        [FindsBy(How = How.CssSelector, Using = "span[class*='search-title__count']")]
        private IWebElement _search_count = null;

        [FindsBy(How = How.CssSelector, Using = "p[class$='help-text']")]
        private IList<IWebElement> _help_text = null;

        [FindsBy(How = How.XPath, Using = "//a[@class='search-container_history_link']/strong")]
        private IWebElement _search_history = null;




        public void Navigate_to_Bunnings()
        {
            driver.Navigate().GoToUrl("http://www.bunnings.com.au");
        }

        public void EnterSearchKeyword(string search_keyword)
        {
            _search_box.Clear();
            _search_box.SendKeys(search_keyword);
            Console.WriteLine($"Entered search keyword -{search_keyword}");
            _search_button.Click();
            //IJavaScriptExecutor executor = (IJavaScriptExecutor)driver;
            //executor.ExecuteScript("arguments[0].click();", _search_button);
            Console.WriteLine($"Clicked on search button -{search_keyword}");
            WebDriverWait wait = new WebDriverWait(driver, TimeSpan.FromSeconds(20));
            IWebElement SearchResult = wait.Until(SeleniumExtras.WaitHelpers.ExpectedConditions.ElementExists(By.CssSelector("span[class*='search-term']")));
        }

        public void Verify_search_page_title(string search_keyword)
        {
            search_title_text = _search_title.Text;
            Assert.Contains(search_title_text.Trim(), search_keyword.Trim().Replace("\\r\\n", ""));
        }

        public void Verify_zero_results()
        {
            Assert.Contains("0", _search_count.Text);
            Console.WriteLine($"Verified zero resuts displayed");
            Assert.Equal(2, _help_text.Count);
        }

        public void Click_search_box()
        {
            _search_box.Click();
        }

        public void Verify_keyword_in_recent_search(string search_keyword)
        {
            Assert.Contains(_search_history.Text, search_keyword);
        }

        public void Cleanup()
        {
            driver.Quit();
        }
    }
}

