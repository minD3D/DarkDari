class Appointment < ApplicationRecord
  has_many :infos, dependent: :destroy
  has_many :users, through: :infos

  # TODO: 유효성 검사
end
