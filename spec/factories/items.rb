FactoryBot.define do
  factory :item do
    item_name                   {"pencil"}
    description                 {"とても書きやすい"}
    category_id                 {"5"}
    status_id                   {"2"}
    fee_id                      {"2"}
    area_id                     {"8"}
    days_id                     {"2"}
    price                       {"5000"}
    association :user
  end
end