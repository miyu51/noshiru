class CreateColumnTags < ActiveRecord::Migration[7.2]
  def change
    create_table :column_tags do |t|
      t.references :column, foreign_key:true
      t.references :tag, foreign_key:true

      t.timestamps
    end
    add_index :column_tags, [:column_id, :tag_id], unique: true
  end
end
