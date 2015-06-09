class CreateDatabaseTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.timestamps
    end
    create_table :accounts do |t|
      t.integer :user_id
      t.string :name
      t.integer :amount
      t.string :type
      t.timestamps
    end
    create_table :journals do |t|
      t.integer :user_id
      t.string :description
      t.timestamps
    end
    create_table :postings do |t|
      t.integer :journal_id
      t.integer :account_id
      t.timestamps
    end
  end
end
