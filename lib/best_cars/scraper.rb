require 'open-uri'
require 'nokogiri'
require 'pry'

class BestCars::Scraper
  
  def self.scrape_cars
    cars = []
    doc = Nokogiri::HTML(open("https://www.fueleconomy.gov/feg/best-worst.shtml"))
    
    car_array = doc.css('table#bestcars').css('tbody')
    
    car_array.each do |car_row|
      car_attributes = {
        model: car_row.css('div.desc a').text,
        epa_class: car_row.css('th.vclass').text,
        mpg: car_row.css('td.auto-mpg').text,
        fuel_type: car_row.css('button').children.text,
        url: car_row.css('div.desc a')[0].attributes['href'].value
      }
    
      car = BestCars::Car.new(car_attributes)
      end
  end
  
  def scrape_car_info(car_URL)
  # 1 second level to get range and emissions and other data
  # called based on user input. takes an argument of the car URL.
  end
  
end