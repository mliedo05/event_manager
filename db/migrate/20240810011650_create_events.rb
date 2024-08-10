class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.timestamp :start_time
      t.timestamp :end_time
      t.boolean :is_paid, default: false
      t.boolean :is_remote, default: false
      t.integer :status, default: 0
      t.string :address
      t.integer :capacity
      t.float :price, default: 0
      t.text :internal_note
      t.string :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
