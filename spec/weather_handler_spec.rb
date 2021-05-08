# frozen_string_literal: true

RSpec.describe WeatherHandler::Weather do
  let(:lviv_city) { 'Lviv' }
  let(:celsium) { 'celsium' }
  let(:kelvin) { 'kelvin' }
  let(:fahrenheit) { 'fahrenheit' }
  let(:inch) { 'inch' }
  let(:error_message) { 'Please, try to type correct dimension. Correct types are: Celsium, Kelvin and Fahrenheit.' }

  subject { described_class.new(lviv_city) }

  describe 'constants' do
    it 'sets CONVERTATION_KELVIN_VALUE constant' do
      expect(described_class::CONVERTATION_KELVIN_VALUE).to eq 273.15
    end

    it 'sets CONVERTATION_FAHRENHEIT_VALUE constant' do
      expect(described_class::CONVERTATION_FAHRENHEIT_VALUE).to eq 459.67
    end

    it 'sets FAHRENHEIT_COEFFICIENT constant' do
      expect(described_class::FAHRENHEIT_COEFFICIENT).to eq 1.8
    end

    it 'sets ERROR_MESSAGE constant' do
      expect(described_class::ERROR_MESSAGE).to eq error_message
    end

    it 'sets CELSIUM constant' do
      expect(described_class::CELSIUM).to eq celsium
    end

    it 'sets KELVIN constant' do
      expect(described_class::KELVIN).to eq kelvin
    end

    it 'sets FAHRENHEIT constant' do
      expect(described_class::FAHRENHEIT).to eq fahrenheit
    end
  end

  describe '#new' do
    context 'with correct amount of arguments' do
      it 'creates new instance of WeatherHandler::Weather class' do
        expect(subject).to be_a described_class
      end
    end

    context 'with wrong amount of arguments' do
      it 'raises ArgumentError' do
        expect { described_class.new }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#current_temperature' do
    context 'with celsium dimension' do
      it 'returns result with a string type' do
        expect(subject.current_temperature(celsium)).to be_a String
      end

      it 'returns truthy result' do
        expect(subject.current_temperature(celsium)).not_to be_nil
      end
    end

    context 'with kelvin dimension' do
      it 'returns result with a string type' do
        expect(subject.current_temperature(kelvin)).to be_a String
      end

      it 'returns truthy result' do
        expect(subject.current_temperature(kelvin)).not_to be_nil
      end
    end

    context 'with fahrenheit dimension' do
      it 'returns result with a string type' do
        expect(subject.current_temperature(fahrenheit)).to be_a String
      end

      it 'returns truthy result' do
        expect(subject.current_temperature(fahrenheit)).not_to be_nil
      end
    end

    context 'with wrong dimension' do
      it 'returns correct error message' do
        expect(subject.current_temperature(inch)).to eq error_message
      end
    end
  end

  describe '#feels_like_temperature' do
    context 'with celsium dimension' do
      it 'returns result with a string type' do
        expect(subject.feels_like_temperature(celsium)).to be_a String
      end

      it 'returns truthy result' do
        expect(subject.feels_like_temperature(celsium)).not_to be_nil
      end
    end

    context 'with kelvin dimension' do
      it 'returns result with a string type' do
        expect(subject.feels_like_temperature(kelvin)).to be_a String
      end

      it 'returns truthy result' do
        expect(subject.feels_like_temperature(kelvin)).not_to be_nil
      end
    end

    context 'with fahrenheit dimension' do
      it 'returns result with a string type' do
        expect(subject.feels_like_temperature(fahrenheit)).to be_a String
      end

      it 'returns truthy result' do
        expect(subject.feels_like_temperature(fahrenheit)).not_to be_nil
      end
    end

    context 'with wrong dimension' do
      it 'returns correct error message' do
        expect(subject.feels_like_temperature(inch)).to eq error_message
      end
    end
  end

  describe '#weather_description' do
    it 'returns result with a string type' do
      expect(subject.weather_description).to be_a String
    end

    it 'returns truthy result' do
      expect(subject.weather_description).not_to be_nil
    end
  end

  describe '#humidity' do
    it 'returns result with a string type' do
      expect(subject.humidity).to be_a String
    end

    it 'returns truthy result' do
      expect(subject.humidity).not_to be_nil
    end
  end

  describe '#pressure' do
    it 'returns result with a string type' do
      expect(subject.pressure).to be_a String
    end

    it 'returns truthy result' do
      expect(subject.pressure).not_to be_nil
    end
  end
end
