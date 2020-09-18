FactoryBot.define do
  factory :purchase_address do
    mobile                  { '07031770486'}
    address                 { '旭区' }
    post                    { '123-4567'}
    prefectures_id           { 1 }
    city                    { '京都' }
    building                { '東京ハイツ' }
    token                    {'aaaa'}
  end
end
