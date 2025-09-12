class CreateColumnSynonyms < ActiveRecord::Migration[7.2]
  def change
    create_table :column_synonyms do |t|
      t.references :column, foreign_key:true
      t.references :synonym, foreign_key:true

      t.timestamps
    end
    add_index :column_synonyms, [:column_id, :synonym_id], unique: true
  end
end
