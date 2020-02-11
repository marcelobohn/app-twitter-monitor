class TwitterApi
  def self.search(term)
    new.search(term)
  end

  def search(term)
    search_tweet(term)
  end

  private

  def client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CUNSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
    end
  end

  def search_tweet(term)
    client.search("#{term} -rt", count: 10, tweet_mode: 'extended', result_type: "recent").take(10)
  end
end
