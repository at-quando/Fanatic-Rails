class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.belongs_to :shop
      t.datetime :start_day
      t.datetime :end_day
      t.text :description
      
      t.timestamps
    end
  end
end
