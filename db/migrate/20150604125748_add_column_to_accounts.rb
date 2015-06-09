class AddColumnToAccounts < ActiveRecord::Migration
  def change
    add_column :users, :type_id, :integer
  end
end
