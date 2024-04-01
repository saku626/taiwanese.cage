class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, uniqueness: true

  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_requests, through: :bookmarks, source: :request
  has_many :categories, dependent: :destroy

  def bookmark(request)
    bookmark_requests << request
  end

  def unbookmark(request)
    bookmark_requests.destroy(request)
  end

  def bookmark?(request)
    bookmark_requests.include?(request)
  end
end
