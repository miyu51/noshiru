class CreateColumnBookmark < ActiveRecord::Migration[7.2]
  def change
    create_table :column_bookmarks do |t|
      t.references :user, foreign_key: true
      t.references :column, foreign_key: { to_table: :columns }

      t.timestamps
    end
    add_index :column_bookmarks, [:user_id, :column_id], unique: true
  end
end
