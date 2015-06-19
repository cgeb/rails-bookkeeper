class Journal < ActiveRecord::Base
  belongs_to :user
  has_many :postings
  has_many :accounts, through: :postings

  serialize :debit_accounts
  serialize :debit_amounts
  serialize :credit_accounts
  serialize :credit_amounts
  validates_presence_of :description
  validate :valid_integers, :all_fields_entered, :total_debits_equal_total_credits
  
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

  def reload_fields
    self.debit_accounts = nil
    self.credit_accounts = nil
    self.debit_amounts = nil
    self.credit_amounts = nil
  end

  def valid_integers
    self.debit_amounts.each do |debit_amount|
      if debit_amount.to_i.to_s != debit_amount && debit_amount != ""
        return errors.add(:journals, "must input valid numbers.")
      end
    end

    self.credit_amounts.each do |credit_amount|
      if credit_amount.to_i.to_s != credit_amount && credit_amount != ""
        return errors.add(:journals, "must input valid numbers.")
      end
    end
  end

  def all_fields_entered
    return errors.add(:journals, "must have all fields entered.") if self.debit_accounts.first == "" || self.debit_amounts.first == "" || self.credit_accounts.first == "" || self.credit_amounts.first == ""
  end

  def total_debits_equal_total_credits
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
      errors.add(:journals, "total debits must equal total credits")
    end
  end
end