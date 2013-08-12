class StaticPagesController < ApplicationController
  def index
    @current_user ||= User.find(session[:user_id]) if session[:user_id]

    @tweet_urls = []
    @tweets = Twitter.home_timeline

    @tweets.each do |tweet|
      unless tweet.attrs[:entities][:urls][0].nil?
        short_url = tweet.attrs[:entities][:urls][0][:expanded_url]
        long_url = LongURL.expand(short_url)
        @tweet_urls << long_url
      end
    end

  end
end
