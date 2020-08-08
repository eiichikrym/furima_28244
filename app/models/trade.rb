class Trade < ApplicationRecord
  belongs_to :user
  belongs_to :item
  # app/forms/trading_information.rbを確認する事
end
