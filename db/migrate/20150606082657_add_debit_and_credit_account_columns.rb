class AddDebitAndCreditAccountColumns < ActiveRecord::Migration
  def change
    add_column :journals, :debit_accounts, :string, :default => []
    add_column :journals, :credit_accounts, :string, :default => []
  end
end
