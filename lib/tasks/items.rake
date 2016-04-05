namespace :items do
  desc "TODO"

  task add_empty_fields: :environment do
    Item.all.each do |item|
      item.update(jacket_size: "") unless item.jacket_size
      item.update(pants_size: "") unless item.pants_size
    end
  end

  task apostrophe: :environment do
    Item.where(gender: "Mens").update_all(gender: "Men's")
    Item.where(gender: "Womens").update_all(gender: "Women's")
  end
end
