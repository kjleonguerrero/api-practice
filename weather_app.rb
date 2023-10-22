require "HTTP"

puts "Welcome to Kyle's Weather App!!"

response = HTTP.get("https://api.openweathermap.org/data/2.5/weather?q=guam&units=imperial&appid=#{ENV["OPENN_WEATHER_API_KEY"]}")

weatherdata = response.parse

temp = weatherdata["main"]["temp"]
desc = weatherdata["weather"][0]["description"]

puts "Guam is #{temp} degrees outside with #{desc}"
