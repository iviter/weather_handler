# frozen_string_literal: true

require 'weather_handler/version'
require 'rest-client'
require 'dotenv/load'
require 'json'
require 'retryable'
require 'open_weather_client'
require 'adapters/weather'
require 'decorators/open_weather_response'

module WeatherHandler
  class Weather
    CELSIUM = 'celsium'

    def initialize(city)
      @response = OpenWeatherClient.new(city).call
      @converter = Adapters::Weather
      @kelvin_amount = response.amount_in_kelvins
    end

    def current_temperature(dimension = CELSIUM)
      converter.new(dimension, kelvin_amount).call
    end

    def feels_like_temperature(dimension = CELSIUM)
      amount = (response.parsed_data['feels_like']).round(1)

      converter.new(dimension, amount).call
    end

    def weather_description
      response.parsed_weather_description
    end

    def humidity
      "#{response.parsed_data['humidity']} %"
    end

    def pressure
      "#{response.parsed_data['pressure']} mb"
    end

    private

    attr_reader :response, :converter, :kelvin_amount
  end
end
