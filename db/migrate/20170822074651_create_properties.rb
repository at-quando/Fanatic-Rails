class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.string :color
      t.string :size
      t.integer :storage
      t.integer :price

      t.belongs_to :product
      t.timestamps
    end
  end
end
