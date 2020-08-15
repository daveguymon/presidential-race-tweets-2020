module TweetsHelper
  def text_to_true_link(tweet_text)
    URI.extract(tweet_text, ['http', 'https']).each do |uri|
        tweet_text = tweet_text.gsub(uri, link_to(uri, uri, target: "_blank"))
    end

    mention_regex = /(|[@\w])@(\w{1,15})\b/
    mention_handle = tweet_text.match(mention_regex)


    unless mention_handle.nil?
      twitter_domain = 'https://www.twitter.com/' + mention_handle[0].gsub("@", "")
      tweet_text = tweet_text.gsub(mention_regex, link_to(mention_handle, twitter_domain, target: "_blank"))
    end

    simple_format(tweet_text, {}, class: "comment-body", sanitize: false)
  end
end
