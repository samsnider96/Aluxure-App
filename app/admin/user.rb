ActiveAdmin.register User do

permit_params :email, :password, :password_confirmation, :first_name, :last_name, :phone, :company_id, :photo, :paid

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    column :phone
    column :company_id
    column :paid
    column :photo
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :first_name
  filter :last_name
  filter :email
  filter :phone
  filter :company_id
  filter :paid
  filter :photo
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :first_name
      f.input :last_name
      f.input :paid
      f.input :company_id
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end