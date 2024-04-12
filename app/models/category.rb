class Category < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }

  belongs_to :user
end