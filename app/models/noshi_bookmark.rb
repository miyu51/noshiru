class NoshiBookmark < ApplicationRecord
  belongs_to :user
  belongs_to :noshi

  validates :user_id, uniqueness: { scope: :noshi_id }
end
