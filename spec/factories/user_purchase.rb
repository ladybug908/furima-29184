FactoryBot.define do
  factory :user_purchase do
    postal_code   { '123-4567'}
    area_id       {1}
    city          {'横浜市'}
    block         {'青山1−１'}
    build         {}
    tel           {'09012345678'}

    token {'sample'}
  #  association :user
  #  association :item
  end
end
