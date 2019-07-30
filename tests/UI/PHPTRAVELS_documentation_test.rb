require "selenium-webdriver"
require "rspec"
require "chromedriver-helper"
require_relative "../../pages/DocumentationPage"

describe "Verify PHPTravels.com site" do
  
  before(:each) do
    @driver = Selenium::WebDriver.for :chrome 
  end

  after(:each) do
    @driver.quit()
  end


  it "has Documentation for Installations" do
    docsPage = DocumentationPage.new(@driver)
    # Look for Installation
    
    $install = "Installation"
    docsPage.searchFor($install)
    $result = docsPage.containsDoc($install)

    # Assert that from the list of elements, we have one for Installation
    expect($result).to be(true)
  end

  it "has Documentation for Backup" do
    docsPage = DocumentationPage.new(@driver)
    # Look for backup
    
    $backup = "Backup"
    docsPage.searchFor($backup)
    $result = docsPage.containsDoc($backup)

    expect($result).to be(true)
  end
end
