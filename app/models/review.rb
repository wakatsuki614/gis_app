class Review < ApplicationRecord
  validates :body, presence: true, length: { maximum: 255 }

  belongs_to :user
end
