class RemoveImageFromColumns < ActiveRecord::Migration[7.2]
  def change
    remove_column :columns, :image, :string
  end
end
