class CreateRolesUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :role_users do |t|
      t.integer :user_id, null: false
      t.integer :role_id, null: false
      t.string :status, default: 'active'

	    t.index ["role_id", "user_id"], name: "index_roles_users_on_role_id", unique: true
	    t.index ["user_id"], name: "index_roles_users_on_user_id"
	    t.index ["status"], name: "index_roles_users_on_status"
      t.timestamps
    end

  end
end
