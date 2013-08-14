class CreateSentences < ActiveRecord::Migration
  def change
    create_table :sentences do |t|
      t.text :content
      t.references :article

      t.timestamps
    end
    add_index :sentences, :article_id
  end
end
