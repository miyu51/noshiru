class Category < ApplicationRecord
  validates :use_case, length: { maximum: 100 }
  validates :religion, length: { maximum: 100 }
  validates :type, length: { maximum: 100 }
  has_many :noshis, through: :noshi_categories
  has_many :noshi_categories, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    %w[id use_case religion type created_at updated_at]
  end
  self.inheritance_column = :_type_disabled
end
