module AppointmentsHelper
  def builder?(user, appointment_id)
    user.infos.find_by(appointment_id: appointment_id).builder
  end

  def invited?(invited_user, appointment_id)

    if Info.where(user_id: invited_user, appointment_id: appointment_id).present?
      # 참여 중
      1
    elsif Notification.where(user_id: invited_user, appointment_id: appointment_id).present?
      # 초대 중
      2
    else
      # 암것도 아님
      3
    end

  end

  def get_notification_id(invited_user, appointment_id)
    Notification.get_notification(invited_user, appointment_id).id
  end
end
