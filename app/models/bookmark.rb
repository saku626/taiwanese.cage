class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :default_vocabulary

  validates :user_id, uniqueness: { scope: :default_vocabulary_id }
end
