class Vocabulary < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :bopomofo, presence: true, length: { maximum: 255 }
  validates :mean, presence: true, length: { maximum: 255 }

  has_many :bookmarks, dependent: :destroy
end
