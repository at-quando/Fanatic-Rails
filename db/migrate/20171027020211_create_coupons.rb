class CreateCoupons < ActiveRecord::Migration[5.1]
  def change
    create_table :coupons do |t|
      t.string :code, :unique => true
      t.float :sale
      
      t.timestamps
    end
  end
end
