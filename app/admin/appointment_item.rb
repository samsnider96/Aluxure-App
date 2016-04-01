ActiveAdmin.register AppointmentItem do
permit_params :item_id, :appointment_item_id, :status

  index do
    selectable_column
    id_column
    column :item_id
    column :appointment_item_id
    column :status
    actions
  end

  filter :item_id
  filter :appointment_item_id
  filter :status


end
