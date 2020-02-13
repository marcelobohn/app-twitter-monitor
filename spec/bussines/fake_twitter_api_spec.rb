require 'rails_helper'

RSpec.describe FakeTwitterApi do
  describe '.search' do
    it 'runs search with Facebook return 1', vcr: { cassette_name: 'fake_twitter_api_facebook' } do
      # puts VCR.current_cassette.file
      response = described_class.search('Facebook')
      expect(response[:body].count).to eq 1
    end

    it 'runs search with lololo return 0', vcr: { cassette_name: 'fake_twitter_api_lololo' } do
      response = described_class.search('lololo')
      expect(response[:body].count).to eq 0
    end
  end
end
