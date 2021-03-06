class Review < ApplicationRecord
  validates :body, presence: true, length: { maximum: 255 }

  belongs_to :user
  belongs_to :school

  has_many :likes, :dependent => :destroy
end
