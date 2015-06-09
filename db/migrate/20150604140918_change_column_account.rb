class ChangeColumnAccount < ActiveRecord::Migration
  def change
    remove_column :accounts, :type_id
    add_column :accounts, :classification_id, :integer
  end
end
