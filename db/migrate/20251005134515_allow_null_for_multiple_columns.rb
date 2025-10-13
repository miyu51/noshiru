class AllowNullForMultipleColumns < ActiveRecord::Migration[7.2]
  def change
    change_column_null :categories, :use_case, true
    change_column_null :categories, :religion, true
  end
end
