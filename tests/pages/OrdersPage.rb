require "selenium-webdriver"
require_relative "TravelsBasePage"

class OrdersPage < TravelsBasePage
  
  def initialize (driver)
    @url = "https://phptravels.com/order/"
    @offersSelector = 'body > div:nth-child(9) > div.tab-content > div'
    super(driver)
    @driver.navigate.to @url
  end

  def listOfOffers ()
    offers = @driver.find_elements(css: @offersSelector)
    offers
  end

  def getAmountOfOffers ()
    $offers = listOfOffers()
    $offers.count()
  end
end