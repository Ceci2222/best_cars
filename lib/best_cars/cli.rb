class BestCars::CLI 
  
  def start 
    puts "Here are the top 8 fuel-efficient cars of 2019."
    BestCars::Scraper.scrape_cars
    puts "Choose the number car you want more information about."
    list_cars
    
    select_car
  end
  
  def list_cars
    BestCars::Car.all.each.with_index(1) do |car, index|
      puts "#{index}. #{car.model}"
    end
  end
  
  def select_car
    input = gets.strip
    index = input.to_i - 1
    if index.between?(0, 9)
      selected_car =  BestCars::Car.all[index]
      puts "The model is #{selected_car.model}."
      puts "The mpg is #{selected_car.mpg}."
      puts "The epa class is: #{selected_car.epa_class}."
      puts "The fuel type is: #{selected_car.fuel_type}."
      
      
      # call another input method in the cli that either calls the second scraper method with the selected car url or asks if they would like to select another car or exit.
    else
      puts "Invalid choice. Choose a number between 1 and 10."
      get_input
    end
  end
  
  def get_more_info(selected_car.url)
    puts "Would you like to know about the range and annual fuel cost of this car?"
    input = gets.strip.upcase
    until input == "Y" || input == "YES" || input == "N" || input == "NO"
      puts "Please enter Y or N."
      get_more_info
    end
    if input == "N" || input == "NO"
      #call exit or next car method
end  