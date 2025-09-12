class CreateNoshiSynonyms < ActiveRecord::Migration[7.2]
  def change
    create_table :noshi_synonyms do |t|
      t.references :noshi, foreign_key: { to_table: :noshis }
      t.references :synonym, foreign_key: true

      t.timestamps
    end
    add_index :noshi_synonyms, [:noshi_id, :synonym_id], unique: true
  end
end
