class RenameAccountType < ActiveRecord::Migration
  def change
    rename_table :account_types, :classifications
  end
end
