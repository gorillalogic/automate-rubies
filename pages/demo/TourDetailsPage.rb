# frozen_string_literal: true

require 'selenium-webdriver'
require_relative '../TravelsBasePage'

class TourDetailsPage < TravelsBasePage
  def initialize(driver)
    # Vars
    @toursListSelector = '.hotel-list -col-md-3'
    @tourTitleSelector = '.ttu'
    @tourLocationSelector = 'span.RTL'
    @tourDetailsSelector = '#OVERVIEW .go-left div.desc-scrol > div'
    @totalCostSelector = '#body-section span.totalCost' 
    # Initializers
    super(driver)
    @logger.info("Created: #{self.class.name}")
  end

  def getTourTitle
    @driver.find_element(css: @tourTitleSelector).text
  end

  def getTourLocation
    @driver.find_element(css: @tourLocationSelector).text
  end

  def getTourDetails
    @driver.find_element(css: @tourDetailsSelector).text
  end

  def setTourAdults(amountOfAdults)
    # identify amount of adults
    adultsSelect = Selenium::WebDriver::Support::Select.new(@driver.find_element(:css, '#selectedAdults'))
    @driver.action.move_to(@driver.find_element(css: '#body-section > div:nth-child(7) > div:nth-child(3)')).perform
   
    adultsSelect.select_by(:text, amountOfAdults.to_s)
    sleep 2 # allow price to update
    # set amount of adults
  end

  def getTotalTourCost
    @driver.find_element(css: @totalCostSelector).text
  end
end
