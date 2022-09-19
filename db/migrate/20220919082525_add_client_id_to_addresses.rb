class AddClientIdToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :client_id, :integer
  end
end
