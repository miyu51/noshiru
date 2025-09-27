class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_noshis, through: :bookmarks, source: :noshi
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :omniauthable, omniauth_providers: %i[google_oauth2]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.skip_confirmation!
    end
  end

  def bookmark(noshi)
    bookmark_noshis << noshi
  end

  def unbookmark(noshi)
    bookmark_noshis.destroy(noshi)
  end

  def bookmark?(noshi)
    bookmark_noshis.include?(noshi)
  end
end
