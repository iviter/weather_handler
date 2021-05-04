require 'weather_handler/version'
require 'rest-client'

module WeatherHandler
  class Error < StandardError; end

  class Weather

    def find_weather(city)

    end

    private
    
    attr_reader :city

  end
end
