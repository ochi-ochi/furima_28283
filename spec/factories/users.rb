FactoryBot.define do
  factory :user do
    name                          { Gimei.first.hiragana }
    email                         { Faker::Internet.free_email }
    password                      { Faker::Internet.password(min_length: 6) }
    password_confirmation         { password }
    family_name                   { Gimei.last.kanji }
    first_name                    { Gimei.first.kanji }
    family_name_kana              { Gimei.last.katakana }
    first_name_kana               { Gimei.first.katakana }
    birth_date                    { Faker::Date.in_date_period }
  end
end
