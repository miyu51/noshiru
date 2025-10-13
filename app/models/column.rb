class Column < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :text, presence: true, length: { maximum: 65_535 }
  has_many :noshi_columns
  has_many :column_tags
  has_many :noshis, through: :noshi_columns
  has_many :tags, through: :column_tags
  has_one_attached :thumbnail
  has_many :bookmarks, dependent: :destroy

  def self.ransackable_associations(auth_object = nil)
    ["tags"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["title", "text", "thumbnail"]
  end
end
