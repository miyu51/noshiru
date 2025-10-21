class RemoveForeignKeyFromNoshisCategory < ActiveRecord::Migration[7.2]
  def change
    remove_foreign_key :noshis, :categories
  end
end
