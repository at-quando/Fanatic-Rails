class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.float :rating
      t.integer :number_review

      t.belongs_to :category
      t.belongs_to :brand
      t.belongs_to :shop

      t.timestamps
    end
  end
end
