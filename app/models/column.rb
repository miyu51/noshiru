class Column < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :text, presence: true
  has_many :noshi_columns
  has_many :column_tags, dependent: :destroy
  has_many :noshis, through: :noshi_columns
  has_many :tags, through: :column_tags
  has_one_attached :thumbnail
  has_many :column_bookmarks, dependent: :destroy
  has_many :bookmarked_by_users, through: :column_bookmarks, source: :user

  def self.ransackable_associations(auth_object = nil)
    ["tags"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["title", "text", "thumbnail"]
  end
end
