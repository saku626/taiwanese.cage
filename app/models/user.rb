class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, uniqueness: true
  validates :reset_password_token, presence: true, uniqueness: true, allow_nil: true

  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_requests, through: :bookmarks, source: :request
  has_many :categories, dependent: :destroy
  has_many :vocabularies, dependent: :destroy
  has_many :task_completions, dependent: :destroy

  def own?(object)
    self.id == object.user_id #selfは省略できる
  end

  def bookmark(request)
    bookmark_requests << request
  end

  def unbookmark(request)
    bookmark_requests.destroy(request)
  end

  def bookmark?(request)
    bookmark_requests.include?(request)
  end

  def bookmark(request, category_id)
    bookmarks.create(request: request, category_id: category_id)
  end
end
