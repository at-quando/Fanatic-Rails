class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :phone
      t.string :address
      t.integer :gender
      t.integer :role, default: 1
      t.string :avatar
      t.string :address
      # t.belongs_to :address

      t.timestamps
    end
  end
end
