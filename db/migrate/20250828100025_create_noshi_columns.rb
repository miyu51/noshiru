class CreateNoshiColumns < ActiveRecord::Migration[7.2]
  def change
    create_table :noshi_columns do |t|
      t.references :noshi, foreign_key: { to_table: :noshis }
      t.references :column, foreign_key: true

      t.timestamps
    end
    add_index :noshi_columns, [:noshi_id, :column_id], unique: true
  end
end
