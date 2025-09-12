class CreateSynonyms < ActiveRecord::Migration[7.2]
  def change
    create_table :synonyms do |t|
      t.string :word, null:false

      t.timestamps
    end
    add_index :synonyms, :word, unique: true
  end
end
