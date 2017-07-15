class MoneyInfo < ApplicationRecord
  belongs_to :user
  belongs_to :money_app
end
