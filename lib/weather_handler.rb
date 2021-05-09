# frozen_string_literal: true

require 'weather_handler/version'
require 'rest-client'
require 'dotenv/load'
require 'json'

module WeatherHandler
  class Weather
    CONVERTATION_KELVIN_VALUE = 273.15
    CONVERTATION_FAHRENHEIT_VALUE = 459.67
    FAHRENHEIT_COEFFICIENT = 1.8
    ERROR_MESSAGE = 'Please, try to type correct dimension. Correct types are: Celsium, Kelvin and Fahrenheit.'
    CELSIUM = 'celsium'
    KELVIN = 'kelvin'
    FAHRENHEIT = 'fahrenheit'

    def initialize(city)
      @city = city
    end

    def current_temperature(dimension)
      converter(dimension)
    end

    def feels_like_temperature(dimension)
      amount = (JSON.parse(weather_data.body)['main']['feels_like']).round(1)

      converter(dimension, amount)
    end

    def weather_description
      JSON.parse(weather_data.body)['weather'].first['description'].split.map(&:capitalize).join(' ')
    end

    def humidity
      "#{JSON.parse(weather_data.body)['main']['humidity']} %"
    end

    def pressure
      "#{JSON.parse(weather_data.body)['main']['pressure']} mb"
    end

    private

    attr_reader :city

    def weather_data
      @weather_data ||= RestClient.get(location_url)
    end

    def location_url
      "api.openweathermap.org/data/2.5/weather?q=#{city}&appid=#{ENV['OPEN_WEATHER_API_KEY']}"
    end

    def converter(dimension, quantity = degrees_in_k)
      case dimension.downcase
      when CELSIUM
        "#{degrees_to_c(quantity)} C"
      when KELVIN
        "#{quantity} K"
      when FAHRENHEIT
        "#{degrees_to_f(quantity)} F"
      else
        ERROR_MESSAGE
      end
    end

    def degrees_to_c(quantity)
      (quantity - CONVERTATION_KELVIN_VALUE).round(1)
    end

    def degrees_in_k
      (JSON.parse(weather_data.body)['main']['temp']).round(1)
    end

    def degrees_to_f(quantity)
      (quantity * FAHRENHEIT_COEFFICIENT - CONVERTATION_FAHRENHEIT_VALUE).round(1)
    end
  end
end
