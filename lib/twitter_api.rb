class TwitterApi
  def self.trump_tweets
    client.user_timeline('realDonaldTrump', count: 25, include_rts: false)
  end

  def self.biden_tweets
    client.user_timeline('JoeBiden', count: 25, include_rts: false)
  end

  def self.client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
    end
  end
end