# bunnings_Search

**How to run the tests: **    
1.The tests are automated using Chromedriver on windows. (please ensure you have chrome v89 installed on the windows machine)     
2. Download/clone the branch -  feature/search_feature       
3. Open the project in Visual Studio     
4. Build the project.      
5. In the Test Explorer locate the tests => Bunnings_Search > Bunnings_Search.feature > SearchFeature.feature       
6. Run the Tests.         

**Please Note: **Only the below listed 3 tests are automated    
a. _VerifySearchTitle   
b._ItemNotStocked  
c. _VerifyRecentSearchHistory    

**Packages installed (if needed)**
1. Selenium WebDriver (3.141.0)
2. Selenium support (3.141.0)
3. Selenium Webdriver ChromeDriver (89.0)
4. SpecFlow (3.7.13)
5. SpecFlow.Nunit.Runners(3.17.13)
6. xunit (2.4.1)
7. DoNotSeleniumExtras PageObjects Core (3.12.0)8 . DoNotSeleniumExtras  WaitHelpers (3.11.0)


**Assumptions: **

I have not added timeouts for the pages when loading and there is an explicit wait in the tests which waits for the search results to be returned. 
