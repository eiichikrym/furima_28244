FactoryBot.define do
  factory :item do
    trait :with_image do
      image { fixture_file_upload(Rails.root.join('spec/support/assets/test-image.png')) }
    end
    name { 'test' }
    description { 'testtesttest' }
    category_id { 2 }
    status_id { 2 }
    ship_charge_id { 2 }
    ship_region_id { 2 }
    ship_day_id { 2 }
    price { 1000 }
  end
end