class AddItemsCount < ActiveRecord::Migration
  def change
    add_column :users, :items_count, :integer, default: 0
    add_column :users, :appointment_requests_count, :integer, default: 0

    User.reset_column_information
    User.all.each do |user|
      User.update_counters user.id, items_count: user.items.length
      User.update_counters user.id, appointment_requests_count: user.appointment_requests.length
    end
  end
end
