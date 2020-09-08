FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    frist_name            {"a"}
    family_name           {"a"}
    frist_name_kana       {"a"}
    family_name_kana      {"a"}
    birth                 {"1"}
  end
end