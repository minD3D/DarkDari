class MoneyInfo < ApplicationRecord
  belongs_to :user
  belongs_to :money_app

  def find_builder
    money_app.money_infos.find_by(builder: true)
  end
end
