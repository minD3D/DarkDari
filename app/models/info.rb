class Info < ApplicationRecord
  belongs_to :user
  belongs_to :appointment

  def find_builder
    money_app.money_infos.find_by(builder: true)
  end
end
