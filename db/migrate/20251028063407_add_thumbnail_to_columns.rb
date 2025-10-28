class AddThumbnailToColumns < ActiveRecord::Migration[7.2]
  def change
    add_column :columns, :thumbnail, :string
  end
end
