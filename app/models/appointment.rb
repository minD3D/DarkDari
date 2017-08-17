class Appointment < ApplicationRecord
  validates :title, :content, :deadline, :app_type, :period, presence: true

  has_many :infos, dependent: :destroy
  has_many :users, through: :infos

  has_many :notifications, dependent: :destroy
  has_many :inviting_users, through: :notifications, source: :user

end