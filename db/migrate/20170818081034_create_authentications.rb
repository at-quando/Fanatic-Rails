class CreateAuthentications < ActiveRecord::Migration[5.1]
  def change
    create_table :authentications do |t|
      # t.string :email
      t.string :uid, null: false, default: ''
      t.string :provider, null: false, default: 'email'
      t.string :password_digest
      t.text :access_token
      t.datetime :confirm_send_at
      t.string :confirm_token
      t.datetime :confirm_at
      t.string :remember_digest

      t.belongs_to :user

      t.timestamps
    end

    # add_index :authentications, :email, unique: true
    add_index :authentications, :uid, unique: true
    add_index :authentications, %i[uid provider], unique: true
  end
end
