namespace :items do
  desc "TODO"
  task add_empty_fields: :environment do
    Item.update_all(gender: "Mens", alterations: "", sub_category: "", sleeve_length: "", inseam_length: "", suit_length: "", shoe_width: "")
  end

  task apostrophe: :environment do
    Item.where(gender: "Mens").update_all(gender: "Men's")
    Item.where(gender: "Womens").update_all(gender: "Women's")
  end
end
