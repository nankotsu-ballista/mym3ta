class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }, allow_nil: true
  has_many :metamons,dependent: :destroy
  has_many :temps
  has_one_attached :image
  def self.ransackable_attributes(auth_object = nil)
    %w(created_at doingtempid doingtempuserid editingmetaid editingtempid editting email id ifnewmeta ifnewtemp metating name tempting updated_at)
  end
end
