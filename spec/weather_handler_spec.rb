RSpec.describe WeatherHandler::Weather do
  describe 'constants' do
    let(:error_message) { 'Please, try to type correct dimension. Correct types are: Celsium, Kelvin and Fahrenheit.' }

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
      expect(described_class::CELSIUM).to eq 'celsium'
    end

    it 'sets KELVIN constant' do
      expect(described_class::KELVIN).to eq 'kelvin'
    end

    it 'sets FAHRENHEIT constant' do
      expect(described_class::FAHRENHEIT).to eq 'fahrenheit'
    end
  end

  describe '#new' do
    it 'creates new instance of WeatherHandler::Weather class' do
      expect(described_class.new('Lviv')).to be_a described_class
    end

    it 'works' do
      byebug
      expect { described_class.new }.to raise_error
    end
  end

  describe '#current_temperature' do
    
  end

  describe '#feels_like_temperature' do
    
  end

  describe '#weather_description' do
    
  end

  describe '#humidity' do
    
  end

  describe '#pressure' do
    
  end
end
