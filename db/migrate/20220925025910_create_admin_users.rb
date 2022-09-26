class CreateAdminUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_users do |t|
      t.string "first_name", limit: 25
      t.string "last_name", limit: 50
      t.string "email", limit: 100, default: "", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string "username", limit: 25
      t.string "password_digest"
      t.index ["username"], name: "index_admin_users_on_username"
      t.timestamps
    end
  end
end
