# frozen_string_literal: true

# require 'weather_handler/version'
require 'rest-client'
require 'dotenv/load'
require 'json'

module WeatherHandler
  class Error < StandardError; end

  class Weather
    CONVERTATION_KELVIN_VALUE = 273.15
    CONVERTATION_FAHRENHEIT_VALUE = 459.67
    FAHRENHEIT_COEFFICIENT = 1.8
    ERROR_MESSAGE = 'Please, try to type correct dimension'

    def initialize(city)
      @city = city
    end

    def current_temperature(dimension)
      case dimension.downcase
      when 'celsium'
        "#{degrees_c} C"
      when 'kelvin'
        "#{degrees_k} K"
      when 'fahrenheit'
        "#{degrees_f} F"
      else
        ERROR_MESSAGE
      end
    end

    def humidity
      "#{JSON.parse(weather_data.body)['main']['humidity']} %"
    end

    def pressure
      "#{JSON.parse(weather_data.body)['main']['pressure']} mb"
    end

    def weather_description
      JSON.parse(weather_data.body)['weather'].first['description'].split.map(&:capitalize).join(' ')
    end

    def approximate_weather
      (JSON.parse(weather_data.body)['main']['feels_like']).round(1)
    end

    private

    attr_reader :city

    def weather_data
      @weather_data ||= RestClient.get(location_url)
    end

    def location_url
      "api.openweathermap.org/data/2.5/weather?q=#{city}&appid=#{ENV['OPEN_WEATHER_API_KEY']}"
    end

    def degrees_k
      (JSON.parse(weather_data.body)['main']['temp']).round(1)
    end

    def degrees_c
      (degrees_k - CONVERTATION_VALUE).round(1)
    end

    def degrees_f
      (degrees_k * FAHRENHEIT_COEFFICIENT - CONVERTATION_FAHRENHEIT_VALUE).round(1)
    end
  end
end
