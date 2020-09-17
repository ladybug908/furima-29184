FactoryBot.define do
  factory :item do
    item_name        { 'サンプル' }
    introduction     { 'サンプル' }
    category_id      { 1 }
    status_id        { 1 }
    postage_id       { 1 }
    area_id          { 1 }
    day_id           { 1 }
    price            { 10_000 }
    association :user
  end
end
