class StaticPagesController < ApplicationController
  def index
    # @user = current_user

    @tweets = Twitter.home_timeline
  end
end
