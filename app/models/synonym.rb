class Synonym < ApplicationRecord
  validates :word, presence: true, length: { maximum: 255 }
  has_many :noshi_synonyms
  has_many :noshis, through: :noshi_synonyms
  has_many :column_synonyms
  has_many :columns, through: :column_synonyms

  def self.ransackable_attributes(auth_object = nil)
    %w[id word created_at updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[noshis colums noshi_synonyms column_synonyms]
  end
end
