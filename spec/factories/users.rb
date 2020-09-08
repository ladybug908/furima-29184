FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email()}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    frist_name            {"漢字"}
    family_name           {"ひらがな"}
    frist_name_kana       {"カタカナ"}
    family_name_kana      {"カタカナ"}
    birth                 {"2000/01/01"}
  end
end