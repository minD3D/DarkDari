class Appointment < ApplicationRecord
  has_many :infos, dependent: :destroy
  has_many :users, through: :infos

  has_many :notifications
  has_many :inviting_users, through: :notifications, source: :user

  # TODO: 유효성 검사
end