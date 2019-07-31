# frozen_string_literal: true

require 'selenium-webdriver'
require 'rspec'
require 'chromedriver-helper'
require_relative '../../pages/demo/HomePage'
require_relative '../../pages/demo/TourDetailsPage'

describe 'PHPTravels Demo' do
  before(:each) do
    @driver = Selenium::WebDriver.for :chrome
  end

  after(:each) do
    @driver.quit
  end

  it 'has Nile tour that cost 300$ for two adults' do
    home = HomePage.new(@driver)
    # Set the currency to USD, default is unclear
    home.setSiteCurrency('EUR')
    home.setSiteCurrency('USD')
    # open the Nile Tour
    home.openTourByName('Nile')
    # Set the details
    details = TourDetailsPage.new(@driver)
    details.setTourAdults(2)
    # Verify
    expect(details.getTotalTourCost).to eq('USD $300')
  end
end
