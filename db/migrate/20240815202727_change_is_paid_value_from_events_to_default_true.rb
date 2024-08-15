class ChangeIsPaidValueFromEventsToDefaultTrue < ActiveRecord::Migration[7.0]
  def change
    change_column :events, :is_paid, :boolean, default: true
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
