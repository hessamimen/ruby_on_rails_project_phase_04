class AddClientIdToFeedbacks < ActiveRecord::Migration[5.2]
  def change
    add_column :feedbacks, :client_id, :integer
  end
end
