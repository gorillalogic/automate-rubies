require "selenium-webdriver"
require_relative "TravelsBasePage"

class DocumentationPage < TravelsBasePage
  
  def initialize (driver)
    @url = "https://phptravels.com/documentation/"
    super(driver)
    @driver.navigate.to @url
  end

  def searchFor (field)
    searchField = @driver.find_element(id: 'docsQuery')
    searchField.send_keys(field)
    sleep 2
  end

  def containsDoc (element)
    $documents = @driver.find_elements(css: '#mw-content-text > div.row > div.col-sm-4')
    $result = false
    $documents.each do |document|
      puts(document.text)
      if (document.text.include? element)
        $result = true
        break
      end
    end

    $result
  end
end