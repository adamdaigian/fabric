class AddTweetToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :tweet, :string
  end
end
