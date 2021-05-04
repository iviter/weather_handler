#require 'weather_handler/version'
require 'rest-client'
require 'dotenv/load'
require 'json'

module WeatherHandler
  class Error < StandardError; end

  class Weather
    def initialize(city)
      @city = city
    end

    CONVERTATION_VALUE = 273.15.freeze

    def find_weather
      degrees
    end

    private
    
    attr_reader :city, :weather_data

    def weather_data
      @weather_data ||= RestClient.get(location_url)
    end

    def location_url
      "api.openweathermap.org/data/2.5/weather?q=#{city}&appid=#{ENV['OPEN_WEATHER_API_KEY']}"
    end

    def weather_description
      JSON.parse(weather_data.body).dig('weather').first['description'].split.map(&:capitalize).join(' ')
    end

    def degrees
      (JSON.parse(weather_data.body).dig('main')['temp'] - CONVERTATION_VALUE).round(1)
    end
  end
end
