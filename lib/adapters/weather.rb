# frozen_string_literal: true

module Adapters
  class Weather
    CONVERTATION_KELVIN_VALUE = 273.15
    CONVERTATION_FAHRENHEIT_VALUE = 459.67
    FAHRENHEIT_COEFFICIENT = 1.8
    CELSIUM = 'celsium'
    KELVIN = 'kelvin'
    FAHRENHEIT = 'fahrenheit'
    ERROR_MESSAGE = 'Please, try to type correct dimension. Correct types are: Celsium, Kelvin and Fahrenheit.'

    def initialize(dimension, standard_amount)
      @dimension = dimension
      @standard_amount = standard_amount
    end

    def call
      converter(dimension, standard_amount)
    end

    private

    attr_reader :standard_amount, :dimension, :amount

    def converter(dimension, quantity)
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

    def degrees_to_f(quantity)
      (quantity * FAHRENHEIT_COEFFICIENT - CONVERTATION_FAHRENHEIT_VALUE).round(1)
    end
  end
end
