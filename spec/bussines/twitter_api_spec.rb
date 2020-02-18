require 'rails_helper'

RSpec.describe TwitterApi do
  describe '.search' do
    it 'return correct object', vcr: { cassette_name: 'twitter_api_ruby' } do
      tweets = described_class.search('ruby')
      expect(tweets).to be_an_instance_of(Array)

      tweet = tweets[0]
      expect(tweet).to be_an_instance_of(Twitter::Tweet)
      expect(tweet).to respond_to(:user)
      expect(tweet.user).to respond_to(:name)
      expect(tweet.user).to respond_to(:screen_name)
      expect(tweet.attrs.key?(:created_at)).to be_truthy
      expect(tweet.attrs.key?(:full_text)).to be_truthy
    end

    it 'return empty object', vcr: { cassette_name: 'twitter_api_ruby_wrong' } do
      tweets = described_class.search('ruby')
      expect(tweets).to_not be_present
    end
  end
end
