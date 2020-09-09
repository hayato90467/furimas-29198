FactoryBot.define do
  factory :item do
    factory :user do
      user_id                          { 'abe' }
      image                            { 'kkkis@mail.com' }
      name                              { ' 写真です' }
      name_description                  { 'よろしく' }
      new_category_id                  { '4' }
      name_condition_id                { '4' }
      send_burden_id                   { '4' }
      send_day_id                       { '4' }
      send_area_id                     { '4' }
      price                            { '4' }
   end
 end
end