require 'rails_helper'

RSpec.describe FakeTwitterApi do
  describe '.search' do
    it 'runs search with Facebook return 1', vcr: { cassette_name: 'fake_twitter_api_facebook' } do
      response = described_class.search('Facebook')
      tweet = response[:body][0]

      expect(response[:body].count).to eq 1
      expect(tweet).to have_key('author')
      expect(tweet).to have_key('message')
      expect(tweet).to include('author' => 'TechCrunch')
      expect(tweet).to include('message' => 'Facebook now lets everyone unsend messages for up to 10 minutes https://techcrunch.com/2019/02/05/facebook-messenger-remove/ … by @JoshConstine')
    end

    it 'runs search with lololo return 0', vcr: { cassette_name: 'fake_twitter_api_lololo' } do
      response = described_class.search('lololo')
      expect(response[:body].count).to eq 0
    end
  end
end
