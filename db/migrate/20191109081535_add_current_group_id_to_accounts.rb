class AddCurrentGroupIdToAccounts < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :current_group_id, :integer
    add_index :accounts, :current_group_id
  end
end
