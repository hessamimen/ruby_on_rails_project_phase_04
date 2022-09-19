class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :city
      t.string :state
      t.string :post_code

      t.timestamps
    end
  end
end
