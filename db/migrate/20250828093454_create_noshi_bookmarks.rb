class CreateNoshiBookmarks < ActiveRecord::Migration[7.2]
  def change
    create_table :noshi_bookmarks do |t|
      t.references :user, foreign_key: true
      t.references :noshi, foreign_key: { to_table: :noshis }

      t.timestamps
    end
    add_index :noshi_bookmarks, [:user_id, :noshi_id], unique: true
  end
end
