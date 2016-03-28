ActiveAdmin.register Item do

permit_params :user_id, :brand, :type, :color, :size, :material, :condition, :description, :category, :image_upload_id, :alterations, :gender, :sleeve_length, :inseam_length, :suit_length, :shoe_width, :sub_category

  index do
    selectable_column
    id_column
    column :user_id
    column :gender
    column :category
    column :sub_category
    column :brand
    column :color
    column :size
    column :sleeve_length
    column :inseam_length
    column :suit_length
    column :shoe_width
    column :material
    column :condition
    column :alterations
    column :description
    column :image_upload_id
    actions
  end

  filter :user_id
  filter :gender
  filter :category
  filter :sub_category
  filter :brand
  filter :color
  filter :size
  filter :sleeve_length
  filter :inseam_length
  filter :suit_length
  filter :shoe_width
  filter :material
  filter :condition
  filter :alterations
  filter :description
  filter :image_upload_id


  # form do |f|
  #   f.inputs "Item Details" do
  #      f.input :gender, collection: Item::GENDERS 
  #      f.input :category, collection: Item::MENS_CATEGORIES 
  #      f.input :sub_category, collection: ["N/A"] 
  #      f.input :brand, collection: Item::MENS_APPAREL_BRANDS 
  #      f.input :size, collection: Item::MENS_SHIRT_SIZES 
  #      f.input :sleeve_length, collection: Item::MENS_SLEEVE_LENGTH 
  #      f.input :inseam_length, collection: Item::MENS_INSEAM_LENGTH 
  #      f.input :suit_length, collection: Item::MENS_SUIT_LENGTH 
  #      f.input :shoe_width, collection: Item::MENS_SHOE_WIDTH 
  #      f.input :color, collection: Item::COLORS 
  #      f.input :material, collection: Item::MENS_APPAREL_MATERIALS 
  #      f.input :condition, collection: Item::CONDITION 
  #      f.input :alterations 
  #      f.input :description 
  #   end
  #   f.actions
  # end

end
