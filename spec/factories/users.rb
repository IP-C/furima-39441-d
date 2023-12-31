# spec/factories/users.rb

FactoryBot.define do
  factory :user do
    nickname { "ExampleUser" }
    email { Faker::Internet.email }
    password { "password123" }
    password_confirmation { "password123" } # password_confirmation カラムを追加
    last_name_kana { "ヤマダ" }
    first_name_kana { "タロウ" }
    last_name_kanji { "山田" }
    first_name_kanji { "太郎" }
    birth_date { "1990-01-01" }
  end
end


