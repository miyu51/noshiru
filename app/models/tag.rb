class Tag < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }
  has_many :noshi_tags
  has_many :noshis, through: :noshi_tags
  has_many :column_tags
  has_many :columns, through: :column_tags
end
