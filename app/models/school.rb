class School < ApplicationRecord
  before_save { school_email.downcase! }

  validates :school_name,  presence: true, length: { maximum: 50 }
  validates :school_email, presence: true, length: { maximum: 255 },
                           format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                           uniqueness: { case_sensitive: false }
  validates :phone,        presence: true,
                           format: { with: /\A\d{1,4}-{0,1}\d{1,4}-{0,1}\d{4}\z/ }
  validates :address,      presence: true, length: { maximum: 50 }
  validates :introduce,    length: { maximum: 255 }

  belongs_to :user

  mount_uploader :image, ImageUploader

  def self.search(keyword)
    where("school_name like? OR address like?", "%#{keyword}%", "%#{keyword}%").order(updated_at: :desc)
  end

  geocoded_by :address

  after_validation :geocode, if: :address_changed?
end
