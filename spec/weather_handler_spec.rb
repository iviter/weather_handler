RSpec.describe WeatherHandler do
  describe 'constants' do
    it 'sets CONVERTATION_VALUE constant' do
      expect(described_class::Weather::CONVERTATION_VALUE).to eq 273.15
    end
  end
end
