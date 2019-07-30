# frozen_string_literal: true

require 'selenium-webdriver'
require_relative '../TravelsBasePage'

class HomePage < TravelsBasePage
  def initialize(driver)
    # Vars
    @url = 'https://phptravels.net'
    @toursListSelector = '.hotel-list .col-md-3'

    # Initializers
    super(driver)
    @logger.info("Created: #{self.class.name}")
    @driver.navigate.to @url
  end

  def toursList
    @driver.action.move_to(@driver.find_element(css: '.more')).perform
   
    $tours = @driver.find_elements(css: @toursListSelector)
    $tours
  end

  def getTourByName(tourName)
    $tour = nil
    $tours = toursList
    $tours.each do |tourElement|
      if tourElement.find_element(css: '.go-text-right').text.include? tourName
        $tour = tourElement
        break
      end
    end
    $tour
  end

  ##
  # Opens a Tour Details Page.
  # It receives the element returned by getTourByName and clicks the button.
  # After this method completes, is required to create a new ToursDetailPage to handle the interactions after that point.
  def openTour(tourElement)
    $openTourButton = tourElement.find_element(css: '.btn-small')
    $openTourButton.click
  end

  ##
  # Utility method to get the tour details by name.
  # If there is no tour with the required name, this method throws an error.
  def openTourByName(tourName)
    openTour(getTourByName(tourName))
  end

  def getAmountOfOffers
    $offers = listOfOffers
    $offers.count
  end
end
