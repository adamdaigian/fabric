class ArticlesController < ApplicationController
  def show
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    @article = Article.find(params[:id])
    begin
      long_url = LongURL.expand(@article.url)
      source = open(long_url).read
      readable_content = Readability::Document.new(source, :tags => %w[div p img a strong em], :attributes => %w[src href], :remove_empty_nodes => true).content
      @article.update_attributes(content: readable_content )
    rescue
    end
  end
end
