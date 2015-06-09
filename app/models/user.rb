class User < ActiveRecord::Base
  has_many :accounts
  has_many :journals

  has_secure_password validations: false
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum: 5}, on: :create
end