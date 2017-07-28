module MoneyAppsHelper
  def builder?(user)
    user.money_infos.find_by(money_app_id: @money_app.id).builder
  end

  def invited?(invited_user, app_id)

    if MoneyInfo.where(user_id: invited_user, money_app_id: app_id).present?
      1
    elsif Notification.where(user_id: invited_user, app_id: app_id).present?
      2
    else
      3
    end

  end

  def get_notification_id(invited_user, app_id)
    Notification.get_notification(invited_user, app_id).id
  end
end
