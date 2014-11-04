FactoryGirl.define do
  factory :order do
    association :user
  end

  factory :order_item do
    association :order
    association :product
    price 10
    quantity 1
  end

  factory :product do
    sequence(:name) { |n| "Product #{n}" }
    price 10
    description 'Product Description'
  end

  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password 'password'
  end
end
