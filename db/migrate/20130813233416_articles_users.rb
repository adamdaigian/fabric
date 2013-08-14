class ArticlesUsers < ActiveRecord::Migration
def self.up
  create_table 'articles_users', :id => false do |t|
    t.column :article_id, :integer
    t.column :user_id, :integer
  end
end
