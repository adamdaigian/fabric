class CreateAnnotations < ActiveRecord::Migration
  def change
    create_table :annotations do |t|
      t.text :content
      t.references :sentence

      t.timestamps
    end
    add_index :annotations, :sentence_id
  end
end
