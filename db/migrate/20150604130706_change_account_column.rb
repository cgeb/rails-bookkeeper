class ChangeAccountColumn < ActiveRecord::Migration
  def change
    remove_column :users, :type_id
    remove_column :accounts, :account_type
    add_column :accounts, :type_id, :integer
  end
end
