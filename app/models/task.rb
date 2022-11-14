class Task < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: {minimum: 4}
  validates :category, presence: true, length: {minimum: 5}
end
