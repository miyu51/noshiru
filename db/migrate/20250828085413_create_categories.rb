class CreateCategories < ActiveRecord::Migration[7.2]
  def change
    create_table :categories do |t|
      t.string :use_case, null: false
      t.string :religion, null: false

      t.timestamps
    end
    add_index :categories, [:use_case, :religion], unique: true
  end
end
