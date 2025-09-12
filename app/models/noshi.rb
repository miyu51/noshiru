class Noshi < ApplicationRecord
  validates :label, presence: true, length: { maximum: 50 }
  validates :knot, presence: true, length: { maximum: 20 }
  validates :color, presence: true, length: { maximum: 20 }
  validates :description, presence: true, length: { maximum: 255 }
  validates :image, presence: true, length: { maximum: 255 }
  belongs_to :category
  has_many :noshi_tags, dependent: :destroy
  has_many :noshi_columns
  has_many :noshi_synonyms, dependent: :destroy
  has_many :tags, through: :noshi_tags
  has_many :columns, through: :noshi_columns
  has_many :synonyms, through: :noshi_synonyms
  has_many :bookmarks, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    %w[id label color knot image description created_at updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[category synonyms bookmarks noshi_columns noshi_synonyms noshi_tags]
  end
end
