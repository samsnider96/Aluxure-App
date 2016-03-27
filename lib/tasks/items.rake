namespace :items do
  desc "TODO"
  task add_empty_fields: :environment do
    Item.update_all(gender: "Mens", alterations: "", sub_category: "", sleeve_length: "", inseam_length: "", suit_length: "", shoe_width: "")
  end
end
