class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.integer :status, default: 0
      t.integer :quantity
      t.integer :total

      t.belongs_to :property
      t.belongs_to :order
      t.timestamps
    end
  end
end
