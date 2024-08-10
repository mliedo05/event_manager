class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.integer :amount
      t.integer :status
      t.string :payment_method
      t.string :transaction_id
      t.references :reservation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
