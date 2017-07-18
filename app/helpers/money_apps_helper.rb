module MoneyAppsHelper
  def builder?(user)
    user.money_infos.find_by(money_app_id: @money_app.id).builder
  end
end
