class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, format: {
  with: /\A(?=.*[a-z])(?=.*[A-Z])|(?=.*[a-z])(?=.*\d)|(?=.*[a-z])(?=.*[@$!%*?&])|(?=.*[A-Z])(?=.*\d)|(?=.*[A-Z])(?=.*[@$!%*?&])|(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,32}\z/,
  message: "は8文字から32文字で、英小文字、英大文字、数字、およびスペース以外の記号から2種以上を含む必要があります。",
  if: -> { new_record? || changes[:crypted_password] }
  }

  validates :password, exclusion: { in: ->(user) { [user.email, user.email.split('@').first, user.email.split('@').last] }, message: "にはメールアドレスを含めることはできません。" }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, uniqueness: true
  validates :reset_password_token, presence: true, uniqueness: true, allow_nil: true

  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_defaults, through: :bookmarks, source: :default_vocabulary
  has_many :categories, dependent: :destroy
  has_many :vocabularies, dependent: :destroy
  has_many :task_completions, dependent: :destroy

  def own?(object)
    self.id == object.user_id #selfは省略できる
  end

  def bookmark(default_vocabulary)
    bookmarked_defaults << default_vocabulary
  end

  def unbookmark(default_vocabulary)
    bookmarked_defaults.destroy(default_vocabulary)
  end

  def bookmark?(default_vocabulary)
    bookmarked_defaults.include?(default_vocabulary)
  end

  def bookmark(default_vocabulary, category_id)
    bookmarks.create(default_vocabulary: default_vocabulary, category_id: category_id)
  end
end
