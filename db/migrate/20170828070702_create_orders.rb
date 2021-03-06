class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :status, default: 0
      t.string :receiver
      t.string :address
      t.string :phone
      t.float :total
      t.integer :status
      t.datetime :purchased_at

      t.belongs_to :user
      t.timestamps
    end
  end
end
