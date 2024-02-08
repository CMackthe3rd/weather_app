require 'net/http'
require 'json'
require 'pry'

class WeatherApp
  def initialize
    @api_key = 'your_api_key_here'
  end

  def get_location(zip_code)
    uri = URI("http://api.openweathermap.org/geo/1.0/zip?zip=#{zip_code},us&appid=#{@api_key}")
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end

  def get_weather(location)
    uri = URI("https://api.openweathermap.org/data/3.0/onecall?lat=#{location['lat']}&lon=#{location['lon']}&exclude=minutely,hourly,daily,alerts&appid=#{@api_key}")
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end

  def display_weather(weather_data, location_data)
    puts "Current Weather in #{location_data['name']}, #{location_data['country']}:"
    puts "Description: #{weather_data['current']['weather'][0]['description']}"
    puts "Temperature: #{kelvin__to_fahrenheit(weather_data['current']['temp'])}°F"
    puts "Humidity: #{weather_data['current']['humidity']}%"
    puts "Wind Speed: #{weather_data['current']['wind_speed']} m/s"
  end

  private

  def kelvin__to_fahrenheit(kelvin)
    (((kelvin - 273.15) * 1.8) + 32).round(2)
  end
end

# Replace 'your_api_key_here' with your OpenWeatherMap API key
weather_app = WeatherApp.new

loop do
  puts "Enter the zip code (or type 'exit' to quit): "
  zip_code = gets.chomp.downcase

  break if zip_code == 'exit'

  location_data = weather_app.get_location(zip_code)

  weather_data = weather_app.get_weather(location_data)

  # binding.pry

  if weather_data
    weather_app.display_weather(weather_data, location_data)
  else
    puts "Error: Unable to fetch weather data for '#{zip_code}'. Please check the input and try again."
  end
end
