class DropNoshiCategories < ActiveRecord::Migration[7.2]
  def change
    drop_table :noshi_categories
  end
end
