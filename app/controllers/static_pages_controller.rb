class StaticPagesController < ApplicationController
  def index
    @current_user ||= User.find(session[:user_id]) if session[:user_id]

    if current_user.present?
      Twitter.configure do |config|
        config.consumer_key = ENV["TWITTER_KEY"]
        config.consumer_secret = ENV["TWITTER_SECRET"]
        config.oauth_token = current_user.oauth_token
        config.oauth_token_secret = current_user.oauth_secret
      end

      tweets_all = Twitter.home_timeline
      @articles = current_user.articles

      tweets_all.each do |tweet|
        unless tweet.attrs[:entities][:urls][0].nil?
          short_url = tweet.attrs[:entities][:urls][0][:expanded_url]
          if Article.where(url: short_url).exists?
            article = Article.where(url: short_url)
            current_user.articles << article
          else
            @current_user.articles << Article.create(url: short_url, name: tweet.user.screen_name, tweet: tweet.text, img: tweet.user.profile_image_url)
          end
        end
      end
    else
      @tweets = []
    end
  end
end