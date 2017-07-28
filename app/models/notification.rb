class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :requester, class_name: 'User'

  def self.get_notification(invited_user, app_id)
    find_by(user_id: invited_user, app_id: app_id)
  end
end
