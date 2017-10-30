class CreateCardPayments < ActiveRecord::Migration[5.1]
  def change
    create_table :card_payments do |t|
      t.string :ip_address
      t.string :first_name
      t.string :last_name
      t.string :card_type
      t.date :card_expires_on

      t.belongs_to :order
      t.timestamps
    end
  end
end
