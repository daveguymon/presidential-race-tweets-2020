class TwitterApi
  def self.biden_tweets
    client.user_timeline('JoeBiden', count: 25, exclude_replies: true, include_rts: false)
  end

  def self.harris_tweets
    client.user_timeline('KamalaHarris', count: 25, exclude_replies: true, include_rts: false)
  end

  def self.pence_tweets
    client.user_timeline('Mike_Pence', count: 25, exclude_replies: true, include_rts: false)
  end

  def self.trump_tweets
    client.user_timeline('realDonaldTrump', count: 25, exclude_replies: true, include_rts: false)
  end

  def self.client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
    end
  end
end