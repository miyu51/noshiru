class CreateNoshis < ActiveRecord::Migration[7.2]
  def change
    create_table :noshis do |t|
      t.string :label, null: false
      t.string :knot, null: false
      t.string :color, null: false
      t.string :description, null: false
      t.string :image, null: false      

      t.timestamps
    end
  end
end
