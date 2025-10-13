class MakeCategoryIdNullableInNoshis < ActiveRecord::Migration[7.2]
  def change
    change_column_null :noshis, :category_id, true
  end
end
