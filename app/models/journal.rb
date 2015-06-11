class Journal < ActiveRecord::Base
  belongs_to :user
  has_many :postings
  has_many :accounts, through: :postings

  serialize :debit_accounts
  serialize :debit_amounts
  serialize :credit_accounts
  serialize :credit_amounts
  validates :description, presence: true
  validate :total_debits_must_equal_total_credits
  
  def get_debits
    if self.valid?
      self.debit_accounts.each_with_index do |debit_account, index|
        if debit_account != ""
          @account = Account.find_by(id: debit_account) 
          @account.update_attributes(:amount => @account.amount + self.debit_amounts[index].to_i)
          self.accounts << @account
        end
      end
    end
  end

  def get_credits
    if self.valid?
      self.credit_accounts.each_with_index do |credit_account, index|
        if credit_account != ""
          @account = Account.find_by(id: credit_account) 
          @account.update_attributes(:amount => @account.amount - self.credit_amounts[index].to_i)
          self.accounts << @account
        end
      end
    end
  end

  def total_debits_must_equal_total_credits
    total_debits, total_credits = 0, 0
    self.debit_amounts.each do |debit_amount|
      if debit_amount != ""
        total_debits += debit_amount.to_i
      end
    end
    self.credit_amounts.each do |credit_amount|
      if credit_amount != ""
        total_credits += credit_amount.to_i
      end
    end
    if total_debits != total_credits
      errors.add(:journals, "total debits must equal total credits.")
      self.debit_accounts = nil
      self.credit_accounts = nil
      self.debit_amounts = nil
      self.credit_amounts = nil
    end
  end
end