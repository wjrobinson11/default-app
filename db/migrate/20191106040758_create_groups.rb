class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.integer :account_id
      t.string :name

      t.timestamps
    end

    add_index :groups, :account_id
  end
end
