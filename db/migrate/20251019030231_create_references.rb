class CreateReferences < ActiveRecord::Migration[7.2]
  def change
    create_table :references do |t|
      t.string :title, null: false
      t.string :site_name
      t.string :author
      t.string :author_furigana
      t.string :publisher
      t.date :published_on
      t.date :accessed_on
      t.string :url

      t.timestamps
    end
  end
end
