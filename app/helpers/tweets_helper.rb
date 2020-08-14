module TweetsHelper
  def text_to_true_link(tweet_text)
    URI.extract(tweet_text, ['http', 'https']).each do |uri|
        tweet_text = tweet_text.gsub( uri, link_to(uri, uri, target: "_blank"))
    end

    simple_format(tweet_text, {}, class: "comment-body", sanitize: false)
  end
end
