class CreateNoshiCategories < ActiveRecord::Migration[7.2]
  def change
    create_table :noshi_categories do |t|
      t.references :noshi, foreign_key: { to_table: :noshis }
      t.references :category, foreign_key: true

      t.timestamps
    end
    add_index :noshi_categories, [:noshi_id, :category_id], unique: true
  end
end
