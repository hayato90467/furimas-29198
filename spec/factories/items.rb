FactoryBot.define do
  factory :item do
    name { ' 写真です' }
    name_description { 'よろしく' }
    name_category_id { 4 }
    name_condition_id                { 4 }
    send_burden_id                   { 4 }
    send_day_id                      { 4 }
    send_area_id                     { 4 }
    price { 500 }
    association :user
  end
end
