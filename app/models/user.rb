class User < ApplicationRecord
  has_secure_password
  has_many :jobs
  has_many :contacts
  validates :email, presence: true, uniqueness: true
end
