class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :noshi_bookmarks, dependent: :destroy
  has_many :bookmark_noshis, through: :noshi_bookmarks, source: :noshi
  has_many :column_bookmarks, dependent: :destroy
  has_many :bookmark_columns, through: :column_bookmarks, source: :column
  validates :email, presence: true, uniqueness: true
  enum role: { general: 0, admin: 1 }

  def noshi_bookmark(noshi)
    bookmark_noshis << noshi
  end

  def noshi_unbookmark(noshi)
    bookmark_noshis.destroy(noshi)
  end

  def noshi_bookmark?(noshi)
    bookmark_noshis.include?(noshi)
  end

  def column_bookmark(column)
    bookmark_columns << column
  end

  def column_unbookmark(column)
    bookmark_columns.destroy(column)
  end

  def column_bookmark?(column)
    bookmark_columns.include?(column)
  end

  def admin?
    self.role == "admin"
  end

  def general?
    self.role == "general"
  end
end
