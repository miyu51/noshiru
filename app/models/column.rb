class Column < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :text, presence: true, length: { maximum: 65_535 }
  has_many :noshi_columns
  has_many :column_synonyms
  has_many :noshis, through: :noshi_columns
  has_many :synonyms, through: :column_synonyms
end
