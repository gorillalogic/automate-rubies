# frozen_string_literal: true

require 'selenium-webdriver'
require 'rspec'
require 'chromedriver-helper'
require_relative '../../pages/OrdersPage'

describe 'Verify PHPTravels.com site' do
  before(:each) do
    @driver = Selenium::WebDriver.for :chrome
  end

  after(:each) do
    @driver.quit
  end

  it 'has 4 types of offers' do
    orders = OrdersPage.new(@driver)
    $result = orders.getAmountOfOffers
    expect($result).to be(4)
  end

  it 'offers Standalone Web Apps' do
    orders = OrdersPage.new(@driver)
    $result = orders.offersPackage('Standalone Web')
    expect($result).to be(true)
  end

  it 'offers Windows Desktop App' do
    orders = OrdersPage.new(@driver)
    $result = orders.offersPackage('Windows Desktop')
    expect($result).to be(true)
  end

  it 'offers Complete Bundle' do
    orders = OrdersPage.new(@driver)
    $result = orders.offersPackage('Complete Bundle')
    expect($result).to be(true)
  end
end
