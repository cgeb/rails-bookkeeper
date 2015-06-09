class ChangeColumnDefault < ActiveRecord::Migration
  def change
    change_column_default(:journals, :debit_accounts, nil)
    change_column_default(:journals, :debit_amounts, nil)
    change_column_default(:journals, :credit_accounts, nil)
    change_column_default(:journals, :credit_amounts, nil)
  end
end
