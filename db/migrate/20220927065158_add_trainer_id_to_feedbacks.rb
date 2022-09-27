class AddTrainerIdToFeedbacks < ActiveRecord::Migration[5.2]
  def change
    add_column :feedbacks, :trainer_id, :integer
  end
end
