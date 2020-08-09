FactoryBot.define do
  factory :trading_information do
    postcode { '123-4567' }
    state_id { 2 }
    city { '渋谷区' }
    block { '渋谷' }
    building { '渋谷ビル' }
    phone_number { '09012345678' }
  end
end
