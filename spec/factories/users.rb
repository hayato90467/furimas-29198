FactoryBot.define do
  factory :user do
    nickname { 'abe' }
    email                      { 'kkk@gmail.com' }
    password                   { 'h00000000' }
    password_confirmation      { 'h00000000' }
    date                              { '1933-01-01' }
    family_name_kana                  { 'スガヌマ' }
    first_name_kana                   { 'サトル' }
    first_name                        { '菅田' }
    family_name                       { '健二' }
  end
end
