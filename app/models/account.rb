class Account < ActiveRecord::Base
  belongs_to :user
  belongs_to :classification
  has_many :postings
  has_many :journals, through: :postings

  validates_presence_of :name, :classification
  validates_uniqueness_of :name, scope: :user_id
end