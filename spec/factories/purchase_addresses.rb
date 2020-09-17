FactoryBot.define do
  factory :purchase_address do
    mobile                  { '070-3177-0486' }
    address                  { '緑区' }
    post                    { '123-4567' }
    refectures_id                { '1' }
    city                     { '京都' }
    house_number                { '1-1' }
    building                 { '東京ハイツ' }
    price                     { '2000' }
  end
end
