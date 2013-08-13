class StaticPagesController < ApplicationController
  def index
    @current_user ||= User.find(session[:user_id]) if session[:user_id]

    @tweet_urls = []
    Twitter.configure do |config|
      config.consumer_key = ENV["TWITTER_KEY"]
      config.consumer_secret = ENV["TWITTER_SECRET"]
      config.oauth_token = current_user.oauth_token
      config.oauth_token_secret = current_user.oauth_secret
    end
    @tweets = Twitter.home_timeline

    @tweets.each do |tweet|
      unless tweet.attrs[:entities][:urls][0].nil?
        short_url = tweet.attrs[:entities][:urls][0][:expanded_url]
        begin
          long_url = LongURL.expand(short_url)
          @tweet_urls << long_url
        rescue
        end
      end
    end

  end
end

#     @tweets.each do |tweet|
#       unless tweet.attrs[:entities][:urls][0].nil?
#         short_url = tweet.attrs[:entities][:urls][0][:expanded_url]
#         begin
#           long_url = LongURL.expand(short_url)
#           @tweet_urls << long_url
#           if Article.where(url:long_url).exists?
#             article = Article.where(url:long_url).first
#             current_user.articles << article
#             return article
#           else
#           source = open(long_url).read
#           content = Readability::Document.new(source, :tags => %w[div p img a strong em], :attributes => %w[src href], :remove_empty_nodes => true).content
#           current_user.articles << Article.create(url:long_url, content:content)
#           end
#         rescue
#         end
#       end
#     end
    # source = open(@tweet_urls.first).read
    # @first_article = Readability::Document.new(source, :tags => %w[div p img a strong em], :attributes => %w[src href], :remove_empty_nodes => true).content
  end
end
