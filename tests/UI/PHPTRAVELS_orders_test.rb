require "selenium-webdriver"
require "rspec"
require "chromedriver-helper"
require_relative "../pages/OrdersPage"

describe "Verify PHPTravels.com site" do
  
  before(:each) do
    @driver = Selenium::WebDriver.for :chrome 
  end

  after(:each) do
    @driver.quit()
  end


  it "has 4 types of offers" do
    orders = OrdersPage.new(@driver)
    
    $result = orders.getAmountOfOffers()
    puts "we have #{$result} offers"
    expect($result).to be(4)
  end

 
end
