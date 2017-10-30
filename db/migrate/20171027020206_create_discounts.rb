class CreateDiscounts < ActiveRecord::Migration[5.1]
  def change
    create_table :discounts do |t|
      t.belongs_to :property
      t.belongs_to :event
      t.float :sale
      t.float :quantity
      
      t.timestamps
    end
  end
end
