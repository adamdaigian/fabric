class AddArticleUsersTable < ActiveRecord::Migration
  def change
    create_table :articles_users, id: false do |t|
      t.integer :article_id
      t.integer :user_id
    end
  end
end
