class AddDebitAndCreditAmounts < ActiveRecord::Migration
  def change
    add_column :journals, :debit_amounts, :string, :default => []
    add_column :journals, :credit_amounts, :string, :default => []
  end
end
