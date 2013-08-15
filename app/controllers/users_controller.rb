class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    annotations = Annotation.where("user_id = ?", params[:id])
    all_articles = annotations.map {|annotation| annotation.sentence.article}
    @articles = all_articles.uniq{|article| article.name}
  end
end