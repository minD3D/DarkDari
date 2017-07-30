class Info < ApplicationRecord
  belongs_to :user
  belongs_to :appointment

  def find_builder
    appointment.infos.find_by(builder: true)
  end
end
