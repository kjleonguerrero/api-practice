require "http"

puts "Welcome to Kyle's Weather App!!"

loop do
  puts "Enter a city name (or 'quit' to exit):"
  city = gets.chomp

  break if city.downcase == "quit"

  puts "Enter preferred temperature units (C for Celsius or F for Fahrenheit):"
  units = gets.chomp.downcase
  units = "imperial" if units == "F"
  units = "metric" if units == "C"

  response = HTTP.get("https://api.openweathermap.org/data/2.5/weather?q=#{city}&units=#{units}&appid=#{ENV["OPEN_WEATHER_API_KEY"]}")

  weatherdata = response.parse

  temp = weatherdata["main"]["temp"]
  desc = weatherdata["weather"][0]["description"]

  puts "#{city} is #{temp} degrees outside with #{desc}"
end
