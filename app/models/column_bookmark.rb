class ColumnBookmark < ApplicationRecord
  belongs_to :user
  belongs_to :column

  validates :user_id, uniqueness: { scope: :column_id }
end
