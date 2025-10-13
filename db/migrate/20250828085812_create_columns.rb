class CreateColumns < ActiveRecord::Migration[7.2]
  def change
    create_table :columns do |t|
      t.string :title, null:false
      t.text :text, null:false
      t.string :image, null:false

      t.timestamps
    end
  end
end
