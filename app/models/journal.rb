class Journal < ActiveRecord::Base
  belongs_to :user
  has_many :postings
  has_many :accounts, through: :postings

  serialize :debit_accounts
  serialize :debit_amounts
  serialize :credit_accounts
  serialize :credit_amounts
  validates :description, presence: true
end