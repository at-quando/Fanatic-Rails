class CreateCardTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :card_transactions do |t|

      t.string :action
      t.float :amount
      t.boolean :success
      t.string :authorization
      t.string :message
      t.text :params

      t.belongs_to :card_payment
      t.timestamps
    end
  end
end
