namespace :items do
  desc "TODO"

  task add_empty_fields: :environment do
#     Item.all.each do |item|
#       item.update(jacket_size: "") if item.jacket_size.nil?
# <<<<<<< HEAD
#       item.update(pants_size: "") if item.pants_size.nil?
# =======
#     end
#     Item.all.each do |item|
#       item.update(pants_size: "") if item.pants_size.nil?
#     end
#     Item.all.each do |item|
# >>>>>>> b1594db6bab3bf0c808bfc595c808ee805beb364
#       item.update(sub_category: "") if item.sub_category.nil?
#     end
  end

  task apostrophe: :environment do
    Item.where(gender: "Mens").update_all(gender: "Men's")
    Item.where(gender: "Womens").update_all(gender: "Women's")
  end
end
