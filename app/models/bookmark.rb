class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :request

  validates :user_id, uniqueness: { scope: :request_id }
end
