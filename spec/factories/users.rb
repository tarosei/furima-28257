FactoryBot.define do
  factory :user do
    nick_name {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password {"1234abcd"}
    password_confirmation {"1234abcd"}
    first_name{"田中"}
    last_name{"太郎"}
    first_name_kana{"タナカ"}
    last_name_kana{"タロウ"}
    birthday{Faker::Date.birthday}
  end
end