RSpec.describe WeatherHandler::Weather do
  describe 'constants' do
    it 'sets CONVERTATION_VALUE constant' do
      expect(described_class::CONVERTATION_VALUE).to eq 273.15
    end
  end
end
