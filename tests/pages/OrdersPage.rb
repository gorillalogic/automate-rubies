# frozen_string_literal: true

require 'selenium-webdriver'
require_relative 'TravelsBasePage'

class OrdersPage < TravelsBasePage
  def initialize(driver)
    @url = 'https://phptravels.com/order/'
    @offersSelector = '.tab-content .col-md-3'
    super(driver)
    @driver.navigate.to @url
    @logger.info("Created #{self.class.name}")
  end

  def listOfOffers
    offers = @driver.find_elements(css: @offersSelector)
    @logger.warn("There are #{offers.count} offers" )
    offers
  end

  def offersPackage(packageName)
    $itOffers = false
    offers = listOfOffers()
    offers.each do |offer|
      $offerText = offer.find_element(css: '.panel-heading')
      if $offerText.text.include? packageName
        $itOffers = true
        break
      end
    end

    $itOffers
  end

  def getAmountOfOffers
    $offers = listOfOffers()
    $offers.count()
  end
end
