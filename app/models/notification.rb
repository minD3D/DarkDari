class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :requester, class_name: 'User'

  belongs_to :appointment

  def self.get_notification(invited_user, appointment_id)
    find_by(user_id: invited_user, appointment_id: appointment_id)
  end
end
