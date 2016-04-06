namespace :items do
  desc "TODO"

  task add_empty_fields: :environment do
    Item.all.each do |item|
      item.update(jacket_size: "") if item.jacket_size.nil?
      item.update(pants_size: "") if item.pants_size.nil?
      item.update(sub_category: "") if item.sub_category.nil?
    end
  end

  task apostrophe: :environment do
    Item.where(gender: "Mens").update_all(gender: "Men's")
    Item.where(gender: "Womens").update_all(gender: "Women's")
  end
end
