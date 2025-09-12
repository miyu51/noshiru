class Category < ApplicationRecord
  validates :use_case, presence: true, length: { maximum: 100 }
  validates :religion, presence: true, length: { maximum: 10 }
  has_many :noshis, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    %w[id use_case religion created_at updated_at]
  end
end
