class Noshi < ApplicationRecord
  validates :label, presence: true, length: { maximum: 50 }
  validates :knot, presence: true, length: { maximum: 20 }
  validates :color, presence: true, length: { maximum: 20 }
  validates :description, presence: true, length: { maximum: 255 }
  validates :image, presence: true, length: { maximum: 255 }
  has_many :noshi_tags, dependent: :destroy
  has_many :noshi_columns
  has_many :noshi_synonyms, dependent: :destroy
  has_many :noshi_categories, dependent: :destroy
  has_many :categories, through: :noshi_categories
  has_many :tags, through: :noshi_tags
  has_many :columns, through: :noshi_columns
  has_many :synonyms, through: :noshi_synonyms
  has_many :noshi_bookmarks, dependent: :destroy
  has_many :bookmarked_by_users, through: :noshi_bookmarks, source: :user

ransacker :categories_use_case do
  Arel.sql("(SELECT string_agg(categories.use_case, ' ') FROM categories INNER JOIN noshi_categories ON categories.id = noshi_categories.category_id WHERE noshi_categories.noshi_id = noshis.id)")
end

ransacker :categories_religion do
  Arel.sql("(SELECT string_agg(categories.religion, ' ') FROM categories INNER JOIN noshi_categories ON categories.id = noshi_categories.category_id WHERE noshi_categories.noshi_id = noshis.id)")
end

  def self.ransackable_attributes(auth_object = nil)
    %w[id label color knot image description created_at updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[categories synonyms bookmarks noshi_columns noshi_synonyms noshi_tags columns tags]
  end
end
