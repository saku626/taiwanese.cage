class TaskCompletion < ApplicationRecord
  belongs_to :user

  validates :date, presence: true
  validates :user_id, uniqueness: { scope: :date }
end
