class CreateReadStatuses < ActiveRecord::Migration
  def change
    create_table :read_statuses do |t|
      t.integer :user_id
      t.integer :appointment_request_id
      t.datetime :read_on
      t.timestamps null: false
    end
    add_index :read_statuses, :user_id
    add_index :read_statuses, :appointment_request_id
  end
end
