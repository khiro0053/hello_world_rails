FactoryBot.define do
  factory :user_detail do
    postal_code {Faker::Address.postcode}
    address {Faker::Address.city }
    birthday { 30.years.ago }
    #association :user, factory: :userの省略形
    user
  end
end
