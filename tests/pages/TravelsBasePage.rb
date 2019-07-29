require "selenium-webdriver"

class TravelsBasePage
  def initialize (driver)
    @driver = driver

    #Set configurations for driver, global for all objects that use this element
    @driver.manage.timeouts.implicit_wait = 10 # seconds
    @driver.manage.window.maximize
   
  end

  def getDriver
    @driver
  end

  def finalizeDriver ()
    @driver.quit()
  end
end