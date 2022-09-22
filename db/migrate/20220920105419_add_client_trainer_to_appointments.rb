class AddClientTrainerToAppointments < ActiveRecord::Migration[5.2]
  def change
    add_column :appointments, :trainer_id, :integer, null: false
    add_column :appointments, :client_id, :intege, null: false
  end
end
