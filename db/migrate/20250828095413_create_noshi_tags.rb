class CreateNoshiTags < ActiveRecord::Migration[7.2]
  def change
    create_table :noshi_tags do |t|
      t.references :noshi, foreign_key: { to_table: :noshis }
      t.references :tag, foreign_key: true

      t.timestamps
    end
    add_index :noshi_tags, [:noshi_id, :tag_id], unique: true
  end
end
