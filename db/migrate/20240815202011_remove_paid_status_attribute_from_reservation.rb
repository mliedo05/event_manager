class RemovePaidStatusAttributeFromReservation < ActiveRecord::Migration[7.0]
  def change
    remove_column :reservations, :paid_status
  end
end
