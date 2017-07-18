class MoneyApp < ApplicationRecord
  has_many :money_infos, dependent: :destroy
  has_many :users, through: :money_infos


end
