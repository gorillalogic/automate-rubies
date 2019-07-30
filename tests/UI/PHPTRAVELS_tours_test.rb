# frozen_string_literal: true

require 'selenium-webdriver'
require 'rspec'
require 'chromedriver-helper'
require_relative '../pages/demo/HomePage'
require_relative '../pages/demo/TourDetailsPage'

describe 'PHPTravels Demo' do
  before(:each) do
    @driver = Selenium::WebDriver.for :chrome
  end

  after(:each) do
    @driver.quit
  end

  it 'has Nile tour that cost 300$ for two adults' do
    home = HomePage.new(@driver)
    home.openTourByName('Nile')

    details = TourDetailsPage.new(@driver)
    details.setTourAdults(2)

    expect(details.getTotalTourCost).to eq("USD $300")
  end
end
