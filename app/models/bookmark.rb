class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :noshi
  belongs_to :column

  validates :user_id, uniqueness: [ scope: :noshi_id ]
  validates :user_id, uniqueness: [ scope: :column_id ]
end
