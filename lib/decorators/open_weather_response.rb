module Decorators
  class OpenWeatherResponse
    def initialize(data)
      @data = data
    end

    def amount_in_kelvins
      parsed_data['temp'].round(1)
    end

    def parsed_data
      JSON.parse(data.body)['main']
    end

    def parsed_weather_description
      JSON.parse(data.body)['weather'].first['description'].split.map(&:capitalize).join(' ')
    end

    private

    attr_reader :data
  end
end
