class StaticPagesController < ApplicationController
  def index
    @current_user ||= User.find(session[:user_id]) if session[:user_id]

    @tweets = Twitter.home_timeline
  end
end
