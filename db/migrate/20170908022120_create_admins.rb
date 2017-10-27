class CreateAdmins < ActiveRecord::Migration[5.1]
  def change
    create_table :admins do |t|
    	t.string :name
    	t.string :user_name
    	t.string :email
      t.integer :gender
    	t.integer :role
      t.string :phone
    	t.string :password_digest
    	t.string :confirm_token
    	t.datetime :confirm_at
    	t.string :avatar
    	t.belongs_to :shop

      t.timestamps
    end
  end
end