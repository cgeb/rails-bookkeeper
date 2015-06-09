class RenameType < ActiveRecord::Migration
  def change
    rename_table :types, :account_types
  end
end
