class CreateAccountsUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts_users do |t|
      t.integer :account_id
      t.integer :user_id

      t.timestamps
    end

    add_index :accounts_users, [:account_id, :user_id], :unique => true
    add_index :accounts_users, :user_id
  end
end
