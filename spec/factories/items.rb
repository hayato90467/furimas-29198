FactoryBot.define do
  factory :item do
    # user_id                          { 1 }
    #  image                            { '5A242348-6E2A-4E38-937A-348076553ADF_3.mov'}
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
