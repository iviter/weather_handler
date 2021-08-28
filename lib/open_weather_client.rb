# frozen_string_literal: true

class OpenWeatherClient
  def initialize(city)
    @city = city
  end

  def call
    Decorators::OpenWeatherResponse.new(weather_data)
  end

  private

  attr_reader :city

  def weather_data
    Retryable.retryable(tries: 5) do
      @weather_data ||= RestClient.get(location_url)
    end
  end

  def location_url
    "api.openweathermap.org/data/2.5/weather?q=#{city}&appid=#{ENV['OPEN_WEATHER_API_KEY']}"
  end
end
