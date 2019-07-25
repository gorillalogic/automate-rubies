require "selenium-webdriver"
require "rspec"
require "chromedriver-helper"


describe "Verify PHPTravels.com site" do
  it "Can find Documentation for Installations" do
      # Open Page
    driver = Selenium::WebDriver.for :chrome
    driver.manage.timeouts.implicit_wait = 10 # seconds
    
 
    # Make it to the documentation page
    driver.navigate.to "https://phptravels.com/documentation/"

    # Look for Installation
    searchField = driver.find_element(id: 'docsQuery')
    searchField.send_keys('Installation')
    sleep 5
    # Assert that from the list of elements, we have one for Installation
    
    $documents = driver.find_elements(css: '#mw-content-text > div.row > div.col-sm-4')
    $result = false
    $documents.each do |document|
      puts(document.text)
      if (document.text.include? 'Installation')
        $result = true
        break
      end
    end

    expect($result).to be(true)
    driver.quit()
  end
end
